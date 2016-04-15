package com.fjnu.domain;

/**
 * Created by Luxiaobai on 2016/3/29.
 */
public class ClassFire {
    private int id;
    private String date;
    private String name;
    private String stu_id;
    private String clazz;
    private int period;
    private double pay;
    private double income;
    private double unit_price;
    private int consume_time;
    private double consume_price;
    private String kind;

    private double real_price;
    private double per_cmn;
    private double cmn;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStu_id() {
        return stu_id;
    }

    public void setStu_id(String stu_id) {
        this.stu_id = stu_id;
    }

    public String getClazz() { return clazz; }

    public void setClazz(String clazz) { this.clazz = clazz; }

    public double getPay() {
        return pay;
    }

    public void setPay(double pay) {
        this.pay = pay;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public int getConsume_time() {
        return consume_time;
    }

    public void setConsume_time(int consume_time) {
        this.consume_time = consume_time;
    }

    public double getUnit_price() {
        return unit_price;
    }

    public void setUnit_price(double unit_price) {
        this.unit_price = unit_price;
    }

    public double getIncome() {
        return income;
    }

    public void setIncome(double income) {
        this.income = income;
    }

    public double getConsume_price() {
        return consume_price;
    }

    public void setConsume_price(double consume_price) {
        this.consume_price = consume_price;
    }

    public String getKind() {
        return kind;
    }

    public void setKind(String kind) {
        this.kind = kind;
    }

    public double getPer_cmn() {
        return per_cmn;
    }

    public void setPer_cmn(double per_cmn) {
        this.per_cmn = per_cmn;
    }

    public double getCmn() {
        return cmn;
    }

    public void setCmn(double cmn) { this.cmn = cmn; }

    public double getReal_price() { return real_price; }

    public void setReal_price(double real_price) { this.real_price = real_price; }

}
