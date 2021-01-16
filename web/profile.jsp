<%-- 
    Document   : profile
    Created on : 12.Ara.2020, 02:17:25
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
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
    <%
        if (session.getAttribute("email") == null) {
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
    <div class="container-fluid">
        <div class="row">
            <div class="col-5">
                <h2>Profil</h2>
                <div class="card mt-5 bg-warning shadow">
                    <img id="profile_photo" class="card-img-top img-thumbnail rounded mx-auto" src="data:image/jpg;base64,<%=session.getAttribute("baseImage")%>" alt="Card image" style="width: 250px;height:250px" >
                        <div class="card-body">
                            <form method="post" action='ProfileProcess' enctype='multipart/form-data'>
                                <div id='box' class="container-fluid  shadow border rounded bg-light">
                                    <div class="form-row">
                                        <div class="form-group">
                                            <label for="input_photo">Profil Fotosu Değiştir</label>
                                            <input id="input_photo" type="file" name="photo" size="50"/>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="inputEmail4">Ad</label>
                                            <input required type="text" class="form-control" name="name" value="<%= session.getAttribute("name")%>"/>
                                        </div>
                                        <div class="form-group col-6">
                                            <label for="inputEmail4">Soyad</label>
                                            <input required type="text" class="form-control" name="surname" value="<%= session.getAttribute("surname")%>"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="inputMail">Email</label>
                                        <input required type="email" class="form-control" id="inputMail" placeholder="asd@..mail.com" name="email" value="<%= session.getAttribute("email")%>"/>
                                    </div>
                                    <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id")%>"/>
                                    <button type="submit" class="btn btn-primary" name="action" value="update">Güncelle</button>
                                </div>
                            </form>
                        </div>
                </div>
            </div>
            <div class="col-4">
                <h2>Şifre Değiştir</h2>
                <form id="form_control" method="post" action='ProfileProcess'>
                    <div id='box' class="container-fluid center mt-5 shadow border rounded bg-light">

                        <div class="form-group">
                            <label for="inputMail">Eski Şifre</label>
                            <input required type="password" class="form-control" placeholder="****" name="oldpass"/>
                        </div>
                        <div class="form-group">
                            <label for="inputMail">Yeni Şifre</label>
                            <input required type="password" class="form-control" placeholder="****" name="newpass"/>
                        </div>
                        <div class="form-group">
                            <label for="inputMail">Yeni Şifre Tekrar</label>
                            <input required type="password" class="form-control"  placeholder="****" name="newpass"/>
                        </div>
                        <input type="hidden" name="user_id" value="<%= session.getAttribute("user_id")%>"/>
                        <button type="submit" class="btn btn-primary" name="action" value="change"/>Değiştir</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
    <div class="container mt-2 alert alert-danger alert-dismissible" id="myAlert" >
        <strong>Hata!</strong> Girilen değerlerinizi kontrol ediniz.
    </div>
    <div class="container mt-2 alert alert-success alert-dismissible" id="myAlert2" >
        <strong>Başarılı!</strong> İşlem başarılı bir şekilde yerine getirildi.
    </div>
</div>

<script>
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#profile_photo').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }
    $("#input_photo").change(function () {
        readURL(this);
    });
    

    $('#myAlert2').hide();
    $('#myAlert').hide();
    <%if (request.getParameter("message") != null && request.getParameter("message").equals("success")) {
    %>
    $('#myAlert2').show();
    window.setTimeout(function () {
        $("#myAlert2").fadeTo(500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 2000);
    <%} else if (request.getParameter("message") != null) {%>
    $('#myAlert').show();
    window.setTimeout(function () {
        $("#myAlert").fadeTo(500, 0).slideUp(500, function () {
            $(this).remove();
        });
    }, 2000);
    <%
        }
    %>

</script>
</body>
</html>
