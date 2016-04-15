package com.fjnu.domain;

/**
 * Created by yehao on 16/1/10.
 */
public class Choosen {
    private String cou_id;
    private String course_name;
    private String tea_id;
    private String type;
    private String start_day;
    private String end_day;
    private String use_course;
    private int price;

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getCou_id() {
        return cou_id;
    }

    public void setCou_id(String cou_id) {
        this.cou_id = cou_id;
    }

    public String getTea_id() {
        return tea_id;
    }

    public void setTea_id(String tea_id) {
        this.tea_id = tea_id;
    }

    public String getStart_day() {
        return start_day;
    }

    public void setStart_day(String start_day) {
        this.start_day = start_day;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getEnd_day() {
        return end_day;
    }

    public void setEnd_day(String end_day) {
        this.end_day = end_day;
    }

    public String getUse_course() {
        return use_course;
    }

    public void setUse_course(String use_course) {
        this.use_course = use_course;
    }
}
