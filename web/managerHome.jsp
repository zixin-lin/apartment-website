<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 28490
  Date: 4/27/2020
  Time: 9:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Manager Home</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <link href="css/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="css/common_style.css" rel="stylesheet" type="text/css">
    <link href="css/main_css.css" rel="stylesheet" type="text/css">
</head>
<body>

<jsp:include page="sessionCheckManager.jsp"></jsp:include>

<%
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat df = new SimpleDateFormat("HH:mm");
    String date = sdf.format(d);
    String now = df.format(d);
%>


<div id="top">
    <div id="top_logo" style="color:white;">
        Apartment Management
    </div>
    <div id="top_links">
        <div id="top_op">
            <ul>
                <li>
                    <img alt="currentUser" src="images/user.jpg">：
                    <span>${user.getName()}</span>
                </li>
                <li>
                    <img alt="thisMonth" src="images/month.jpg">：
                    <span id="yue_fen"><%= date%></span>
                </li>
                <li>
                    <img alt="today" src="images/date.jpg">：
                    <span id="day_day"><%= now%></span>
                </li>
            </ul>
        </div>
        <div id="top_close">
            <a href="LogoutServlet">
                <img alt="Logout" title="Logout" src="images/close.jpg" style="position: relative; top: 10px; left: 25px;">
            </a>
        </div>
    </div>
</div>

<div id="side">
    <div id="left_menu" style="width: 240px;background-color: #EDEDED;">
        <ul id="TabPage2" class="option" style="height:200px; margin-top:50px;color:black;">

            <li id="left_tab1">
                <a href="managerActionServlet?option=tenants">Show Tenants</a>
            </li>

            <li id="left_tab2">
                <a href="managerActionServlet?option=maintanance">View Maintanance Requests</a>
            </li>

            <li id="left_tab3">
                <a href="managerActionServlet?option=feedback">View Feedbacks</a>
            </li>

            <li id="left_tab4">
                <a href="index.jsp">Back to index</a>
            </li>

        </ul>
    </div>

</div>

<div id="main"  style="overflow: auto;top:120px;bottom:60px;">


<%
    if (request.getAttribute("listofBills") !=null) {
%>
<h4>Username: ${seletedUser.getName()}</h4><br />
<%--<h4>Tenant name: ${seletedUser.getFname()} ${seletedUser.getLname()}</h4><br />--%>

<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0" >
    <tr>
        <th>Year</th>
        <th>Month</th>
        <th>Total Amount</th>
    </tr>

    <c:forEach items="${listofBills}" var="bills">
        <tr>
            <td>${bills.getYear()}</td>
            <td>${bills.getMonth()}</td>
            <td>${bills.getAmount()}</td>
        </tr>
    </c:forEach>
</table>

<%
    }
%>
<% if (request.getAttribute("listofUsers")!= null) {
    %>

<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0" >
    <tr>
        <th>Username</th>
        <th>First name</th>
        <th>Last name</th>
        <th>Action</th>
    </tr>

    <c:forEach items="${listofUsers}" var="users">
        <tr>
            <td>${users.getName()}</td>
            <td>${users.getFname()}</td>
            <td>${users.getLname()}</td>
            <td><a href="managerActionServlet?option=viewPayment&username=${users.getName()}">View Payment</a></td>
        </tr>
    </c:forEach>

</table>

<%
    } else if(request.getAttribute("listofMaintanance")!= null) {
%>
<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0" >
    <tr>
        <th>Username</th>
        <th>Description</th>
        <th>Request Date</th>
        <th>Request Completed</th>
        <th>Status</th>
        <th>Change Status</th>
    </tr>

    <c:forEach items="${listofMaintanance}" var="maintanances">
        <tr>
            <td>${maintanances.getUserModel().getName()}</td>
            <td>${maintanances.getDescription()}</td>
            <td>${maintanances.getYear()}-${maintanances.getMonth()}-${maintanances.getDay()}</td>
            <c:if test="${maintanances.getFyear()==0}">
                    <td>In progress</td>
            </c:if>
            <c:if test="${maintanances.getFyear()!=0}">
                <td>${maintanances.getFyear()}-${maintanances.getFmonth()}-${maintanances.getFday()}</td>
            </c:if>

            <c:if test="${maintanances.getStatus()==false}">
                <td>In progress</td>
                <td><a href="maintananceServlet?action=changeStatus&muid=${maintanances.getUid()}&mdes=${maintanances.getDescription()}">Set Done</a></td>
            </c:if>
            <c:if test="${maintanances.getStatus()==true}">
                <td>Accomplished</td>
                <td>Already Done</td>
            </c:if>
        </tr>
    </c:forEach>

</table>


<%
    } else if (request.getAttribute("listofFeedback") != null){
%>
<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0" >
    <tr>
        <th>Username</th>
        <th>Feedback</th>
        <th>Date</th>
        <th>Operation</th>
    </tr>

    <c:forEach items="${listofFeedback}" var="feedbacks">
        <tr>
            <td>${feedbacks.getUserModel().getName()}</td>
            <td>${feedbacks.getFeedback()}</td>
            <td>${feedbacks.getYear()}-${feedbacks.getMonth()}-${feedbacks.getDay()}</td>
            <td><a href="feedbackServlet?action=delete&fuid=${feedbacks.getUid()}&ffb=${feedbacks.getFeedback()}">Delete</a></td>

        </tr>
    </c:forEach>

</table>

<%
    }
%>

    <p>${returnMsg}</p>
</div>

</body>
</html>
