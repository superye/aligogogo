package com.fjnu.domain;

/**
 * Created by spzn on 16-4-4.
 */
public class station_month_PL {
    private String id;
    private String station_id;
    private String time;
    private String real_input;
    private String real_output;
    private String PL;

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

    public String getReal_input() {
        return real_input;
    }

    public void setReal_input(String real_input) {
        this.real_input = real_input;
    }

    public String getReal_output() {
        return real_output;
    }

    public void setReal_output(String real_output) {
        this.real_output = real_output;
    }

    public String getPL() {
        return PL;
    }

    public void setPL(String PL) {
        this.PL = PL;
    }
}
