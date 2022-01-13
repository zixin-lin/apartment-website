<%--
  Created by IntelliJ IDEA.
  User: 28490
  Date: 4/27/2020
  Time: 5:49 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Maintanance</title>
    <link href="css/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="css/common_style.css" rel="stylesheet" type="text/css">
    <link href="css/main_css.css" rel="stylesheet" type="text/css">
</head>
<body>
<jsp:include page="sessionCheckUser.jsp"></jsp:include>

<%--    <a href="userHome.jsp">Back</a><br />--%>
    <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="1" >
        <tr>
            <th class="option" style="background-color: white; color: black;"><a href="maintanance.jsp?option=request">Request Maintanance</a></th>
            <th class="option" style="background-color: white; color: black;"><a href="maintananceServlet?option=view">View My Maintanance</a></th>
        </tr>
    </table>

    <br /><hr /><br />

    <% if (request.getParameter("option") == null) {
        %>
    <p>${returnMsg}</p>

    <%
    }
    else {
        if (request.getParameter("option").equals("request")) {

    %>
    <form action="maintananceServlet" method="post">
        <textarea rows="5" cols="50" maxlength="100" name="description">
            Please describe your request.
        </textarea><br/><br/>
        <p>${returnMsg}</p><br />
        <input type="submit" value="submit request" /><br/>
    </form>



    <%
    } else if (request.getAttribute("listofMaintanance") != null || request.getParameter("option").equals("view")){
    %>
    <table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0">
        <tr>
            <th>Request Date</th>
            <th>Request Completed</th>
            <th>Description</th>
            <th>Completed</th>
        </tr>

        <c:forEach items="${listofMaintanance}" var="maintanance">
            <tr>
                <td>${maintanance.getYear()}-${maintanance.getMonth()}-${maintanance.getDay()}</td>
                <td>${maintanance.getFyear()}-${maintanance.getFmonth()}-${maintanance.getFday()}</td>
                <td>${maintanance.getDescription()}</td>
                <c:if test="${maintanance.getStatus()==true}">
                    <td>Acommplished</td>
                </c:if>
                <c:if test="${maintanance.getStatus()==false}">
                    <td>In progress</td>
                </c:if>
            </tr>
        </c:forEach>

    </table>

    <%
    } else {
    %>
    <p></p>
    <%
                }
        }%>

</body>
</html>
