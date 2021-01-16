/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package functions;


/**
 *
 * @author uğur kerim
 */


import java.sql.*;
import model.Products;
import java.util.ArrayList;
import java.util.List;
import model.Bill;
import model.Company;
import model.Employee;

public class DashboardFunctions {
    private java.sql.Connection con;
    
    public DashboardFunctions(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/muhasebe?useUnicode=true&useLegacyDatetimeCode=false&serverTimezone=Turkey", "root", "");    
        } catch (Exception e) {
        }
    }
    public void CloseCon(){
        try {
            con.close();
        } catch (Exception e) {
        }
    }
    public List<Employee> getEmployees(String company_id,String user_id){
        ResultSet rs = null;
        List<Employee> empList = new ArrayList<>();
        try {
            String query = "select * from users where company_id = ? and user_id != ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, company_id);
            preparedStmt.setString(2, user_id);
            rs = preparedStmt.executeQuery();
            while(rs.next()){
                int u_id = rs.getInt("user_id");
                int role_id = rs.getInt("role_id");
                String name = rs.getString("name");
                String surname = rs.getString("surname");
                String email = rs.getString("email");
                String comp_id = rs.getString("company_id");
                String register_date = rs.getString("register_date");
                empList.add(new Employee(u_id, role_id, comp_id, name, surname, email, register_date)); 
            }
        } catch (Exception e) {
            
        }
        return empList;
    }
    public List<Products> getProducts(String company_id){
        ResultSet rs = null;
        List<Products> productList = new ArrayList<>();
        try {
            String query = "select * from products where company_id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, company_id);
            rs = preparedStmt.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                String cmp_id = rs.getString("company_id");
                String product_date = rs.getString("product_date");
                int cost = rs.getInt("cost");
                int piece = rs.getInt("piece");
                int sell_cost = rs.getInt("sell_cost");
                productList.add(new Products(product_id, cost, piece, sell_cost, product_name, cmp_id, product_date)); 
            }
        } catch (Exception e) {
        }
        return productList;
    }
    public List<Bill> getSellBills(String company_id){
        ResultSet rs = null;
        List<Bill> billList = new ArrayList<>();
        try {
            String query = "select * from bill where seller_id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, company_id);
            rs = preparedStmt.executeQuery();
            while(rs.next()){
                String bill_id = rs.getString("bill_id");
                String seller_id = rs.getString("seller_id");
                String buyer_id = rs.getString("buyer_id");
                String buyer_name = rs.getString("buyer_name");
                String buyer_location = rs.getString("buyer_location");
                int bill_cost = rs.getInt("bill_cost");
                int paid_cost = rs.getInt("paid_cost");
                String bill_date = rs.getString("bill_date");
                billList.add(new Bill(bill_id, seller_id, buyer_id, buyer_name, buyer_location, bill_cost, paid_cost, bill_date) ); 
            }
        } catch (Exception e) {
        }
        return billList;
    }
    public List<Bill> getBuyBills(String company_id){
        ResultSet rs = null;
        List<Bill> billList = new ArrayList<>();
        try {
            String query = "select * from bill where buyer_id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, company_id);
            rs = preparedStmt.executeQuery();
            while(rs.next()){
                String bill_id = rs.getString("bill_id");
                String seller_id = rs.getString("seller_id");
                String buyer_id = rs.getString("buyer_id");
                String buyer_name = rs.getString("buyer_name");
                String buyer_location = rs.getString("buyer_location");
                int bill_cost = rs.getInt("bill_cost");
                int paid_cost = rs.getInt("paid_cost");
                String bill_date = rs.getString("bill_date");
                billList.add(new Bill(bill_id, seller_id, buyer_id, buyer_name, buyer_location, bill_cost, paid_cost, bill_date) ); 
            }
        } catch (Exception e) {
        }
        return billList;
    }
    public List<Products> getBillProducts(String bill_id){
        ResultSet rs = null;
        List<Products> productList = new ArrayList<>();
        try {
            String query = "select * from product_sell, products where bill_id = ? and product_sell.product_id = products.product_id";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, bill_id);
            rs = preparedStmt.executeQuery();
            while(rs.next()){
                int product_id = rs.getInt("product_id");
                String product_name = rs.getString("product_name");
                int sell_cost = rs.getInt("sell_cost");
                productList.add(new Products(product_id, sell_cost, product_name)); 
            }
        } catch (Exception e) {
        }
        return productList;
    }
    public Company getCompanyInfo(String comp_id){
        ResultSet rs;
        Company company = null;
        try {
            String query = "select * from companies where company_id = ?";
            PreparedStatement preparedStmt = con.prepareStatement(query);
            preparedStmt.setString(1, comp_id);
            rs = preparedStmt.executeQuery();
            while(rs.next()){
                String company_id = rs.getString("company_id");
                String company_name = rs.getString("company_name");
                String company_location = rs.getString("company_location");
                String web_address = rs.getString("web_address");
                company = new Company(company_id, company_name, company_location, web_address);
            }
        } catch (Exception e) {
        }
        return company;
    }
    public int getProfitMonthly(String company_id){
        ResultSet rs;
        int toplam = 0;
        try{
        String query = "select sum(bill.bill_cost) as toplam from bill where seller_id = ? and MONTH(bill_date) = '01-01-2021'";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, company_id);
        rs = preparedStmt.executeQuery();
        while(rs.next()){
            toplam = rs.getInt("toplam");
        }
        }catch(Exception e){
            
        }
        return toplam;
    }
    public int getProfitYear(String company_id){
        ResultSet rs;
        int toplam = 0;
        try{
        String query = "select sum(bill.bill_cost) as toplam from bill where seller_id = ? and MONTH(bill_date) = '01-01-2021'";
        PreparedStatement preparedStmt = con.prepareStatement(query);
        preparedStmt.setString(1, company_id);
        rs = preparedStmt.executeQuery();
        while(rs.next()){
            toplam = rs.getInt("toplam");
        }
        }catch(Exception e){
            
        }
        return toplam;
    }
    
}
