<%-- 
    Document   : addUser
    Created on : 03.Ara.2020, 01:47:18
    Author     : uğur kerim
--%>

<%@page import="model.Employee"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.math.BigInteger"%>
<%@page import="java.security.MessageDigest"%>
<%@page import="java.util.UUID"%>
<%@page import="functions.DashboardFunctions" contentType="text/html" pageEncoding="UTF-8" session="true"%>
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
        if(session.getAttribute("role_id").equals("2")||session.getAttribute("role_id").equals("4")||session.getAttribute("role_id").equals("3") ){
            response.sendRedirect("dashboard");
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
        <div class="container">
    <div class="row">
        <div class="col-7">
            <h2>Çalışanlar</h2>
            <div class="container-fluid shadow border rounded">
                <table class="table table-striped">
                    <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Ad</th>
                                <th scope="col">Soyad</th>
                                <th scope="col">Email</th>
                                <th scope="col">Rol</th>
                                <th scope="col">Düzenle</th>
                            </tr>
                    </thead>
                    <tbody>
                            
                        <%
                            DashboardFunctions df = new DashboardFunctions();
                            List<Employee> list = df.getEmployees((String)session.getAttribute("company_id") , (String)session.getAttribute("user_id"));
                            for (int i = 0; i < list.size(); i++) {        
                        %>
                        <tr>
                            <td scope="row"><%=i+1%></td>
                            <td scope="col" class="name"><%=list.get(i).getName()%></td>
                            <td scope="col" class="surname"><%=list.get(i).getSurname()%></td>
                            <td scope="col" class="email"><%=list.get(i).getEmail()%></td>
                            <td scope="col" class="role"><%=list.get(i).getRole_id()%></td>
                            <td><button type="button" class="btn btn-primary use-address" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">...</button></td>
                            <td class="user-id" style="display:none"><%= list.get(i).getUser_id() %></td>
                        </tr>
                        <%} df.CloseCon(); %>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="col-5">
            <h2>Çalışan Ekle</h2>
            <div id='box' class="container-fluid center  border rounded bg-light shadow" >
                <form method="post" action='EmployeeOpt'>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inputEmail4">Ad</label>
                            <input type="text" class="form-control" id="inputCompany" name="name" required>
                        </div>
                        <div class="form-group col-6">
                            <label for="inputEmail4">Soyad</label>
                            <input type="text" class="form-control" id="inputCompany" name="surname" required>
                        </div>
                    </div>
                    <div class="form-row">
                        <label for="inputState">Rol</label>
                        <select id="inputState" class="form-control" name="role_id">
                            <option value="1" selected>İşletme Sahibi</option>
                            <option value="2">Ürün Müdürü</option>
                            <option value="3">Ürün Danışmanı</option>
                            <option value="4">Hesap Müdürü</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <div class="form-group">
                            <label for="inputEmail">Email</label>
                            <input type="email" class="form-control" placeholder="asd@..mail.com" name="email" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Şifre</label>
                        <input readonly class="form-control" value="<%=String.valueOf(UUID.randomUUID().toString().substring(0, 8))%>" name="password" required>
                    </div>
                    <div class="form-group">
                        <input type="hidden" name="company_id" value="<%=session.getAttribute("company_id")%>">
                        <input type="hidden" name="action" value="add">
                        <input type="submit" class="btn btn-primary" value="Kayıt Et">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Çıkarmak istediğinizden emin misiniz?</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="get" action="EmployeeOpt">
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inputEmail4">Ad</label>
                            <input readonly type="text" class="form-control" id="inputName" name="name">
                        </div>
                        <div class="form-group col-6">
                            <label for="inputEmail4">Soyad</label>
                            <input readonly type="text" class="form-control" id="inputSurname" name="surname">
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inputEmail">Email</label>
                            <input readonly type="text" class="form-control" id="inputEmail" name="email">
                        </div>
                        <div class="form-group col-6">
                            <label for="inputRole">Rol</label>
<!--                            <input type="text" class="form-control" id="inputRole" name="role_id">-->
                            <select class="form-control" id="inputRole" name="role_id">
                                <option value="1">İşletme Sahibi</option>
                                <option value="2">Ürün Müdürü</option>
                                <option value="3">Ürün Danışmanı</option>
                                <option value="4">Hesap Müdürü</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" class="form-control" id="userID" name="user_id">
                        <button type="submit" class="btn btn-warning" name="action" value="edit">Düzenle</button>
                        <button type="submit" class="btn btn-danger" name="action" value="delete">Çıkar</button>
                    </div>
                </form>
            </div>
            
        </div>
    </div>
</div>
    </div>

<script>
    $(".use-address").click(function () {
        var $row = $(this).closest("tr");    // Find the row
        var $user_id = $row.find(".user-id").text(); // Find the text
        var $name = $row.find(".name").text();
        var $surname = $row.find(".surname").text();
        var $email = $row.find(".email").text();
        var $role = $row.find(".role").text();
        // Let's test it out
        //alert($user_id+$name+$surname);
        $("#inputName").val($name);
        $("#inputSurname").val($surname);
        $("#inputEmail").val($email);
        if($role =="İşletme Sahibi"){
            $("#inputRole").val("1");
        }
        else if($role=="Ürün Müdürü"){
            $("#inputRole").val("2");
        }
        else if($role=="Ürün Danışmanı"){
            $("#inputRole").val("3");
        }
        else if($role=="Hesap Müdürü"){
            $("#inputRole").val("4");
        }
        
        $("#userID").val($user_id);
    });
</script>
</body>
</html>
