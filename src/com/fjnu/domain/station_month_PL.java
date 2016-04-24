package com.fjnu.domain;

import java.util.Date;

/**
 * Created by spzn on 16-4-4.
 */
public class station_month_PL {
    private String id;
    private String station_id;
    private String station_name;
    private String time;
    private double real_input;
    private double real_output;
    private double PL;

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

    public double getReal_output() {
        return real_output;
    }

    public void setReal_output(double real_output) {
        this.real_output = real_output;
    }

    public double getReal_input() {
        return real_input;
    }

    public void setReal_input(double real_input) {
        this.real_input = real_input;
    }

    public double getPL() {
        return PL;
    }

    public void setPL(double PL) {
        this.PL = PL;
    }
}
