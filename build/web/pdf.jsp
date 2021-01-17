<%-- 
    Document   : pdf
    Created on : 06.Oca.2021, 22:55:31
    Author     : uğur kerim
--%>

<%@page import="model.Company"%>
<%@page import="model.Products"%>
<%@page import="model.Bill"%>
<%@page import="java.util.List"%>
<%@page import="functions.DashboardFunctions"%>
<%@page contentType="text/html" pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.3.2/jspdf.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.min.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
    <title>JSP Page</title>
</head>
<body>
<div id="content">
    
    <%
        DashboardFunctions df = new DashboardFunctions();
        switch (request.getParameter("action").toString()) {
            case "sell": {
                Company company = df.getCompanyInfo(request.getParameter("comp_id"));

    %>
    <div class="row">
        <div class="col-6">
            <h2>Satıcı</h2>
            <div class="container-fluid shadow border rounded">
                <b><%=session.getAttribute("company_name")%></b>
                <p><%=session.getAttribute("company_location")%></p>
                <p><%=session.getAttribute("web_address")%></p>
            </div>
        </div>
        <div class="col-6">
            <h2>Alıcı</h2>
            <div class="container-fluid shadow border rounded">
                <b><%=company.getCompany_name()%></b>
                <p><%=company.getCompany_location()%></p>
                <p><%=company.getWeb_address()%></p>
            </div>
        </div>
    </div>
    <%
            break;
        }
        case "buy": {
            Company company = df.getCompanyInfo(request.getParameter("comp_id"));

    %>
    <div class="row mx-auto">
        <div class="col-6">
            <h2>Satıcı</h2>
            <div class="container-fluid shadow border rounded">
                <b><%=company.getCompany_name()%></b>
                <p><%=company.getCompany_location()%></p>
                <p><%=company.getWeb_address()%></p>
            </div>
        </div>
        <div class="col-6">
            <h2>Alıcı</h2>
            <div class="container-fluid shadow border rounded">
                <b><%=session.getAttribute("company_name")%></b>
                <p><%=session.getAttribute("company_location")%></p>
                <p><%=session.getAttribute("web_address")%></p>
            </div>
        </div>
    </div>
    <%
                break;
            }
        }
    %>
    <div class="row container center mx-auto">
        <h2>Ürünler</h2>
        <div class="container-fluid shadow border rounded">
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Satıcı</th>
                        <th scope="col">Fiyat</th>  

                    </tr>
                </thead>
                <tbody>
                    <%=request.getParameter("bill_id").toString()%>
                    <%
                        int toplam = 0;

                        List<Products> prdList2 = df.getBillProducts(request.getParameter("bill_id"));
                        
                        for (int i = 0; i < prdList2.size(); i++) {
                            toplam = toplam + prdList2.get(i).getSell_cost();
                    %>
                    <tr>
                        <td scope="row"><%=i + 1%></td>
                        <td scope="col" class="buyer_name"><%=prdList2.get(i).getProduct_name()%></td>
                        <td scope="col" class="cost"><%=prdList2.get(i).getSell_cost()%>₺</td>
                    </tr>
                    <%}%>
                </tbody>
                <table>
                    <tr>
                        <th>Toplam Ücret</th>
                        <th>=</th>
                        <th><%=toplam%>₺</th>
                    </tr>
                </table>
            </table>
        </div>
    </div>
</div> 
<div id="elementH"></div>
<script>
    $(document).ready(function () {
        var opt = {
            margin: 1,
            filename: 'fatura.pdf',
            image: {type: 'jpeg', quality: 0.98},
            html2canvas: {scale: 2},
            jsPDF: {unit: 'in', format: 'letter', orientation: 'portrait'}
        };
        html2pdf().from($('#content').html()).set(opt).toPdf().get('pdf').then(function (pdf) {
            window.location = pdf.output('bloburl');
        });
    });
</script>
</body>
</html>
