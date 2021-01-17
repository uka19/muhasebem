<%-- 
    Document   : home
    Created on : 30.Kas.2020, 01:28:16
    Author     : uğur kerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
        
    </head>
<body>
    <%
        if(session.getAttribute("email")==null){
            response.sendRedirect("login");
        }
    %>
    <%@include file="components/sidenav.jsp" %>
    <div id="main">
        <nav class="navbar navbar-light bg-dark">
            <span style="font-size:25px;cursor:pointer" onclick="openNav()">&#9776;</span>
            <a class="navbar-brand text-white" href="#">
                <img src="images/muhasebe.jpeg" width="30" height="30" class="d-inline-block align-top " alt="">
                    Muhasebe'm
            </a>
        </nav>
        <div class="tab-content">
            <div id="dashboard" class="container tab-pane active"><br>
                
            </div>
            <div id="products" class="container tab-pane fade"><br>
                
            </div>
            <div id="addUser" class="container tab-pane fade"><br>
                
            </div>
            <div id="bills" class="container tab-pane fade"><br>
                
            </div>
            <div id="account" class="container tab-pane fade"><br>
                
            </div>
        </div>
    </div>
</body>
</html>
