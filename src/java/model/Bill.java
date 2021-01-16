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
public class Bill {
    String bill_id,seller_id,buyer_id,buyer_name,buyer_location,bill_date;
    float bill_cost,paid_cost;

    public Bill(String bill_id, String seller_id, String buyer_id, String buyer_name, String buyer_location, float bill_cost, float paid_cost,String bill_date) {
        this.bill_id = bill_id;
        this.seller_id = seller_id;
        this.buyer_id = buyer_id;
        this.buyer_name = buyer_name;
        this.buyer_location = buyer_location;
        this.bill_cost = bill_cost;
        this.paid_cost = paid_cost;
        this.bill_date = bill_date;
    }

    public String getBill_id() {
        return bill_id;
    }

    public String getSeller_id() {
        return seller_id;
    }

    public String getBuyer_id() {
        return buyer_id;
    }

    public String getBuyer_name() {
        return buyer_name;
    }

    public String getBuyer_location() {
        return buyer_location;
    }

    public float getBill_cost() {
        return bill_cost;
    }

    public float getPaid_cost() {
        return paid_cost;
    }

    public String getBill_date() {
        return bill_date;
    }
    
    
}
