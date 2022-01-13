package servlets;

import models.UserModel;
import services.MySQLdb;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "RegisterServlet")
public class RegisterServlet extends HttpServlet {

    String returnMsg;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String pwd = request.getParameter("pwd");
        String pwd_confirm = request.getParameter("pwd_confirm");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");

        if (pwd.equals(pwd_confirm)) {
            MySQLdb db = MySQLdb.createInstance();

            UserModel userModel = new UserModel(uname, pwd, fname, lname, 0);

            try {
                boolean userRegisterAction = db.doRegister(userModel);

                if (userRegisterAction) {
                    returnMsg = "Registration succeeded!";
                } else {
                    returnMsg = "Registration failed! Username already exists!";
                }

            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }

        } else {
            returnMsg = "Two input passwords must be consistent!";
        }

        request.setAttribute("Msg", returnMsg);
        RequestDispatcher rd = request.getRequestDispatcher("signup.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
