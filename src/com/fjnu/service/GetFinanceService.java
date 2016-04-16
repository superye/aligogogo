package com.fjnu.service;

import com.fjnu.domain.*;

import java.util.List;

/**
 * Created by Luxiaobai on 2016/3/29.
 */
public interface GetFinanceService {
    public List<ClassFire> GetClassConsumeInfo();
    public List<station_day_output> GetDayOutputInfo();
    public List<station_day_input> GetDayIncomeInfo();
    public List<Salary> GetSalaryInfo();
    public boolean InsertDayInput(station_day_input sdi);
    public boolean InsertDayOutput(station_day_output sdo);
    public List<Coa_Salary> GetCoa_SalaryInfo();
}
