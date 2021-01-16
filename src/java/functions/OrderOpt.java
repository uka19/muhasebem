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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author uğur kerim
 */
public class OrderOpt extends HttpServlet {

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
        String []dizi = request.getParameterValues("productid");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderOpt</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderOpt at " + request.getContextPath() + "</h1>");
            out.println(dizi[0].toString());
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
        String orderer_id = session.getAttribute("company_id").toString();
        String seller_id = request.getParameter("seller_id").toString();
        String[] dizi = request.getParameterValues("productid");
        
        java.sql.Connection con;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/muhasebe?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey", "root", "");
            String productQuery = "insert into order_list values(?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(productQuery);
            preparedStmt.setString(1, id);
            preparedStmt.setString(2, orderer_id);
            preparedStmt.setString(3, seller_id);
            
           
            preparedStmt.execute();    
            
            for (int i = 0; i < dizi.length; i++) {
                String productQuery3 = "insert into products_order values (?,?)";
                PreparedStatement preparedStmt3 = con.prepareStatement(productQuery3);
                preparedStmt3.setString(1, id);
                preparedStmt3.setString(2, dizi[i]);
                preparedStmt3.execute();
            }
            response.sendRedirect("dashboard");
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
