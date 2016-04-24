package com.fjnu.domain;

import java.util.Date;

/**
 * Created by spzn on 16-4-4.
 */
public class station_month_input {
    private String id;
    private String station_id;
    private String time;
    private double pre_study_manage;
    private double offline_study_manage;
    private double online_study_manage;
    private double studying_test;
    private double online_Fteacher;
    private double meal_input;
    private double other;
    private double total;
    private String station_name;
    public station_month_input() {
        pre_study_manage = 0;
        offline_study_manage = 0;
        online_Fteacher = 0;
        studying_test = 0;
        online_study_manage = 0;
        meal_input = 0;
        other = 0;
        total = 0;
    }

    public String getStation_name() {
        return station_name;
    }

    public void setStation_name(String station_name) {
        this.station_name = station_name;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getStation_id() {
        return station_id;
    }

    public void setStation_id(String station_id) {
        this.station_id = station_id;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public double getOnline_study_manage() {
        return online_study_manage;
    }

    public void setOnline_study_manage(double online_study_manage) {
        this.online_study_manage = online_study_manage;
    }

    public double getStudying_test() {
        return studying_test;
    }

    public void setStudying_test(double studying_test) {
        this.studying_test = studying_test;
    }

    public double getMeal_input() {
        return meal_input;
    }

    public void setMeal_input(double meal_input) {
        this.meal_input = meal_input;
    }

    public double getOther() {
        return other;
    }

    public void setOther(double other) {
        this.other = other;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getOnline_Fteacher() {
        return online_Fteacher;
    }

    public void setOnline_Fteacher(double online_Fteacher) {
        this.online_Fteacher = online_Fteacher;
    }

    public double getOffline_study_manage() {
        return offline_study_manage;
    }

    public void setOffline_study_manage(double offline_study_manage) {
        this.offline_study_manage = offline_study_manage;
    }

    public double getPre_study_manage() {
        return pre_study_manage;
    }

    public void setPre_study_manage(double pre_study_manage) {
        this.pre_study_manage = pre_study_manage;
    }
}
