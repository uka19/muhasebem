<%-- 
    Document   : bills
    Created on : 06.Oca.2021, 02:01:25
    Author     : uğur kerim
--%>

<%@page import="model.Bill"%>
<%@page import="model.Products"%>
<%@page import="java.util.List"%>
<%@page import="functions.DashboardFunctions"%>
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
        if (session.getAttribute("role_id").equals("3")||session.getAttribute("role_id").equals("2")){
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
            <div class="col-6">
                <h2>Satış Faturaları</h2>

                <div class="container-fluid shadow border rounded">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Alıcı</th>
                                <th scope="col">Maaliyet</th>
                                <th scope="col">Ödenen Miktar</th>  
                                <th scope="col">Tarih</th> 
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                DashboardFunctions df = new DashboardFunctions();
                                List<Bill> prdList = df.getSellBills((String) session.getAttribute("company_id"));

                                for (int i = 0; i < prdList.size(); i++) {
                            %>
                        <form action="pdf.jsp" target="_blank" action="get">
                            <tr>
                                <td scope="row"><%=i + 1%></td>
                                <td scope="col" class="buyer_name"><%=prdList.get(i).getBuyer_name()%></td>                               
                                <td scope="col" class="cost"><%=prdList.get(i).getBill_cost()%></td>
                                <td scope="col" class="paid_cost"><%=prdList.get(i).getPaid_cost()%></td>
                                <td scope="col" class="bill_date"><%=prdList.get(i).getBill_date()%></td>
                                <td><button type="submit" class="btn btn-primary use-address" >...</button></td>                
                            <input type="hidden" value="<%=prdList.get(i).getBill_id()%>" name="bill_id"/>
                            <input type="hidden" value="<%=prdList.get(i).getBuyer_id()%>" name="comp_id"/>
                            <input type="hidden" value="sell" name="action"/>
                            </tr>
                        </form>
                        <%}%>
                        </tbody>
                    </table>
                </div>

            </div>
            <div class="col-6">
                <h2>Alış Faturaları</h2>

                <div class="container-fluid shadow border rounded">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Satıcı</th>
                                <th scope="col">Maaliyet</th>
                                <th scope="col">Ödenen Miktar</th>  
                                <th scope="col">Tarih</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                List<Bill> prdList2 = df.getBuyBills((String) session.getAttribute("company_id"));
                                for (int i = 0; i < prdList2.size(); i++) {
                            %>
                        <form action="pdf.jsp" target="_blank" action="get">
                            <tr>
                                <td scope="row"><%=i + 1%></td>
                                <td scope="col" class="buyer_name"><%=prdList2.get(i).getBuyer_name()%></td>
                                <td scope="col" class="cost"><%=prdList2.get(i).getBill_cost()%></td>
                                <td scope="col" class="paid_cost"><%=prdList2.get(i).getPaid_cost()%></td>
                                <td scope="col" class="bill_date"><%=prdList2.get(i).getBill_date()%></td>
                                <td><button type="submit" class="btn btn-primary use-address" >...</button></td>

                            <input type="hidden" value="<%=prdList2.get(i).getBill_id()%>" name="bill_id"/>
                            <input type="hidden" value="<%=prdList2.get(i).getSeller_id()%>" name="comp_id"/>
                            <input type="hidden" value="buy" name="action"/>
                            </tr>
                        </form>
                        <%}%>
                        </tbody>
                    </table>
                </div>

            </div>

        </div>
    </div>
</div>
</body>
</html>
