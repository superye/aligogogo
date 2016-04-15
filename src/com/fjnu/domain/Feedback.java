package com.fjnu.domain;

/**
 * Created by spzn on 16-2-12.
 */
public class Feedback {
    private String fid;
    private String coa_name;
    private String cou_id;
    private String cou_name;
    private String date;
    private String IsNonarrival;
    private String IsLate;
    private String lateTime;

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

    public String getFid() {
        return fid;
    }

    public void setFid(String fid) {
        this.fid = fid;
    }

    public String getCou_id() {
        return cou_id;
    }

    public void setCou_id(String cou_id) {
        this.cou_id = cou_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getIsNonarrival() {
        return IsNonarrival;
    }

    public void setIsNonarrival(String isNonarrival) {
        IsNonarrival = isNonarrival;
    }

    public String getIsLate() {
        return IsLate;
    }

    public void setIsLate(String isLate) {
        IsLate = isLate;
    }

    public String getLateTime() {
        return lateTime;
    }

    public void setLateTime(String lateTime) {
        this.lateTime = lateTime;
    }
}
