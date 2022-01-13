<%--
  Created by IntelliJ IDEA.
  User: 28490
  Date: 4/27/2020
  Time: 9:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <!-- Meta tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Gadget Sign Up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design"
    />
    <script>
        addEventListener("load", function () { setTimeout(hideURLbar, 0); }, false); function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <link href="css/login/font-awesome.min.css" rel="stylesheet">
    <link href="css/login/style.css" rel='stylesheet' type='text/css' media="all">
    <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    <link href="//fonts.googleapis.com/css?family=Open+Sans:400,600,700" rel="stylesheet">
</head>

<body>
<form action="LoginServlet" method="post">
    <h1 class="error">Login Page</h1>
    <!---728x90--->
    <div class="w3layouts-two-grids">
        <!---728x90--->
        <div class="mid-class">
            <div class="img-right-side">
                <h3>Manage Your Apartment Account</h3>
                <p>A convinient way to manage your rental</p>
                <img src="images/b11.png" class="img-fluid" alt="">
            </div>
            <div class="txt-left-side">
                <h2> Login Here </h2>
                <form action="#" method="post">
                    <div class="form-left-to-w3l">
                        <input type="text" name="uname" placeholder="Username" required="">

                        <div class="clear"></div>
                    </div>
                    <div class="form-left-to-w3l">

                        <input type="password" name="pwd" placeholder="Password" required="">

                        <div class="clear"></div>
                    </div>
                    <div class="main-two-w3ls">
                        <span>${Msg}</span>
                        <div class="left-side-forget">
                            <input type="hidden" class="checked">

                        </div>
                        <div class="right-side-forget">
                            <a href="#" class="for"></a>
                        </div>
                    </div>
                    <div class="btnn">
                        <button type="submit">Login </button>
                    </div>
                </form>
                <div class="w3layouts_more-buttn">
                    <h3>Don't Have an account..?
                        <a href="signup.jsp">Sign up Here
                        </a>
                    </h3>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>

</form>
</body>

</html>
