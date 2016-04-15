package com.fjnu.domain;

/**
 * Created by spzn on 16-2-12.
 */
public class Seat {
    private String station_name;
    private String classroom;
    private String numOfSeat;
    private String station_id;

    public String getStation_name() {
        return station_name;
    }

    public void setStation_name(String station_name) {
        this.station_name = station_name;
    }

    public String getClassroom() {
        return classroom;
    }

    public void setClassroom(String classroom) {
        this.classroom = classroom;
    }

    public String getNumOfSeat() {
        return numOfSeat;
    }

    public void setNumOfSeat(String numOfSeat) {
        this.numOfSeat = numOfSeat;
    }

    public String getStation_id() {
        return station_id;
    }

    public void setStation_id(String station_id) {
        this.station_id = station_id;
    }
}
