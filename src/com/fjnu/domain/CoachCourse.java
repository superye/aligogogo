package com.fjnu.domain;

/**
 * Created by spzn on 16-1-10.
 */
public class CoachCourse {
    private String coa_id;
    private String coa_name;
    private String cou_id;
    private String cou_name;
    private int price;
    private String station;

    public String getStation() {
        return station;
    }

    public void setStation(String station) {
        this.station = station;
    }

    public String getCoa_name() {
        return coa_name;
    }

    public void setCoa_name(String coa_name) {
        this.coa_name = coa_name;
    }

    public String getCou_name() {
        return cou_name;
    }

    public void setCou_name(String cou_name) {
        this.cou_name = cou_name;
    }

    public String getCoa_id() {
        return coa_id;
    }

    public void setCoa_id(String coa_id) {
        this.coa_id = coa_id;
    }

    public String getCou_id() {
        return cou_id;
    }

    public void setCou_id(String cou_id) {
        this.cou_id = cou_id;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
