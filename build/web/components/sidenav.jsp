<%-- 
    Document   : sidenav
    Created on : 01.Ara.2020, 03:02:43
    Author     : uğur kerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            .sidenav {
                height: 100%;
                width: 250px;
                position: fixed;
                z-index: 1;
                top: 0;
                left: 0;
                background-color: #111;
                overflow-x: hidden;
                transition: 0.5s;
                padding-top: 60px;
            }
            .sidenav a {
                width: 167px;
                margin: 10px;
                text-decoration: none;
                font-size: 15px;
                color: black;
                display: block;
                transition: 0.3s;
            }

            .sidenav a:hover {
                background-color: green;
            }

            #main {
                transition: margin-left .5s;
                padding: 16px;
                margin-left: 250px;
            }

            @media screen and (max-height: 450px) {
                .sidenav {padding-top: 15px;}
                .sidenav a {font-size: 18px;}
            }
        </style>
    </head>
    <body>
    <div id="mySidenav" class="sidenav bg-light" style="white-space: nowrap;">
        <h3 class="text-center">Kullanıcı</h3>
        <div class="container card col-10 text-center" >
            <img id="photo" src="data:image/jpg;base64,<%=session.getAttribute("baseImage")%>" class="rounded-circle" style="width: 50px; height: 50px;margin: auto; margin-top: 5px;">
                <h6><%=session.getAttribute("email")%></h6>
                <h5><%=session.getAttribute("name")%></h5> 

                <c:set var = "role_id" scope = "session" value = "${sessionScope['role_id']}"/>
                <c:choose>
                    <c:when test = "${role_id == 1}">
                        İşletme Sahibi
                    </c:when>
                    <c:when test = "${role_id == 2}">
                        Ürün Yöneticisi
                    </c:when>
                    <c:when test = "${role_id == 3}">
                        Ürün Danışmanı
                    </c:when>
                    <c:when test = "${role_id == 4}">
                        Hesap Müdürü
                    </c:when>
                </c:choose>

                <h5><%=session.getAttribute("company_name")%></h5>
        </div>
        <h3 class="text-center">Menu</h3>
        <div class="container col-11 card " >
            <ul class="nav nav-pills nav-stacked">
                <c:set var = "role_id" scope = "session" value = "${sessionScope['role_id']}"/>
                <c:choose>
                    <c:when test = "${role_id == 1}">
                        <li class="nav-item">
                            <a id="dashboard" class="nav-link"  href="dashboard"><i class="fa fa-fw fa-home"></i> Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a id="products" class="nav-link" href="products"><i class="fab fa-product-hunt"></i> Ürünler</a>
                        </li>
                        <li class="nav-item">
                            <a id="sales" class="nav-link" href="sales"><i class="fas fa-shopping-cart"></i> Satış</a>
                        </li>
                        <li class="nav-item">
                            <a id="order" class="nav-link" href="order"><i class="fas fa-shopping-basket"></i> Sipariş</a>
                        </li>
                        <li class="nav-item">
                            <a id="bills" class="nav-link" href="bills"><i class="fas fa-cash-register"></i> Faturalar</a>
                        </li>
                        <li class="nav-item">
                            <a id="employee" class="nav-link" href="employee"><i class="fas fa-user-alt"></i> Çalışanlar</a>
                        </li>
                        <li class="nav-item">
                            <a id="profile" class="nav-link" href="profile"><i class="fas fa-user-alt"></i> Hesap</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogOutProcess"><i class="fa fa-close"></i> Çıkış</a>
                        </li>
                    </c:when>
                    <c:when test = "${role_id == 2}">

                        <li class="nav-item">
                            <a id="dashboard" class="nav-link"  href="dashboard"><i class="fa fa-fw fa-home"></i> Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a id="products" class="nav-link" href="products"><i class="fab fa-product-hunt"></i> Ürünler</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogOutProcess"><i class="fa fa-close"></i> Çıkış</a>
                        </li>
                    </c:when>
                    <c:when test = "${role_id == 3}">
                        Ürün Daışmanı
                        <li class="nav-item">
                            <a id="dashboard" class="nav-link"  href="dashboard"><i class="fa fa-fw fa-home"></i> Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a id="sales" class="nav-link" href="sales"><i class="fas fa-shopping-cart"></i> Satış</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogOutProcess"><i class="fa fa-close"></i> Çıkış</a>
                        </li>
                    </c:when>
                    <c:when test = "${role_id == 4}">
                        <li class="nav-item">
                            <a id="dashboard" class="nav-link"  href="dashboard"><i class="fa fa-fw fa-home"></i> Dashboard</a>
                        </li>
                        <li class="nav-item">
                            <a id="profile" class="nav-link" href="profile"><i class="fas fa-user-alt"></i> Hesap</a>
                        </li>
                        <li class="nav-item">
                            <a id="bills" class="nav-link" href="bills"><i class="fas fa-cash-register"></i> Faturalar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogOutProcess"><i class="fa fa-close"></i> Çıkış</a>
                        </li>
                    </c:when>
                </c:choose>

            </ul>  
        </div>
    </div>
    <script>
        $(window).bind("load", function () {

            if (window.location.pathname == "/muhasebem/dashboard") {
                $('#dashboard').addClass("active");
            } else if (window.location.pathname == "/muhasebem/products") {
                $('#products').addClass("active");
            } else if (window.location.pathname == "/muhasebem/bills") {
                $('#bills').addClass("active");
            } else if (window.location.pathname == "/muhasebem/employee") {
                $('#employee').addClass("active");
            } else if (window.location.pathname == "/muhasebem/profile") {
                $('#profile').addClass("active");
            } else if (window.location.pathname == "/muhasebem/sales") {
                $('#sales').addClass("active");
            } else if (window.location.pathname == "/muhasebem/order") {
                $('#order').addClass("active");
            } else if (window.location.pathname == "/muhasebem/bills") {
                $('#bills').addClass("active");
            }
        });
        function openNav() {
            if (document.getElementById("mySidenav").style.width === "250px") {
                document.getElementById("mySidenav").style.width = "0";
                document.getElementById("main").style.marginLeft = "0";
            } else {
                document.getElementById("mySidenav").style.width = "250px";
                document.getElementById("main").style.marginLeft = "250px";
            }
        }
        <%
            if (session.getAttribute("baseImage") == null) {
        %>
            $('#photo').attr("src","images/img_avatar1.png");
        <%
            }
        %>


    </script>
</body>
</html>
