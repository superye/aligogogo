package com.fjnu.domain;

/**
 * Created by spzn on 16-4-4.
 */
public class station_month_output {
    private String id;
    private String station_id;
    private String time;
    private double pre_input;
    private double emp_salary;
    private double welfare;
    private double rent;
    private double fixed_money;
    private double normal_output;
    private double office_output;
    private double study_manager;
    private double market_extension;
    private double envir_manage;
    private double once_output;
    private double net_cost;
    private double coach_salary;
    private double other;
    private double total;
    private double commission_charge;
    private double WE_Fee;
    private double gas_Fee;
    private String station_name;

    public String getStation_name() {
        return station_name;
    }

    public void setStation_name(String station_name) {
        this.station_name = station_name;
    }

    public double getWE_Fee() {
        return WE_Fee;
    }

    public void setWE_Fee(double WE_Fee) {
        this.WE_Fee = WE_Fee;
    }

    public double getGas_Fee() {
        return gas_Fee;
    }

    public void setGas_Fee(double gas_Fee) {
        this.gas_Fee = gas_Fee;
    }

    public double getCommission_charge() {
        return commission_charge;
    }

    public void setCommission_charge(double commission_charge) {
        this.commission_charge = commission_charge;
    }

    public double getCoach_salary() {
        return coach_salary;
    }

    public void setCoach_salary(double coach_salary) {
        this.coach_salary = coach_salary;
    }

    public station_month_output() {
        other = 0;
        net_cost = 0;
        once_output = 0;
        envir_manage = 0;
        market_extension = 0;
        study_manager = 0;
        office_output = 0;
        normal_output = 0;
        fixed_money = 0;
        rent = 0;
        WE_Fee = 0;
        gas_Fee = 0;
        coach_salary = 0;
        commission_charge = 0;
        welfare = 0;
        pre_input = 0;
        emp_salary = 0;
        total = 0;
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

    public double getPre_input() {
        return pre_input;
    }

    public void setPre_input(double pre_input) {
        this.pre_input = pre_input;
    }

    public double getEmp_salary() {
        return emp_salary;
    }

    public void setEmp_salary(double emp_salary) {
        this.emp_salary = emp_salary;
    }

    public double getFixed_money() {
        return fixed_money;
    }

    public void setFixed_money(double fixed_money) {
        this.fixed_money = fixed_money;
    }

    public double getOffice_output() {
        return office_output;
    }

    public void setOffice_output(double office_output) {
        this.office_output = office_output;
    }

    public double getEnvir_manage() {
        return envir_manage;
    }

    public void setEnvir_manage(double envir_manage) {
        this.envir_manage = envir_manage;
    }

    public double getNet_cost() {
        return net_cost;
    }

    public void setNet_cost(double net_cost) {
        this.net_cost = net_cost;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public double getOther() {
        return other;
    }

    public void setOther(double other) {
        this.other = other;
    }

    public double getOnce_output() {
        return once_output;
    }

    public void setOnce_output(double once_output) {
        this.once_output = once_output;
    }

    public double getMarket_extension() {
        return market_extension;
    }

    public void setMarket_extension(double market_extension) {
        this.market_extension = market_extension;
    }

    public double getStudy_manager() {
        return study_manager;
    }

    public void setStudy_manager(double study_manager) {
        this.study_manager = study_manager;
    }

    public double getNormal_output() {
        return normal_output;
    }

    public void setNormal_output(double normal_output) {
        this.normal_output = normal_output;
    }

    public double getRent() {
        return rent;
    }

    public void setRent(double rent) {
        this.rent = rent;
    }

    public double getWelfare() {
        return welfare;
    }

    public void setWelfare(double welfare) {
        this.welfare = welfare;
    }

}
