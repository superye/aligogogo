package com.fjnu.domain;

/**
 * Created by spzn on 16-4-4.
 */
public class station_day_output {
    private int id;
    private String apply_id;
    private String station_id;
    private String User_id;
    private String time;
    private int type;
    private String Pname;
    private int pay_money;
    private int counter_Fee;
    private int real_output;
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


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getApply_id() {
        return apply_id;
    }

    public void setApply_id(String apply_id) {
        this.apply_id = apply_id;
    }

    public String getStation_id() {
        return station_id;
    }

    public void setStation_id(String station_id) {
        this.station_id = station_id;
    }

    public String getUser_id() {
        return User_id;
    }

    public void setUser_id(String user_id) {
        User_id = user_id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public String getPname() {
        return Pname;
    }

    public void setPname(String pname) {
        Pname = pname;
    }

    public int getPay_money() {
        return pay_money;
    }

    public void setPay_money(int pay_money) {
        this.pay_money = pay_money;
    }

    public int getCounter_Fee() {
        return counter_Fee;
    }

    public void setCounter_Fee(int counter_Fee) {
        this.counter_Fee = counter_Fee;
    }

    public int getReal_output() {
        return real_output;
    }

    public void setReal_output(int real_output) {
        this.real_output = real_output;
    }

    public int getBalance() {
        return balance;
    }

    public void setBalance(int balance) {
        this.balance = balance;
    }

    public int getTransaction_type() {
        return transaction_type;
    }

    public void setTransaction_type(int transaction_type) {
        this.transaction_type = transaction_type;
    }

    public int getHas_invoice() {
        return has_invoice;
    }

    public void setHas_invoice(int has_invoice) {
        this.has_invoice = has_invoice;
    }

    public int getPerson_in_charge() {
        return person_in_charge;
    }

    public void setPerson_in_charge(int person_in_charge) {
        this.person_in_charge = person_in_charge;
    }
}
