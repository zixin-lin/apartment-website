package servlets;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import models.BillModel;
import models.UserModel;
import services.MySQLdb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

@WebServlet(name = "userActionServlet")
public class userActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        request.setCharacterEncoding("utf-8");
        String option = request.getParameter("option");

        HttpSession session = request.getSession();
        UserModel userModel = (UserModel) session.getAttribute("user");
        BillModel curBill = null;

        //get time
        Calendar cal = Calendar.getInstance();
        int year = cal.get(Calendar.YEAR);
        int month = cal.get(Calendar.MONTH)+1;
        int day = cal.get(Calendar.DATE);

        MySQLdb db = MySQLdb.createInstance();

        if (option.equals("balance")) {

            List<BillModel> listofBills = new ArrayList<>();
            listofBills = db.getBalance(userModel);

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

            request.setAttribute("curBill", curBill);
            request.setAttribute("listofBills", listofBills);
            RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
            rd.forward(request, response);
        }
        else if (option.equals("maintanance")){

            request.setAttribute("redirect","maintanance.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
//            RequestDispatcher rd = request.getRequestDispatcher("maintanance.jsp");
            rd.forward(request, response);

        }
        else if (option.equals("feedback")){
            request.setAttribute("redirect","feedback.jsp");
            RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
            rd.forward(request, response);
        }
        else if (option.equals("edit")) {

            String nname = request.getParameter("username");
            String oldpwd = request.getParameter("oldpwd");
            String newpwd = request.getParameter("newpwd");

            if(db.checkOldpwd(oldpwd, userModel)) {

                if (db.editProfile(nname,newpwd, userModel)) {
                    request.setAttribute("returnMsg", "Done!");
                    request.setAttribute("page", "editReturn");
                } else {
                    request.setAttribute("returnMsg", "Failed!");
                    request.setAttribute("page", "editReturn");
                }
            } else {

                request.setAttribute("returnMsg", "Wrong password!");
                request.setAttribute("page", "editReturn");
            }

            RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
            rd.forward(request, response);
        }

    }
}
