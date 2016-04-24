package com.fjnu.service;

import com.fjnu.dao.FinanceDAO;
import com.fjnu.dao.FinanceImpl;
import com.fjnu.domain.*;

import java.text.SimpleDateFormat;
import java.util.*;

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

    @Override
    public List<station_month_output> GetMonthOutputInfo() {
        FinanceDAO financeDAO = new FinanceImpl();
        List<station_day_output> list = financeDAO.GetDayOutputInfo();
        List<station_month_output> ans = new ArrayList<>();
        Map<String, String> map = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm");
        for (int i = 0; i < list.size(); i++) {
            String time = sdf.format(list.get(i).getTime());
            int type = list.get(i).getType();
            int flag = 0;
            if (map.containsKey(time)) {
                for (int j = 0; j < ans.size(); j++) {
                    String time2 = sdf.format(ans.get(j).getTime());
                    if (time.equals(time2) && list.get(i).getStation_name().equals(ans.get(j).getStation_name())) {
                        flag = 1;
                        if (type == 1) {
                            double temp = ans.get(j).getEmp_salary();
                            ans.get(j).setEmp_salary(temp + list.get(i).getReal_output());
                        } else if (type == 2) {
                            double temp = ans.get(j).getCoach_salary();
                            ans.get(j).setCoach_salary(temp + list.get(i).getReal_output());
                        } else if (type == 3) {
                            double temp = ans.get(j).getCommission_charge();
                            ans.get(j).setCommission_charge(temp + list.get(i).getReal_output());
                        } else if (type == 4) {
                            double temp = ans.get(j).getWelfare();
                            ans.get(j).setWelfare(temp + list.get(i).getReal_output());
                        } else if (type == 5) {
                            double temp = ans.get(j).getPre_input();
                            ans.get(j).setPre_input(temp + list.get(i).getReal_output());
                        } else if (type == 6) {
                            double temp = ans.get(j).getGas_Fee();
                            ans.get(j).setGas_Fee(temp + list.get(i).getReal_output());
                        } else if (type == 7) {
                            double temp = ans.get(j).getRent();
                            ans.get(j).setRent(temp + list.get(i).getReal_output());
                        } else if (type == 8) {
                            double temp = ans.get(j).getWE_Fee();
                            ans.get(j).setWE_Fee(temp + list.get(i).getReal_output());
                        } else if (type == 9) {
                            double temp = ans.get(j).getNormal_output();
                            ans.get(j).setNormal_output(temp + list.get(i).getReal_output());
                        } else if (type == 10) {
                            double temp = ans.get(j).getStudy_manager();
                            ans.get(j).setStudy_manager(temp + list.get(i).getReal_output());
                        } else if (type == 11) {
                            double temp = ans.get(j).getOffice_output();
                            ans.get(j).setOffice_output(temp + list.get(i).getReal_output());
                        } else if (type == 12) {
                            double temp = ans.get(j).getFixed_money();
                            ans.get(j).setFixed_money(temp + list.get(i).getReal_output());
                        } else if (type == 13) {
                            double temp = ans.get(j).getMarket_extension();
                            ans.get(j).setMarket_extension(temp + list.get(i).getReal_output());
                        } else if (type == 14) {
                            double temp = ans.get(j).getEnvir_manage();
                            ans.get(j).setEnvir_manage(temp + list.get(i).getReal_output());
                        } else if (type == 15) {
                            double temp = ans.get(j).getNet_cost();
                            ans.get(j).setNet_cost(temp + list.get(i).getReal_output());
                        } else if (type == 16) {
                            double temp = ans.get(j).getOnce_output();
                            ans.get(j).setOnce_output(temp + list.get(i).getReal_output());
                        } else if (type == 17) {
                            double temp = ans.get(j).getOther();
                            ans.get(j).setOther(temp + list.get(i).getReal_output());
                        }
                        break;
                    }
                }
            }
            if (flag == 0) {
                map.put(time, "1");
                station_month_output smo = new station_month_output();
                smo.setTime(sdf.format(list.get(i).getTime()));
                smo.setStation_name(list.get(i).getStation_name());
                if (type == 1) {
                    smo.setEmp_salary(list.get(i).getReal_output());
                } else if (type == 2) {
                    smo.setCoach_salary(list.get(i).getReal_output());
                } else if (type == 3) {
                    smo.setCommission_charge(list.get(i).getReal_output());
                } else if (type == 4) {
                    smo.setWelfare(list.get(i).getReal_output());
                } else if (type == 5) {
                    smo.setPre_input(list.get(i).getReal_output());
                } else if (type == 6) {
                    smo.setGas_Fee(list.get(i).getReal_output());
                } else if (type == 7) {
                    smo.setRent(list.get(i).getReal_output());
                } else if (type == 8) {
                    smo.setWE_Fee(list.get(i).getReal_output());
                } else if (type == 9) {
                    smo.setNormal_output(list.get(i).getReal_output());
                } else if (type == 10) {
                    smo.setStudy_manager(list.get(i).getReal_output());
                } else if (type == 11) {
                    smo.setOffice_output(list.get(i).getReal_output());
                } else if (type == 12) {
                    smo.setFixed_money(list.get(i).getReal_output());
                } else if (type == 13) {
                    smo.setMarket_extension(list.get(i).getReal_output());
                } else if (type == 14) {
                    smo.setEnvir_manage(list.get(i).getReal_output());
                } else if (type == 15) {
                    smo.setNet_cost(list.get(i).getReal_output());
                } else if (type == 16) {
                    smo.setOnce_output(list.get(i).getReal_output());
                } else if (type == 17) {
                    smo.setOther(list.get(i).getReal_output());
                }
                ans.add(smo);
            }
        }
        for (int i = 0; i < ans.size(); i++) {
            ans.get(i).setTotal(ans.get(i).getCoach_salary() + ans.get(i).getWelfare() + ans.get(i).getCommission_charge()
                                + ans.get(i).getEmp_salary() + ans.get(i).getEnvir_manage() + ans.get(i).getFixed_money()
                                + ans.get(i).getGas_Fee() + ans.get(i).getMarket_extension() + ans.get(i).getNet_cost()
                                + ans.get(i).getNormal_output() + ans.get(i).getOffice_output() + ans.get(i).getOnce_output()
                                + ans.get(i).getOther() + ans.get(i).getPre_input() + ans.get(i).getRent()
                                + ans.get(i).getStudy_manager() + ans.get(i).getWE_Fee()
            );
        }
        return ans;
    }

    @Override
    public List<station_month_input> GetMonthInputInfo() {
        FinanceDAO financeDAO = new FinanceImpl();
        List<station_day_input> list = financeDAO.GetDayIncomeInfo();
        List<station_month_input> ans = new ArrayList<>();
        Map<String, String> map = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm");
        for (int i = 0; i < list.size(); i++) {
            String time = sdf.format(list.get(i).getTime());
            int type = list.get(i).getType();
            int flag = 0;
            if (map.containsKey(time)) {
                for (int j = 0; j < ans.size(); j++) {
                    String time2 = sdf.format(ans.get(j).getTime());
                    if (time.equals(time2) && list.get(i).getStation_name().equals(ans.get(j).getStation_name())) {
                        flag = 1;
                        if (type == 1) {
                            double temp = ans.get(j).getPre_study_manage();
                            ans.get(j).setPre_study_manage(temp + list.get(i).getReal_input());
                        } else if (type == 2) {
                            double temp = ans.get(j).getOffline_study_manage();
                            ans.get(j).setOffline_study_manage(temp + list.get(i).getReal_input());
                        } else if (type == 3) {
                            double temp = ans.get(j).getStudying_test();
                            ans.get(j).setStudying_test(temp + list.get(i).getReal_input());
                        } else if (type == 4) {
                            double temp = ans.get(j).getOnline_study_manage();
                            ans.get(j).setOnline_study_manage(temp + list.get(i).getReal_input());
                        } else if (type == 5) {
                            double temp = ans.get(j).getOnline_Fteacher();
                            ans.get(j).setOnline_Fteacher(temp + list.get(i).getReal_input());
                        } else if (type == 6) {
                            double temp = ans.get(j).getMeal_input();
                            ans.get(j).setMeal_input(temp + list.get(i).getReal_input());
                        } else if (type == 7) {
                            double temp = ans.get(j).getOther();
                            ans.get(j).setOther(temp + list.get(i).getReal_input());
                        }
                        break;
                    }
                }
            }
            if (flag == 0) {
                map.put(time, "1");
                station_month_input smi = new station_month_input();
                smi.setTime(sdf.format(list.get(i).getTime()));
                smi.setStation_name(list.get(i).getStation_name());
                if (type == 1) {
                    smi.setPre_study_manage(list.get(i).getReal_input());
                } else if (type == 2) {
                    smi.setOffline_study_manage(list.get(i).getReal_input());
                } else if (type == 3) {
                    smi.setStudying_test(list.get(i).getReal_input());
                } else if (type == 4) {
                    smi.setOnline_study_manage(list.get(i).getReal_input());
                } else if (type == 5) {
                    smi.setOnline_Fteacher(list.get(i).getReal_input());
                } else if (type == 6) {
                    smi.setMeal_input(list.get(i).getReal_input());
                } else if (type == 7) {
                    smi.setOther(list.get(i).getReal_input());
                }
                ans.add(smi);
            }
        }
        for (int i = 0; i < ans.size(); i++) {
            ans.get(i).setTotal(ans.get(i).getPre_study_manage() + ans.get(i).getOffline_study_manage()
                                + ans.get(i).getMeal_input() + ans.get(i).getOnline_Fteacher()
                                + ans.get(i).getOnline_study_manage() + ans.get(i).getOther()
                                + ans.get(i).getStudying_test()
            );
        }
        return ans;
    }

    @Override
    public List<station_month_PL> GetMonthPLInfo() {
        List<station_month_PL> ans = new ArrayList<>();
        List<station_month_input> smi = this.GetMonthInputInfo();
        List<station_month_output> smo = this.GetMonthOutputInfo();
        Map<String, String> mp = new HashMap<>();
        station_month_PL smp = new station_month_PL();
        for (int i = 0; i < smi.size(); i++) {
            smp.setStation_name(smi.get(i).getStation_name());
            smp.setTime(smi.get(i).getTime());
            smp.setReal_input(smi.get(i).getTotal());
            smp.setReal_output(0);
            smp.setPL(smi.get(i).getTotal());
            mp.put(smi.get(i).getTime(), "1");
            ans.add(smp);
        }
        for (int i = 0; i < smo.size(); i++) {
            int flag = 0;
            if (mp.containsKey(smo.get(i).getTime())) {
                for (int j = 0; j < ans.size(); j++) {
                    if (smo.get(i).getTime().equals(ans.get(j).getTime()) && smo.get(i).getStation_name().equals(ans.get(j).getStation_name())) {
                        flag = 1;
                        double temp = ans.get(j).getReal_output();
                        ans.get(j).setReal_output(temp + smo.get(i).getTotal());
                        temp = ans.get(j).getPL();
                        ans.get(j).setPL(temp - smo.get(i).getTotal());
                        break;
                    }
                }
            }
            if (flag == 0) {
                smp.setStation_name(smo.get(i).getStation_name());
                smp.setTime(smo.get(i).getTime());
                smp.setReal_input(0);
                smp.setReal_output(smo.get(i).getTotal());
                smp.setPL(smo.get(i).getTotal());
                mp.put(smo.get(i).getTime(), "1");
                ans.add(smp);
            }
        }
        return ans;
    }
}
