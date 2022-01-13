<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %><%--
  Created by IntelliJ IDEA.
  User: 28490
  Date: 4/26/2020
  Time: 11:21 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Home</title>
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/echarts.js"></script>
    <script type="text/javascript" src="js/jquery.dataTables.js"></script>
    <script type="text/javascript" src="js/jquery.ztree.core-3.2.js"></script>

    <link href="css/zTreeStyle.css" rel="stylesheet" type="text/css">
    <link href="css/jquery.dataTables.css" rel="stylesheet" type="text/css">
    <link href="css/basic_layout.css" rel="stylesheet" type="text/css">
    <link href="css/common_style.css" rel="stylesheet" type="text/css">
    <link href="css/main_css.css" rel="stylesheet" type="text/css">
</head>

<body>

<%--<form action="userActionServlet" method="post">--%>
<%--    <% List<String> options = new ArrayList<>();--%>
<%--        options.add("Show balance");--%>
<%--        options.add("Maintanance");--%>
<%--        options.add("Feedback");--%>
<%--    %>--%>

<jsp:include page="sessionCheckUser.jsp"></jsp:include>

<%
    Date d = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    SimpleDateFormat df = new SimpleDateFormat("HH:mm");
    String date = sdf.format(d);
    String now = df.format(d);
%>


<div id="top">
    <div id="top_logo" style="color:white;">
        Apartment User Home
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
                <a href="userActionServlet?option=balance">Show balance</a>
            </li>

            <li id="left_tab2">
                <a href="userActionServlet?option=maintanance">Maintanance</a>
            </li>

            <li id="left_tab3">
                <a href="userActionServlet?option=feedback">Feedback</a>
            </li>

            <li id="left_tab4">
                <a href="userHome.jsp?page=edit">Edit profile</a>
            </li>

            <li id="left_tab5">
                <a href="index.jsp">Back to index</a>
            </li>

        </ul>
    </div>

</div>

<div id="main"  style="overflow: auto;top:120px;bottom:60px;">



<%
    if(request.getParameter("page") == null && request.getAttribute("page")==null && request.getAttribute("curBill")!=null) {
%>

<h3 style="text-align: center">Current Balance</h3>

<div id="container">
<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0">
    <tr>
        <th>Rental</th>
        <th>Power</th>
        <th>Tax</th>
        <th>Total balance</th>
    </tr>

    <tr>
        <td>${curBill.getRental()}</td>
        <td>${curBill.getPower()}</td>
        <td>${curBill.getTax()}</td>
        <td>${curBill.getAmount()}</td>
    </tr>

</table>

<div id="pieChart" style="width:600px; height:400px;left:25%;right:25%;"></div>

    <h3 style="text-align: center">History</h3>


<table class="table" cellspacing="0" cellpadding="0" width="100%" align="center"  border="0">
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
</div>
<%
    } else if (request.getParameter("page")!=null){
%>
<form action="userActionServlet" method="post">
    new username:<input type="text" name="username" /><br /><br />
    password:<input type="password" name="oldpwd" /><br /><br />
    new password:<input type="password" name="newpwd" /><br /><br />
    <input type="hidden" value="edit" name="option" />
<p>${returnMsg}</p>

<input type="submit" value="Submit Change" /><br/>

</form>

<%
    } else if(request.getAttribute("redirect") != null) {
%>

    <iframe name="right" id="rightMain" src=${redirect} frameborder="no" scrolling="auto" width="100%" height="100%" allowtransparency="true"/>

    <%
        }
    %>
</div>





<script type="text/javascript">

    var myChart = echarts.init(document.getElementById('pieChart'));

    option = {
        title : {
            text: 'Current Balance',
            subtext: '',
            x:'center'
        },
        tooltip : {
            trigger: 'item',
            formatter: "{a} <br/>{b} : {c} ({d}%)"
        },
        legend: {
            orient : 'vertical',
            x : 'left',
            data:[]
        },
        toolbox: {
            show : false,
            feature : {
                mark : {show: true},
                dataView : {show: true, readOnly: false},
                magicType : {
                    show: true,
                    type: ['pie', 'funnel'],
                    option: {
                        funnel: {
                            x: '25%',
                            width: '50%',
                            funnelAlign: 'left',
                            max: 1548
                        }
                    }
                },
                restore : {show: true},
                saveAsImage : {show: true}
            }
        },
        calculable : true,
        series : [
            {
                name:'',
                type:'pie',
                radius : '55%',
                center: ['50%', '60%'],
                data:[]
            }
        ]
    };
    ;
    if (option && typeof option === "object") {
        myChart.setOption(option, true);
    }

    $(document).ready(function() {
        // function sleep(ms) {
        //     return new Promise(resolve =>
        //         setTimeout(resolve, ms)
        //     )
        // }
        // sleep(1000).then(()=>{
            var rental =${curBill.getRental()};
            var power = ${curBill.getPower()};
            var tax = ${curBill.getTax()};
            var amount = ${curBill.getAmount()};

            myChart.setOption({
                // legend: {
                //     data: names
                // },
                series: {

                    name: 'Category',
                    data: [
                        {value: rental, name:'rental'},
                        {value: power, name:'power'},
                        {value: tax, name:'tax'}
                    ]
                }
            });
        })

</script>


</body>
</html>
