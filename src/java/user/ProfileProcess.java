/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.math.BigInteger;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Base64;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.apache.tomcat.util.http.fileupload.IOUtils;

/**
 *
 * @author uğur kerim
 */
@MultipartConfig(maxFileSize = 16177215)
public class ProfileProcess extends HttpServlet {

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
            out.println("<title>Servlet ProfileProcess</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProfileProcess at " + request.getContextPath() + "</h1>");
            out.println(request.getParameter("action"));
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
        java.sql.Connection con;
        InputStream inputStream = null;
        Part filePart = request.getPart("photo");
        if (filePart != null) {
            inputStream = filePart.getInputStream();
        }
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://bb64a04e09e247:6d719b48@eu-cdbr-west-03.cleardb.net/heroku_d634204acb5e17a?reconnect=true", "bb64a04e09e247", "6d719b48");
            String productQuery = "update users set name = ?, surname = ?, email = ?, photo = ? where user_id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(productQuery);
            preparedStmt.setString(1, request.getParameter("name"));
            preparedStmt.setString(2, request.getParameter("surname"));
            preparedStmt.setString(3, request.getParameter("email"));
            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                preparedStmt.setBlob(4, inputStream);
            }
            preparedStmt.setString(5, request.getParameter("user_id"));
            preparedStmt.executeUpdate();
            HttpSession session = request.getSession(true);
            session.setAttribute("name", request.getParameter("name"));
            session.setAttribute("surname", request.getParameter("surname"));
            session.setAttribute("email", request.getParameter("email"));
            response.sendRedirect("profile");
        } catch (Exception e) {
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

        java.sql.Connection con;
        switch ((String) request.getParameter("action")) {
            case "change": {
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://bb64a04e09e247:6d719b48@eu-cdbr-west-03.cleardb.net/heroku_d634204acb5e17a?reconnect=true", "bb64a04e09e247", "6d719b48");
                    String productQuery = "update users set password = ? where password = ? and user_id = ?";
                    PreparedStatement preparedStmt = con.prepareStatement(productQuery);
                    preparedStmt.setString(1, getMd5(request.getParameter("newpass")));
                    preparedStmt.setString(2, getMd5(request.getParameter("oldpass")));
                    preparedStmt.setString(3, request.getParameter("user_id"));
                    int succes = preparedStmt.executeUpdate();
                    if (succes > 0) {
                        response.sendRedirect("profile?message=success");
                    } else {
                        response.sendRedirect("profile?message=fail");
                    }

                } catch (Exception e) {
                }
            }
            case "update": {
                InputStream inputStream = null;

                Part filePart = request.getPart("photo");
                if (filePart != null) {
                    inputStream = filePart.getInputStream();
                }
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://bb64a04e09e247:6d719b48@eu-cdbr-west-03.cleardb.net/heroku_d634204acb5e17a?reconnect=true", "bb64a04e09e247", "6d719b48");
                    String productQuery = "update users set name = ?, surname = ?, email = ?, photo = ? where user_id = ?";
                    PreparedStatement preparedStmt = con.prepareStatement(productQuery);
                    preparedStmt.setString(1, request.getParameter("name"));
                    preparedStmt.setString(2, request.getParameter("surname"));
                    preparedStmt.setString(3, request.getParameter("email"));
                    if (inputStream != null) {
                        // fetches input stream of the upload file for the blob column
                        preparedStmt.setBinaryStream(4, filePart.getInputStream());

                    }

                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;

                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }

                    byte[] imageBytes = outputStream.toByteArray();

                    String base64Image = Base64.getEncoder().encodeToString(imageBytes);

                    preparedStmt.setString(5, request.getParameter("user_id"));
                    preparedStmt.executeUpdate();
                    con.close();
                    HttpSession session = request.getSession(true);
                    session.setAttribute("name", request.getParameter("name"));
                    session.setAttribute("surname", request.getParameter("surname"));
                    session.setAttribute("email", request.getParameter("email"));
                    session.setAttribute("baseImage", base64Image);
                    response.sendRedirect("profile");
                } catch (Exception e) {
                    response.getWriter().write(e.toString());
                }
            }

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
