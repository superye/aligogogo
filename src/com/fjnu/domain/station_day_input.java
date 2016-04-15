package com.fjnu.domain;

import java.util.Date;

/**
 * Created by spzn on 16-4-4.
 */
public class station_day_input {
    private int id;
    private String order_id;
    private String station_id;
    private String payer_id;
    private Date time;
    private int type;
    private String Pname;
    private int pay_money;
    private int counter_Fee;
    private int real_input;
    private int balance;
    private int transaction_type;
    private int has_invoice;
    private int person_in_charge;
    private String station_name;

    public String getStation_name() {
        return station_name;
    }

    public void setStation_name(String station_name) {
        this.station_name = station_name;
    }

    public int getPerson_in_charge() {
        return person_in_charge;
    }

    public void setPerson_in_charge(int person_in_charge) {
        this.person_in_charge = person_in_charge;
    }

    public int getHas_invoice() {
        return has_invoice;
    }

    public void setHas_invoice(int has_invoice) {
        this.has_invoice = has_invoice;
    }

    public int getTransaction_type() {
        return transaction_type;
    }

    public void setTransaction_type(int transaction_type) {
        this.transaction_type = transaction_type;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public int getReal_input() {
        return real_input;
    }

    public void setReal_input(int real_input) {
        this.real_input = real_input;
    }

    public int getCounter_Fee() {
        return counter_Fee;
    }

    public void setCounter_Fee(int counter_Fee) {
        this.counter_Fee = counter_Fee;
    }

    public int getPay_money() {
        return pay_money;
    }

    public void setPay_money(int pay_money) {
        this.pay_money = pay_money;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getPayer_id() {
        return payer_id;
    }

    public void setPayer_id(String payer_id) {
        this.payer_id = payer_id;
    }

    public String getStation_id() {
        return station_id;
    }

    public void setStation_id(String station_id) {
        this.station_id = station_id;
    }

    public String getOrder_id() {
        return order_id;
    }

    public void setOrder_id(String order_id) {
        this.order_id = order_id;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
