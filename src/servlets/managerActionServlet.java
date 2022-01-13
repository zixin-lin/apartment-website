package servlets;

import models.BillModel;
import models.FeedbackModel;
import models.MaintananceModel;
import models.UserModel;
import services.MySQLdb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

@WebServlet(name = "managerActionServlet")
public class managerActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String option = request.getParameter("option");

        System.out.println(option);

        HttpSession session = request.getSession();
        UserModel userModel = (UserModel) session.getAttribute("user");
        BillModel curBill = null;

        //get time
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int day = cal.get(Calendar.DATE);

        MySQLdb db = MySQLdb.createInstance();

        if (option.equals("tenants")) {

            List<UserModel> listofUsers = new ArrayList<>();
            listofUsers = db.getUsers();

            request.setAttribute("listofUsers", listofUsers);
            RequestDispatcher rd = request.getRequestDispatcher("managerHome.jsp");
            rd.forward(request, response);
        }
        else if (option.equals("maintanance")){

            List<MaintananceModel> listofMaintanance = new ArrayList<>();
            listofMaintanance = db.getMaintanances();

            request.setAttribute("listofMaintanance", listofMaintanance);
            RequestDispatcher rd = request.getRequestDispatcher("managerHome.jsp");
            rd.forward(request, response);

        }
        else if (option.equals("feedback")){

            List<FeedbackModel> listofFeedback = new ArrayList<>();
            listofFeedback = db.getFeedbacks();

            request.setAttribute("listofFeedback", listofFeedback);
            RequestDispatcher rd = request.getRequestDispatcher("managerHome.jsp");
            rd.forward(request, response);
        }
        else if (option.equals("viewPayment")) {

            String username = request.getParameter("username");
            UserModel userModel1 = new UserModel(username);

            List<BillModel> listofBills = new ArrayList<>();
            listofBills = db.getBalance(userModel1);

            //get current balance
            for (BillModel billModel:listofBills) {
                if (billModel.getMonth() == month && billModel.getYear() == year) {
                    int amount = billModel.getAmount();
                    int rental = billModel.getRental();
                    int power = billModel.getPower();
                    int tax = billModel.getTax();
                    curBill = new BillModel(amount, rental, power, tax, month, year);
                    break;
                }
            }

            if (curBill == null) {
                curBill = new BillModel(0,0,0,0,month,year);
            }

            request.setAttribute("seletedUser", userModel1);
            request.setAttribute("listofBills", listofBills);
            RequestDispatcher rd = request.getRequestDispatcher("managerHome.jsp");
            rd.forward(request, response);
        }

    }
}
