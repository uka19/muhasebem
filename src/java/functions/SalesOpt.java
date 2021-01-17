/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package functions;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.UUID;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author uğur kerim
 */
@WebServlet(name = "SalesOpt", urlPatterns = {"/SalesOpt"})
public class SalesOpt extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String[] dizi = request.getParameterValues("productid");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet SalesOpt</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<b>Fatura</b> <br>");
            out.println("Buyer_id: " + request.getParameter("buyer_id").toString() + "<br>");
            out.println("Buyer_name: " + request.getParameter("buyer_name").toString() + "<br>");
            out.println("Buyer_location: " + request.getParameter("buyer_location").toString() + "<br>");
            out.println("Total_cost: " + request.getParameter("total_cost").toString() + "<br>");
            out.println("Paid_cost: " + request.getParameter("paid_cost").toString() + "<br>");
            for (int i = 0; i < dizi.length; i++) {
                out.println(dizi[i].toString());
            }
            out.println("</body>");
            out.println("</html>");

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String id = String.valueOf(UUID.randomUUID());
        String seller_id = session.getAttribute("company_id").toString();

        String[] dizi = request.getParameterValues("productid");

        java.sql.Connection con;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://bb64a04e09e247:6d719b48@eu-cdbr-west-03.cleardb.net/heroku_d634204acb5e17a?reconnect=true", "bb64a04e09e247", "6d719b48");
            String productQuery = "insert into bill(bill_id,seller_id,buyer_id,buyer_name,buyer_location,bill_cost,paid_cost) values(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(productQuery);
            preparedStmt.setString(1, id);
            preparedStmt.setString(2, seller_id);
            preparedStmt.setString(3, request.getParameter("buyer_id"));
            preparedStmt.setString(4, request.getParameter("buyer_name"));
            preparedStmt.setString(5, request.getParameter("buyer_location"));
            preparedStmt.setString(6, request.getParameter("total_cost"));
            preparedStmt.setString(7, request.getParameter("paid_cost"));

            for (int i = 0; i < dizi.length; i++) {
                String productQuery2 = "update products set piece = piece - 1 where product_id = ?";
                PreparedStatement preparedStmt2 = con.prepareStatement(productQuery2);
                preparedStmt2.setString(1, dizi[i]);
                preparedStmt2.executeUpdate();
            }
            preparedStmt.execute();

            for (int i = 0; i < dizi.length; i++) {
                String productQuery3 = "insert into product_sell values (?, ?)";
                PreparedStatement preparedStmt3 = con.prepareStatement(productQuery3);
                preparedStmt3.setString(1, dizi[i]);
                preparedStmt3.setString(2, id);
                preparedStmt3.execute();
            }

            response.sendRedirect("bills");
        } catch (Exception e) {
            response.getWriter().write(e.toString());
        }

        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
