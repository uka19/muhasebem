/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;
/**
 *
 * @author uğur kerim
 */
public class Employee {
    private int user_id,role_id;
    private String name,surname,email,register_date,company_id;

    public Employee(int user_id, int role_id, String company_id, String name, String surname, String email, String register_date) {
        this.user_id = user_id;
        this.role_id = role_id;
        this.company_id = company_id;
        this.name = name;
        this.surname = surname;
        this.email = email;
        this.register_date = register_date;
    }

    public int getUser_id() {
        return user_id;
    }

    public String getRole_id() {
        if(this.role_id == 1){
            return "İşletme Sahibi";
        }else if(this.role_id == 2){
            return "Ürün Müdürü";
        }else if(this.role_id == 3){
            return "Ürün Danışmanı";
        }
        return "Hesap Müdürü";
    }

    public String getCompany_id() {
        return company_id;
    }

    public String getName() {
        return name;
    }

    public String getSurname() {
        return surname;
    }

    public String getEmail() {
        return email;
    }

    public String getRegister_date() {
        return register_date;
    }
}
