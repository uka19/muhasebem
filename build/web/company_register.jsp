<%-- 
    Document   : register
    Created on : 25.Kas.2020, 19:45:12
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
        <div id='box' class="container center col-sm-5 border rounded bg-light">
            <form method="post" action='userRegister'>
                
                <div class="form-row">
                    <div class="form-group">
                        <label for="inputCompany">Şirket Adı</label>
                        <input type="text" class="form-control" placeholder="İşletmenizin adı" name="company_name" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputAddress">Address</label>
                    <input type="text" class="form-control" placeholder="1234 Main St" name="company_location1" required>
                </div>
                <div class="form-group">
                    <label for="inputAddress2">Address 2</label>
                    <input type="text" class="form-control" placeholder="Apartment, studio, or floor" name="company_location2">
                </div>
                <div class="form-group">
                    <label for="inputWeb">Web Adres</label>
                    <input type="text" class="form-control" placeholder="www.example.com" name="web_address" required>
                </div>
                <input type="submit" class="btn btn-primary" value="Devam">
            </form>
        </div>
    </div>
    <div class="container mt-2 alert alert-danger alert-dismissible" id="myAlert" >
        <strong>Hata!</strong> Bu web sitesi daha önce kullanımış
    </div>
    <script>
        $('#myAlert').hide();
        <%if (request.getParameter("message") != null && request.getParameter("message").equals("fail")) {
        %>
            $('#myAlert').show();
        <%}%> 
        $('#bigbox').animate({opacity: '1'},"slow")
        $('#box').animate({bottom: '50px'})
    </script>

</body>
</html>
