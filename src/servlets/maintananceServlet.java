package servlets;

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
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "maintananceServlet")
public class maintananceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String description = request.getParameter("description");
        String action = request.getParameter("action");
        List<MaintananceModel> listofMaintanance = new ArrayList<>();

        HttpSession session = request.getSession();
        UserModel userModel = (UserModel) session.getAttribute("user");
        MaintananceModel maintananceModel = null;

        MySQLdb db=MySQLdb.createInstance();

        if (description!=null) {

            System.out.println("add");

            try {
                boolean res = db.requestMaintanance(userModel, description);
                request.setAttribute("returnMsg", "success");
                RequestDispatcher rd = request.getRequestDispatcher("maintanance.jsp");
                rd.forward(request, response);

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }


        } else {

            if (action==null) {

                listofMaintanance = db.viewMaintanance(userModel);
                request.setAttribute("listofMaintanance", listofMaintanance);
                RequestDispatcher rd = request.getRequestDispatcher("maintanance.jsp");
                rd.forward(request, response);

            } else {
                int muid = Integer.parseInt(request.getParameter("muid"));
                String mdes = request.getParameter("mdes");
                System.out.println(muid);
                System.out.println(mdes);
                MaintananceModel maintananceModel1 = new MaintananceModel(muid,mdes);

                boolean res = db.maintananceDone(maintananceModel1);

                if (res) {
                    request.setAttribute("returnMsg", "Success");
                } else {
                    request.setAttribute("returnMsg", "Failed");
                }
                RequestDispatcher rd = request.getRequestDispatcher("managerHome.jsp");
                rd.forward(request, response);

            }

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
