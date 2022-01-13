package servlets;

import models.FeedbackModel;
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

@WebServlet(name = "feedbackServlet")
public class feedbackServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String feedback = request.getParameter("feedback");
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        UserModel userModel = (UserModel) session.getAttribute("user");

        MySQLdb db=MySQLdb.createInstance();

        if (feedback!=null) {

            try {
                boolean res = db.leaveFeedback(userModel, feedback);
                request.setAttribute("returnMsg", "success");
                RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
                rd.forward(request, response);

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        } else {

            if (action==null) {
                request.setAttribute("returnMsg", "failed");
                RequestDispatcher rd = request.getRequestDispatcher("feedback.jsp");
                rd.forward(request, response);
            } else {

                int fuid=Integer.parseInt(request.getParameter("fuid"));
                String ffb = request.getParameter("ffb");

                FeedbackModel feedbackModel = new FeedbackModel(fuid,ffb);
                boolean res = db.deleteFeedback(feedbackModel);

                if (res) {
                    request.setAttribute("returnMsg", "Delete successfully");
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
