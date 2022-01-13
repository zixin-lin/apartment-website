<%@ page import="models.UserModel" %><%--
  Created by IntelliJ IDEA.
  User: 28490
  Date: 4/28/2020
  Time: 4:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String returnMsg = "Please login to continue!";
    String redirect = "login.jsp";
    if (session.getAttribute("user") == null) {
        request.setAttribute("Msg", returnMsg);
        RequestDispatcher rd = request.getRequestDispatcher(redirect);
        rd.forward(request,response);
    } else{

        UserModel userModel = (UserModel)session.getAttribute("user");

        if (userModel.getAuthority() == 0) {
            redirect = "userHome.jsp";
            RequestDispatcher rd = request.getRequestDispatcher(redirect);
            rd.forward(request, response);
        }
    }
%>
