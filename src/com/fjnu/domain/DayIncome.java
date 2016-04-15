package com.fjnu.domain;

/**
 * Created by Luxiaobai on 2016/3/30.
 */
public class DayIncome {
    private int recordId;
    private String type;
    private String stationId;
    private String date;
    private double price;
    private double balance;
    private String payType;
    private String productName;
    private double poundage;
    private double real_income;
    private String brokerage;

    public double getBalance() { return balance; }

    public void setBalance(double balance) { this.balance = balance; }

    public int getRecordId() { return recordId; }

    public void setRecordId(int recordId) {
        this.recordId = recordId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getStationId() {
        return stationId;
    }

    public void setStationId(String stationId) {
        this.stationId = stationId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getPayType() {
        return payType;
    }

    public void setPayType(String payType) {
        this.payType = payType;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getPoundage() {
        return poundage;
    }

    public void setPoundage(double poundage) {
        this.poundage = poundage;
    }

    public double getReal_income() {
        return real_income;
    }

    public void setReal_income(double real_income) {
        this.real_income = real_income;
    }

    public String getBrokerage() {
        return brokerage;
    }

    public void setBrokerage(String brokerage) {
        this.brokerage = brokerage;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
}
