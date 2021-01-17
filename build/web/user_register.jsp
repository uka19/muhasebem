<%-- 
    Document   : user_register
    Created on : 25.Kas.2020, 20:11:08
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
    </head>
    <body>
        <%
            String company_name = null;
            String company_location1 = null;
            String company_location2 = null;
            String web_address = null;

            if (request.getParameter("company_name") != null || request.getParameter("company_location1") != null || request.getParameter("company_location2") != null || request.getParameter("web_address") != null) {
                company_name = request.getParameter("company_name");
                company_location1 = request.getParameter("company_location1");
                company_location2 = request.getParameter("company_location2");
                web_address = request.getParameter("web_address");

                if (company_name.isEmpty() || company_location1.isEmpty() || company_location2.isEmpty() || web_address.isEmpty()) {

                    response.sendRedirect("companyRegister");
                }
            } else {
                response.sendRedirect("companyRegister");
            }
        %>
        <nav class="navbar navbar-light bg-dark">
            <a class="navbar-brand text-white" href="#">
                <img src="images/muhasebe.jpeg" width="30" height="30" class="d-inline-block align-top " alt="">
                    Muhasebe'm
            </a>
        </nav>
        <form method="post" action='RegisterProcess' name="registration">
            <div id='bigbox' class="container border rounded mt-5"style="background:transparent url('images/muhasebe.jpeg') no-repeat center center /cover; height: 500px; opacity: 0">
                <div class='col-3 p-3 bg-dark text-white rounded opacity-2 '>
                    <h2>Birlikte Çalışalım</h2>
                </div>
                <div id='box' class="container center mt-5 col-sm-5 border rounded bg-light">

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
                    <div class="form-group">
                        <label for="inputMail">Email</label>
                        <input type="email" class="form-control" id="inputMail" placeholder="asd@..mail.com" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">Şifre</label>
                        <input type="password" class="form-control" id="inputPassword" placeholder="****" name='password' required>
                    </div>
                    <input type="hidden" name="company_name" value="<%= company_name%>"/>
                    <input type="hidden" name="company_location1" value="<%= company_location1%>"/>
                    <input type="hidden" name="company_location2" value="<%= company_location2%>"/>   
                    <input type="hidden" name="web_address" value="<%= web_address%>"/>
                    <input type="submit" class="btn btn-primary" value="Devam"/>

                </div>
            </div>
        </form>
    <div class="container mt-2 alert alert-danger alert-dismissible" id="myAlert" >
        <strong>Hata!</strong> Bu eposta kullanımda...
    </div>
    <script>
        $('#myAlert').hide();
        $('#bigbox').animate({opacity: '1'}, "slow")
        $('#box').animate({bottom: '50px'})
        $(function () {
            // Initialize form validation on the registration form.
            // It has the name attribute "registration"
            $("form[name='registration']").validate({
                // Specify validation rules
                rules: {
                    // The key name on the left side is the name attribute
                    // of an input field. Validation rules are defined
                    // on the right side
                    email: {
                        required: true,
                        // Specify that email should be validated
                        // by the built-in "email" rule
                        email: true
                    },
                    password: {
                        required: true,
                        minlength: 5
                    }
                },
                // Specify validation error messages
                messages: {
                    password: {
                        required: "Please provide a password",
                        minlength: "Parolanız minimum 6 karakter içermelidir."
                    },
                    email: "Please enter a valid email address"
                },
                // Make sure the form is submitted to the destination defined
                // in the "action" attribute of the form when valid
                submitHandler: function (form) {
                    form.submit();
                }
            });
        });
        <%if (request.getParameter("message") != null && request.getParameter("message").equals("fail")) {
        %>
            $('#myAlert').show();
        <%}%>    
    </script>
</body>
</html>
