<%-- 
    Document   : products
    Created on : 07.Ara.2020, 16:07:50
    Author     : uğur kerim
--%>

<%@page import="model.Products"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="functions.DashboardFunctions"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        if (session.getAttribute("role_id").equals("3")||session.getAttribute("role_id").equals("4")){
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
                <h2>Ürünler</h2>
                <div class="container-fluid shadow border rounded">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Ürün Adı</th>
                                <th scope="col">Adet</th>
                                <th scope="col">Maaliyet</th>
                                <th scope="col">Satış Fiyatı</th>
                                <th scope="col">Eklenme Tarihi</th>
                                <th scope="col">Düzenle</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                DashboardFunctions df = new DashboardFunctions();
                                List<Products> prdList = df.getProducts((String) session.getAttribute("company_id"));

                                for (int i = 0; i < prdList.size(); i++) {
                            %>
                            <tr>
                                <td scope="row"><%=i + 1%></td>
                                <td scope="col" class="product_name"><%=prdList.get(i).getProduct_name()%></td>
                                <td scope="col" class="piece"><%=prdList.get(i).getPiece()%></td>
                                <td scope="col" class="cost"><%=prdList.get(i).getCost()%></td>
                                <td scope="col" class="sell_cost"><%=prdList.get(i).getSell_cost()%></td>
                                <td scope="col" class="product_date"><%=prdList.get(i).getProduct_date()%></td>
                                <td><button type="button" class="btn btn-primary use-address" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">...</button></td>
                                <td class="product-id" style="display:none"><%=prdList.get(i).getProduct_id()%></td>
                            </tr>
                            <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-5">
                <h2>Ürün Ekle</h2>
                <div id='box' class="container-fluid center  border rounded bg-light shadow" >
                    <form method="get" action='ProductOpt'>
                        <div class="form-row">
                            <div class="form-group col-6">
                                <label for="inputProductName">Ürün Adı</label>
                                <input type="text" class="form-control" id="inputProductName" name="product_name" required/>
                            </div>
                            <div class="form-group col-6">
                                <label for="inputCost">Maaliyet</label>
                                <input type="number" class="form-control" id="inputCost" name="cost" required/>
                            </div>
                        </div>
                        <div class="form-row">
                            <label for="inputPiece">Adet</label>
                            <input type="number" id="inputPiece" class="form-control" name="piece" required/>
                        </div>
                        <div class="form-group">
                            <div class="form-group">
                                <label for="inputSellCost">Satış Fiyatı</label>
                                <input type="number" class="form-control" name="sell_cost" required/>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="hidden" name="company_id" value="<%=session.getAttribute("company_id")%>"/>
                            <input type="hidden" class="btn btn-primary" value="add" name="action"/>
                            <input type="submit" class="btn btn-primary" value="Ürün Ekle"/>
                        </div>
                    </form>
                </div>
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
                <form method="get" action="ProductOpt">
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inputProduct">Ürün Adı</label>
                            <input type="text" class="form-control" id="input_product" name="product_name"/>
                        </div>
                        <div class="form-group col-6">
                            <label for="inputPiece">Adet</label>
                            <input type="text" class="form-control" id="input_piece" name="piece"/>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-6">
                            <label for="inputCost">Maaliyet</label>
                            <input type="text" class="form-control" id="input_cost" name="cost"/>
                        </div>
                        <div class="form-group col-6">
                            <label for="inputSellCost">Satış Fiyatı</label>
                            <input type="text" class="form-control" id="input_sell_cost" name="sell_cost"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="hidden" class="form-control" id="productID" name="product_id"/>
                        <!--                                                                        <input type="hidden" class="form-control"  name="action" value="delete">-->
                        <button type="submit" class="btn btn-warning" name="action" value="edit">Düzenle</button>
                        <button type="submit" class="btn btn-danger" name="action" value="delete">Çıkar</button>
                    </div>
                </form>
            </div>

        </div>
    </div>
</div>
<script>
    $(".use-address").click(function () {
        var $row = $(this).closest("tr");    // Find the row
        var $product_name = $row.find(".product_name").text(); // Find the text
        var $piece = $row.find(".piece").text();
        var $cost = $row.find(".cost").text();
        var $sell_cost = $row.find(".sell_cost").text();
        var $product_id = $row.find(".product-id").text();
        // Let's test it out
        //alert($cost);
        $("#input_product").val($product_name);
        $("#input_piece").val($piece);
        $("#input_cost").val($cost);
        $("#input_sell_cost").val($sell_cost);
        $("#productID").val($product_id);
    });
</script>

</body>
</html>
