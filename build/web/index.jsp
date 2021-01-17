<%-- 
    Document   : index
    Created on : 25.Kas.2020, 19:42:23
    Author     : uğur kerim
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Muhasebe'm</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    </head>
    <body>
        <%
            if (session.getAttribute("user_id") != null) {
                response.sendRedirect("dashboard");
            }

        %>

    <div class="jumbotron text-center" style="background:transparent url('images/muhasebe.jpeg') no-repeat center center /cover">
        <div class='container col-5 p-3 my-3 bg-dark text-white rounded opacity-2 '>
            <h1 class="display-1">Muhasebe'm</h1>
        </div>
        <div class='container col-3 p-3 bg-danger text-white rounded opacity-2 '>
            <h6 class="display-9">İşletmeniz İşletmemizdir.</h6>
        </div> 
    </div>

    <div class="container">
        <div class="row">
            <div class="col-sm-6 text-center">
                <a href="companyRegister" type="button" class="btn btn-primary btn-block">Bizimle Çalışın</a>
            </div>
            <div class="col-sm-6 text-center">
                <a href="login" type="button" class="btn btn-success btn-block">Giriş Yap</a>
            </div>
        </div>
    </div>

    <div class="container" style="margin-top:30px">
        <div class="row">
            <div class="col-sm-4">
                <h2>Kullanıcı Sayımız</h2>
                <div class="count-up h1" data-from="10" data-to="1215615" data-time="2000">
                    0
                </div>
                <p>Her ay 100'e yakın kullanıcıya hizmet veriyoruz.</p>
                <h3>Sosyal Medya Hesaplarımız</h3>

                <ul class="nav nav-pills flex-column">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Facebook</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Twitter</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">İnstagram</a>
                    </li>
                </ul>
                <hr class="d-sm-none">
            </div>
            <div class="col-sm-8">
                <h2>Kullanımı Kolay Teknoloji</h2>
                <h5>İşletmenizin yanında</h5>

                <p>..</p>
                <p>İşletmelerin temel muhasebe işlemlerini kolaylıkla halledebileceğiniz, müşterileriniz ile kolaylıkla alışverişlerinizi yapabilirsiniz.</p>
                <br>
                <h2>İşletmenizin Temel İhtiyaçlarını Karşılar</h2>
                <h5>2007'den beri gelişen teknoloji</h5>

                <p>..</p>
                <p>İşe başladığımız ilk günden beri işletmelerin fonksiyonlarını kolaylaştırmak için araştırmalarımızı ve geliştirmelerimizi sürdürüyoruz. Uzman kadromuz ile gelişimimizi sürdürüyoruz</p>
            </div>
        </div>
    </div>

    <div class="jumbotron text-center" style="margin-bottom:0">
        <div class='row'>
            <div class='col'>
                <h2>Hakkımızda</h2>
                <p>
                    Vizyonumuz, işletmelerin kolayca ürünlerini pazarlaması ve muhasabe işlemlerini yaptırılması.
                </p>
            </div>  
            <div class='col'>
                <h3>En Son Haberler</h3>
            </div>
            <div class='col'>
                <h3>:D</h3>
            </div>
        </div>
    </div>
    <script>
        (function ($) {
            $.fn.counter = function () {
                const $this = $(this),
                        numberFrom = parseInt($this.attr('data-from')),
                        numberTo = parseInt($this.attr('data-to')),
                        delta = numberTo - numberFrom,
                        deltaPositive = delta > 0 ? 1 : 0,
                        time = parseInt($this.attr('data-time')),
                        changeTime = 10;

                let currentNumber = numberFrom,
                        value = delta * changeTime / time;
                var interval1;
                const changeNumber = () => {
                    currentNumber += value;
                    //checks if currentNumber reached numberTo
                    (deltaPositive && currentNumber >= numberTo) || (!deltaPositive && currentNumber <= numberTo) ? currentNumber = numberTo : currentNumber;
                    this.text(parseInt(currentNumber));
                    currentNumber == numberTo ? clearInterval(interval1) : currentNumber;
                }

                interval1 = setInterval(changeNumber, changeTime);
            }
        }(jQuery));
        $('.count-up').counter();

    </script>
</body>

</html>
