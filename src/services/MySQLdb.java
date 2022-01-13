package services;

import com.sun.tools.javac.Main;
import models.BillModel;
import models.FeedbackModel;
import models.MaintananceModel;
import models.UserModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class MySQLdb {

    private Connection connection = null;
    private static MySQLdb instance = null;
    String url = "jdbc:mysql://localhost:3306/apartment";
    String username = "root";
    String password = "root";

    private MySQLdb() {
        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            connection = DriverManager.getConnection(url,username, password);

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public static synchronized MySQLdb createInstance() {
        if (instance == null) {
            instance = new MySQLdb();
        }
        return instance;
    }

    public UserModel doLogin(String uname, String pwd){

        UserModel userModel = null;
        String qUserLogin = "select * from users where username=? and password=?";

        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(qUserLogin);
            ps.setString(1,uname);
            ps.setString(2,pwd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                int authority = rs.getInt("authority");
                userModel = new UserModel(uname, fname, lname, authority);
            }
            ps.close();
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userModel;
    }

    public boolean doRegister(UserModel userModel) throws SQLException {
        boolean response;
        boolean userExists = userExists(userModel.getName());

        if (userExists) {
            response = false;
        } else {
            String qRegister = "insert into users values(0,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(qRegister);
            ps.setString(1,userModel.getName());
            ps.setString(2,userModel.getPassword());
            ps.setString(3,userModel.getFname());
            ps.setString(4,userModel.getLname());
            ps.setInt(5,0);

            ps.executeUpdate();
            ps.close();
            response = true;
        }

        return response;
    }

    private boolean userExists(String uname) {
        boolean response = false;
        String qUserExists = "select count(*) from users where username=?";
        try {
            PreparedStatement ps = connection.prepareStatement(qUserExists);
            ps.setString(1,uname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt(1)>0) {
                    response = true;
                }
            }
            ps.close();
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return response;
    }

    public List<BillModel> getBalance(UserModel userModel) {
        List<BillModel> listofBills = new ArrayList<>();

        String qgetBillList = "select * from bills where uid=? order by month desc, year desc";

        try {
            PreparedStatement ps = connection.prepareStatement(qgetBillList);
            ps.setInt(1,getUidByName(userModel.getName()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int amount = rs.getInt("amount");
                int rental = rs.getInt("rental");
                int power = rs.getInt("power");
                int tax = rs.getInt("tax");
                int month = rs.getInt("month");
                int year = rs.getInt("year");

                BillModel billModel = new BillModel(amount,rental,power,tax,month,year);
                listofBills.add(billModel);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listofBills;
    }

    public UserModel getUnameById(int uid) {

        UserModel userModel = null;
        String qUser = "select * from users where uid=?";

        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(qUser);
            ps.setInt(1, uid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                String username = rs.getString("username");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                userModel = new UserModel(username,fname,lname, 0);
            }
            ps.close();
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return userModel;
    }

    public int getUidByName(String uname) {

        int uid = -1;
        String qUser = "select * from users where username=?";

        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(qUser);
            ps.setString(1, uname);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                uid = rs.getInt("uid");
            }
            ps.close();
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return uid;
    }

    public boolean requestMaintanance(UserModel userModel, String description) throws SQLException {
        boolean response = false;
        String qReserve = "insert into maintanance values (null,?,?,?,?,?,null,null,null,?)";

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int day = cal.get(Calendar.DATE);

        PreparedStatement ps = connection.prepareStatement(qReserve);
        ps.setInt(1,getUidByName(userModel.getName()));
        ps.setString(2,description);
        ps.setInt(3,year);
        ps.setInt(4,month);
        ps.setInt(5,day);
        ps.setBoolean(6,false);
        ps.executeUpdate();
        response = true;
        ps.close();

        return response;
    }

    public List<MaintananceModel> viewMaintanance(UserModel userModel) {
        List<MaintananceModel> listofMaintanance = new ArrayList<>();
        String qgetMaintananceList = "select * from maintanance where uid=?";

        try {
            PreparedStatement ps = connection.prepareStatement(qgetMaintananceList);
            ps.setInt(1,getUidByName(userModel.getName()));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String description = rs.getString("description");
                int year = rs.getInt("year");
                int month = rs.getInt("month");
                int day = rs.getInt("day");
                int fyear = rs.getInt("fyear");
                int fmonth = rs.getInt("fmonth");
                int fday = rs.getInt("fday");
                boolean status = rs.getBoolean("status");

                MaintananceModel maintananceModel = new MaintananceModel(description,year,month,day,fyear,fmonth,fday,status);
                listofMaintanance.add(maintananceModel);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listofMaintanance;
    }

    public boolean leaveFeedback(UserModel userModel, String feedback) throws SQLException {
        boolean response = false;
        String qReserve = "insert into feedback values (null,?,?,?,?,?)";

        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int day = cal.get(Calendar.DATE);

        PreparedStatement ps = connection.prepareStatement(qReserve);
        ps.setInt(1,getUidByName(userModel.getName()));
        ps.setString(2,feedback);
        ps.setInt(3,year);
        ps.setInt(4,month);
        ps.setInt(5,day);
        ps.executeUpdate();
        response = true;
        ps.close();

        return response;
    }

    public List<UserModel> getUsers() {
        List<UserModel> listofUsers = new ArrayList<>();
        String getUserList = "select * from users where authority=0";

        try {
            PreparedStatement ps = connection.prepareStatement(getUserList);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                UserModel userModel = new UserModel(username,fname,lname,0);
                listofUsers.add(userModel);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listofUsers;
    }

    public List<MaintananceModel> getMaintanances() {
        List<MaintananceModel> listofMaintanance = new ArrayList<>();
        String getUserList = "select * from maintanance";

        try {
            PreparedStatement ps = connection.prepareStatement(getUserList);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserModel userModel = getUnameById(rs.getInt("uid"));
                int uid = rs.getInt("uid");
                String description = rs.getString("description");
                int year = rs.getInt("year");
                int month = rs.getInt("month");
                int day = rs.getInt("day");
                int fyear = rs.getInt("fyear");
                int fmonth = rs.getInt("fmonth");
                int fday = rs.getInt("fday");
                boolean status = rs.getBoolean("status");
                MaintananceModel maintananceModel = new MaintananceModel(uid,description,year,month,day,fyear,fmonth,fday,status);
                maintananceModel.setUserModel(userModel);
                listofMaintanance.add(maintananceModel);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listofMaintanance;
    }

    public List<FeedbackModel> getFeedbacks() {
        List<FeedbackModel> listofFeedback = new ArrayList<>();
        String getFeedbackList = "select * from feedback";

        try {
            PreparedStatement ps = connection.prepareStatement(getFeedbackList);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                UserModel userModel = getUnameById(rs.getInt("uid"));
                int uid = rs.getInt("uid");
                String feedback = rs.getString("feedback");
                int year = rs.getInt("year");
                int month = rs.getInt("month");
                int day = rs.getInt("day");
                FeedbackModel feedbackModel = new FeedbackModel(uid,feedback,year,month,day);
                feedbackModel.setUserModel(userModel);
                listofFeedback.add(feedbackModel);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return listofFeedback;
    }

    public boolean maintananceDone(MaintananceModel maintananceModel) {
        boolean response = false;
        String qSetDone = "update maintanance set status=true,fyear=?,fmonth=?,fday=? where mid=?";

        try {
            PreparedStatement ps = connection.prepareStatement(qSetDone);
            int mid = getmidByUM(maintananceModel.getUid(), maintananceModel.getDescription());
            Calendar cal = Calendar.getInstance();
            int year = cal.get(Calendar.YEAR);
            int month = cal.get(Calendar.MONTH)+1;
            int day = cal.get(Calendar.DATE);
            ps.setInt(1,year);
            ps.setInt(2,month);
            ps.setInt(3,day);
            ps.setInt(4,mid);

            ps.executeUpdate();
            response = true;
            ps.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }


        return response;
    }

    private int getmidByUM(int uid, String description) {
        int mid = -1;
        String qMaintanance = "select * from maintanance where uid=? and description like ?";

        PreparedStatement ps = null;
        try {
            ps = connection.prepareStatement(qMaintanance);
            ps.setInt(1, uid);
            ps.setString(2, "%"+description+"%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                mid = rs.getInt("mid");
            }
            ps.close();
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return mid;
    }

    public boolean deleteFeedback(FeedbackModel feedbackModel) {
        boolean response = false;
        String qdeleteFeedback = "delete from feedback where fid=?";

        try {
            PreparedStatement ps = connection.prepareStatement(qdeleteFeedback);
            int fid=getFidByUF(feedbackModel.getUid(), feedbackModel.getFeedback());

            ps.setInt(1,fid);
            ps.executeUpdate();
            response = true;
            ps.close();

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return response;
    }

    private int getFidByUF(int uid, String feedback) {
        int fid=-1;
        String qgetFid = "select * from feedback where uid=? and feedback like ?";

        try {
            PreparedStatement ps=connection.prepareStatement(qgetFid);
            ps.setInt(1,uid);
            ps.setString(2,"%"+feedback+"%");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                fid = rs.getInt("fid");
            }
            ps.close();
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return fid;
    }

    public boolean checkOldpwd (String oldpwd, UserModel userModel) {
        boolean response = false;
        String qCheckPwd = "select * from users where username=?";
        String password = null;

        try {
            PreparedStatement ps=connection.prepareStatement(qCheckPwd);
            ps.setString(1,userModel.getName());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                password = rs.getString("password");
            }
            ps.close();
            rs.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        if (password.equals(oldpwd)) {
            response = true;
        }
        return response;
    }

    public boolean editProfile (String newname, String newpwd, UserModel userModel) {
        boolean response = false;
        String qupdateInfo = "update users set username=?, password=? where uid=?";

        if(userExists(newname)) {
            if (!newname.equals(userModel.getName())) {
                return response;
            }
        }
        try {
            PreparedStatement ps = connection.prepareStatement(qupdateInfo);
            ps.setString(1, newname);
            ps.setString(2, newpwd);
            ps.setInt(3, getUidByName(userModel.getName()));
            ps.executeUpdate();
            response = true;
            ps.close();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return response;
    }
}
