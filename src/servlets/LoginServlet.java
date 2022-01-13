package servlets;

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

@WebServlet(name = "LoginServlet")
public class LoginServlet extends HttpServlet {

    String returnMsg = "Please check your username or password!";
    String redirect;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String uname = request.getParameter("uname");
        String pwd = request.getParameter("pwd");

        MySQLdb db = MySQLdb.createInstance();
        UserModel userModel = db.doLogin(uname, pwd);

        if (userModel != null) {
            HttpSession session = request.getSession();
            session.setAttribute("user",userModel);
            if (userModel.getAuthority() == 0) {
                redirect = "userHome.jsp";
            } else {
                redirect = "managerHome.jsp";
            }
        } else {
            redirect = "login.jsp";
        }
        request.setAttribute("Msg", returnMsg);
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
