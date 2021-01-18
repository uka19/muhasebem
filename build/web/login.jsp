<%-- 
    Document   : login
    Created on : 25.Kas.2020, 19:45:20
    Author     : uğur kerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-light bg-dark">
            <a class="navbar-brand text-white" href="#">
                <img src="images/muhasebe.jpeg" width="30" height="30" class="d-inline-block align-top " alt="">
                    Muhasebe'm
            </a>
        </nav>
    <div id='bigbox' class="container border rounded mt-5"style="background:transparent url('images/muhasebe.jpeg') no-repeat center center /cover; height: 500px; opacity: 0">
        <div class='col-3 p-3 bg-dark text-white rounded opacity-2 '>
            <h2>Birlikte Çalışalım</h2>
        </div>
        <div id='box' class="container center col-sm-5 border rounded bg-light" style="margin-top: 100px">
            <form method="post" action='LoginProcess'>

                <div class="form-group">
                    <div class="form-group">
                        <label for="inputEmail">Email</label>
                        <input type="email" class="form-control" placeholder="asd@..mail.com" name="email" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputPassword">Şifre</label>
                    <input type="password" class="form-control" placeholder="***" name="password" required>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Login">
                </div>
            </form>
        </div>
    </div>
    <div class="container mt-2 alert alert-success alert-dismissible" id="myAlert" >
        <strong>Başarılı!</strong> Kayıt İşlemi Başarılı. Giriş Yapabilirsiniz..
    </div>
    <div class="container mt-2 alert alert-danger alert-dismissible" id="myAlert2" >
        <strong>Başarısız!</strong> Kullanıcı adı veya şifreyi kontrol ediniz.
    </div>
    <script>
        $('#bigbox').animate({opacity: '1'}, "slow")
        $('#box').animate({bottom: '50px'})
        $('#myAlert').hide();
        $('#myAlert2').hide();
        <%if (request.getParameter("message") != null && request.getParameter("message").equals("success")) {
        %>
        $('#myAlert').show();
        window.setTimeout(function () {
            $("#myAlert").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 2000);
        <%}%>
        <%if (request.getParameter("message") != null && request.getParameter("message").equals("fail")) {
        %>
        $('#myAlert2').show();
        window.setTimeout(function () {
            $("#myAlert2").fadeTo(500, 0).slideUp(500, function () {
                $(this).remove();
            });
        }, 2000);
        <%}%>
    </script>
</body>
</html>
