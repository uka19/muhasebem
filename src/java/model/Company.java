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
public class Company {
    String company_id,company_name,company_location,web_address;

    public Company(String company_id, String company_name, String company_location, String web_address) {
        this.company_id = company_id;
        this.company_name = company_name;
        this.company_location = company_location;
        this.web_address = web_address;
    }

    public String getCompany_id() {
        return company_id;
    }

    public String getCompany_name() {
        return company_name;
    }

    public String getCompany_location() {
        return company_location;
    }

    public String getWeb_address() {
        return web_address;
    }
    
    
}
