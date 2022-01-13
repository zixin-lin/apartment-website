<%--
  Created by IntelliJ IDEA.
  User: 28490
  Date: 4/27/2020
  Time: 8:13 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Feedback</title>
    <link href="css/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="css/common_style.css" rel="stylesheet" type="text/css">
    <link href="css/main_css.css" rel="stylesheet" type="text/css">
</head>
<body>

<jsp:include page="sessionCheckUser.jsp"></jsp:include>

<%--<a href="userHome.jsp">Back</a><br />--%>

<form action="feedbackServlet" method="post">

    <textarea rows="5" cols="50" maxlength="100" name="feedback" style="top:200px;left:300px;">
            Please leave your feedback.
        </textarea><br/><br/>

    <input type="submit" value="submit feedback" /><br/>

</form>

<p>${returnMsg}</p>

</body>
</html>
