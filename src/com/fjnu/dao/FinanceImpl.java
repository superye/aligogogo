package com.fjnu.dao;

import com.fjnu.domain.*;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Luxiaobai on 2016/3/29.
 */
public class FinanceImpl implements FinanceDAO {
    @Override
    public List<ClassFire> GetClassConsume() {
        DBAccess dbAccess = new DBAccess();
        List<ClassFire> list = new ArrayList<ClassFire>();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("ClassFire.SelectClassFireInfo");
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public List<station_day_input> GetDayIncomeInfo() {
        DBAccess dbAccess = new DBAccess();
        List<station_day_input> list = new ArrayList<station_day_input>();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("station_day_input.SelectDayInputInfo");
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public List<station_day_output> GetDayOutputInfo() {
        DBAccess dbAccess = new DBAccess();
        List<station_day_output> list = new ArrayList<station_day_output>();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("DayOutput.SelectDayOutputInfo");
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public List<Salary> GetSalaryInfo() {
        DBAccess dbAccess = new DBAccess();
        List<Salary> list = new ArrayList<Salary>();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("Salary.SelectSalaryInfo");
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public boolean InsertDayInput(station_day_input sdi) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("station_day_input.InsertDayInputInfo", sdi);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        if (flag != 0) return true;
        else return false;
    }

    @Override
    public boolean InsertDayOutput(station_day_output sdo) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("station_day_output.InsertDayOutputInfo", sdo);
            sqlSession.commit();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        if (flag != 0) return true;
        else return false;
    }
}
