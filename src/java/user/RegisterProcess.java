/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.UUID;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.io.File;
import java.io.FileInputStream;
import java.net.URL;

/**
 *
 * @author uğur kerim
 */
public class RegisterProcess extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterProcess</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterProcess at " + request.getContextPath() + "</h1>");
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
        String id = String.valueOf(UUID.randomUUID());
        java.sql.Connection con = null;
        int i = 0;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/muhasebe?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey", "root", "");

            String companyQuery = " insert into companies (company_id, company_name, company_location, web_address)"
                    + " values (?, ?, ?, ?)";
            PreparedStatement preparedStmt = con.prepareStatement(companyQuery);
            preparedStmt.setString(1, id);
            preparedStmt.setString(2, request.getParameter("company_name"));
            preparedStmt.setString(3, request.getParameter("company_location1") + " " + request.getParameter("company_location2"));
            preparedStmt.setString(4, request.getParameter("web_address"));

            File file = new File("C:\\Users\\uğur kerim\\Documents\\NetBeansProjects\\muhasebem\\web\\images\\img_avatar1.png");
            FileInputStream fin = new FileInputStream(file);

            String userQuery = " insert into users (name, surname, email, password, role_id, company_id, photo)"
                    + " values (?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement preparedStmt2 = con.prepareStatement(userQuery);
            preparedStmt2.setString(1, request.getParameter("name"));
            preparedStmt2.setString(2, request.getParameter("surname"));
            preparedStmt2.setString(3, request.getParameter("email"));
            preparedStmt2.setString(4, getMd5(request.getParameter("password")));
            preparedStmt2.setString(5, "1");
            preparedStmt2.setString(6, id);
            preparedStmt2.setBinaryStream(7, fin);

            preparedStmt.execute();
            i++;
            preparedStmt2.execute();

            con.close();
            response.sendRedirect("login?message=succes");
        } catch (SQLIntegrityConstraintViolationException e) {
            response.getWriter().write(e.toString());
            if (i == 0) {
                response.sendRedirect("companyRegister?message=fail");
            } else {
                deleteFailComp(con, id);
                response.sendRedirect("userRegister?message=fail&company_name=" + request.getParameter("company_name") + "&company_location1=" + request.getParameter("company_location1") + "&company_location2=" + request.getParameter("company_location2") + "&web_address=" + request.getParameter("web_address"));
            }
        } catch (Exception e) {
            response.getWriter().write(e.toString());
        }

        processRequest(request, response);
    }

    public static String getMd5(String input) {
        try {

            // Static getInstance method is called with hashing MD5 
            MessageDigest md = MessageDigest.getInstance("MD5");

            // digest() method is called to calculate message digest 
            //  of an input digest() return array of byte 
            byte[] messageDigest = md.digest(input.getBytes());

            // Convert byte array into signum representation 
            BigInteger no = new BigInteger(1, messageDigest);

            // Convert message digest into hex value 
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } // For specifying wrong message digest algorithms 
        catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    private void deleteFailComp(java.sql.Connection con, String company_id) {
        try {
            String query = " delete from companies where company_id = ? ";
            PreparedStatement stmt = con.prepareStatement(query);
            stmt.setString(1, company_id);
            stmt.execute();
        } catch (Exception e) {
        }
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
