<%-- 
    Document   : sales
    Created on : 27.Ara.2020, 03:23:20
    Author     : uğur kerim
--%>

<%@page import="model.Products"%>
<%@page import="java.util.List"%>
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
    
    

    <script src="//code.jquery.com/jquery-1.10.2.js"></script>
    <script src="//code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <link rel="stylesheet" href="//code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.1/jquery.validate.min.js"></script>
</head>
<body>
    <%
        if (session.getAttribute("email") == null) {
            response.sendRedirect("login");
        }
        if(session.getAttribute("role_id").equals("2")||session.getAttribute("role_id").equals("4") ){
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
        <form method="get" action='SalesOpt' name="sale">
            <div class="row">
                <div class="col-6">
                    <h2>Alıcı Firma</h2> 
                    <div id='box' class="container center shadow border rounded bg-light">
                        <div class="form-group">
                            <label for="inputCompany">Şirket Adı</label>
                            <input type="text" id="compname" class="form-control search" placeholder="İşletmenizin adı" name="buyer_name" required/>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress">Address</label>
                            <input type="text" id="compaddress" class="form-control" placeholder="1234 Main St" name="buyer_location" required/>
                        </div>
                        <div class="form-group">
                            <label for="inputWeb">Web Adres</label>
                            <input type="text" id="webaddress" class="form-control" placeholder="www.example.com" name="web_address" />
                        </div>
                        <input type="hidden" class="form-control" id="compid" name="buyer_id"></input>

                    </div>
                </div>
                <div class="col-6">
                    <h2>Satıcı Firma</h2> 
                    <div class="container center shadow border rounded bg-light">
                        <div class="form-group">
                            <label for="inputCompany">Şirket Adı</label>
                            <input type="text" class="form-control search" placeholder="İşletmenizin adı" name="seller_name" value="<%=session.getAttribute("company_name")%>" readonly/>
                        </div>
                        <div class="form-group">
                            <label for="inputAddress">Address</label>
                            <input type="text" class="form-control" placeholder="1234 Main St" name="seller_location" value="<%=session.getAttribute("company_location")%>" readonly/>
                        </div>
                        <div class="form-group">
                            <label for="inputWeb">Web Adres</label>
                            <input type="text" class="form-control" placeholder="www.example.com" name="seller_web_address" value="<%=session.getAttribute("web_address")%>" readonly/>
                        </div>

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-6">
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
                                    <th scope="col">Ekle</th>
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
                                    <td><button type="button" class="btn btn-primary use-address" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">+</button></td>
                                    <td class="product-id" style="display:none"><%=prdList.get(i).getProduct_id()%></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-6">
                    <h2>Sepet</h2>
                    <div class="container-fluid shadow border rounded">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Ürün Adı</th>
                                    <th scope="col">Satış Fiyatı</th>
                                    <th scope="col">Çıkar</th>
                                </tr>
                            </thead>
                            <tbody id="basket">
                                <!--                                
                                <tr>                                  
                                    <td scope="col" class="product_name"></td>                                
                                </tr>
                                -->
                            </tbody>
                            <table>
                                <tr>
                                    <th>Toplam Ücret</th>
                                    <th>=</th>
                                    <th><b id="total"></b>₺<input id="totalPrice" type="hidden" class="input" name="total_cost" required/></th>
                                </tr>
                                <tr>
                                    <th>Ödenen Ücret</th>
                                    <th>=</th>
                                    <th><input id="paid" type="number" class="input" name="paid_cost" required/></th>
                                </tr>
                                <tr>
                                    <th><input type="submit" class="btn btn-primary" value="Devam"/></th>
                                </tr>
                            </table>
                        </table>
                    </div>
                </div>
            </div>
        </form>
    </div>
</div>
<script>
    var totalPrice = 0;
    $(document).ready(function () {
        $(function () {
            let values;
            $("#compname").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        url: "AutoCompleteOpt",
                        type: "GET",
                        data: {
                            term: request.term
                        },
                        dataType: "json",
                        success: function (event, ui) {
                            values = event;
                            response($.map(event, function (item)
                            {
                                return{
                                    label: item.company_name,
                                    value: item.company_id,
                                    contentid: item.company_id,
                                }
                            }));
                        }
                    });
                },
                select: function (event, ui) {
                    console.log(values);
                    for (let i = 0; i < values.length; i++) {
                        if (values[i].company_id == ui.item.contentid) {
                            $('#compname').val(values[i].company_name);
                            $('#compaddress').val(values[i].company_location);
                            $('#webaddress').val(values[i].web_address);
                            $('#compid').val(values[i].company_id);
                            break;
                        }
                    }
                    return false;
                }
            });
        });
        $(function () {
            // Initialize form validation on the registration form.
            // It has the name attribute "registration"
            $("form[name='sale']").validate({
                // Specify validation rules
                rules: {
                    // The key name on the left side is the name attribute
                    // of an input field. Validation rules are defined
                    // on the right side
                    paid_cost: {
                        required: true,
                        // Specify that email should be validated
                        // by the built-in "email" rule
                        max:totalPrice
                    }
                },
                // Specify validation error messages
                messages: {
                    paid_cost: {
                        required: "Lütfen Ödenen tutarı giriniz",
                        max:"Toplam ücretin üzerinde giremezssiniz"
                    },
                    
                },
                // Make sure the form is submitted to the destination defined
                // in the "action" attribute of the form when valid
                submitHandler: function (form) {
                    form.submit();
                }
            });
        });
    });
    var i = 0;
    
    $(".use-address").click(function () {
        var $row = $(this).closest("tr");    // Find the row
        var $product_name = $row.find(".product_name").text(); // Find the text
        var $sell_cost = $row.find(".sell_cost").text();
        var $product_id = $row.find(".product-id").text();
        // Let's test it out
        //alert($product_id);
        i++;
        totalPrice += parseInt($sell_cost);
        writePrice();
        $("#basket").append('<tr><td scope="col">' + i + '</td><td scope="col">' + $product_name + '</td><td scope="col" class="cost">' + $sell_cost + '</td><td scope="col"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo" onclick="deleteRow(this)">-</button></td><input type="hidden" class="form-control" id="productID" name="productid" value="' + $product_id + '"/></tr>');
    });
    function deleteRow(r) {
        var s = $(r).closest("tr");
        var c = s.find(".cost").text();
        totalPrice -= parseInt(c);
        s.remove();
        writePrice();
    }
    function writePrice() {
        $('#total').empty();
        $('#totalPrice').val(0);
        $('#total').append(totalPrice);
        $('#totalPrice').val(totalPrice);
    }
    function imAutocompleteJSONParse(data) {
        var rows = [];
        var rowData = null;
        var dataLength = data.length;
        for (var i = 0; i < dataLength; i++) {
            rowData = data[i];
            rows[i] = {
                value: rowData.company_name
            };
        }
        return rows;
    }
    

</script>
</body>
</html>
