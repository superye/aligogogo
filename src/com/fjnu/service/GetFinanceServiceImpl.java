package com.fjnu.service;

import com.fjnu.dao.FinanceDAO;
import com.fjnu.dao.FinanceImpl;
import com.fjnu.domain.*;

import java.util.List;

/**
 * Created by Luxiaobai on 2016/3/29.
 */
public class GetFinanceServiceImpl implements GetFinanceService {
    @Override
    public List<ClassFire> GetClassConsumeInfo() {
        FinanceDAO financeDAO = new FinanceImpl();
        return financeDAO.GetClassConsume();
    }

    @Override
    public List<station_day_input> GetDayIncomeInfo() {
        FinanceDAO financeDAO = new FinanceImpl();
        return financeDAO.GetDayIncomeInfo();
    }

    @Override
    public List<Salary> GetSalaryInfo() {
        FinanceDAO financeDAO = new FinanceImpl();
        return financeDAO.GetSalaryInfo();
    }

    @Override
    public List<station_day_output> GetDayOutputInfo() {
        FinanceDAO financeDAO = new FinanceImpl();
        return financeDAO.GetDayOutputInfo();
    }

    @Override
    public boolean InsertDayInput(station_day_input sdi) {
        FinanceDAO financeDAO = new FinanceImpl();
        return financeDAO.InsertDayInput(sdi);
    }

    @Override
    public boolean InsertDayOutput(station_day_output sdo) {
        FinanceDAO financeDAO = new FinanceImpl();
        return financeDAO.InsertDayOutput(sdo);
    }

    @Override
    public List<Coa_Salary> GetCoa_SalaryInfo() {
        FinanceDAO financeDAO = new FinanceImpl();
        return financeDAO.GetCoa_SalaryInfo();
    }
}
