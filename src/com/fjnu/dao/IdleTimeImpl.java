package com.fjnu.dao;

import com.fjnu.domain.IdleTime;
import com.fjnu.domain.User;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by spzn on 16-2-11.
 */
public class IdleTimeImpl implements IdleTimeDAO{
    @Override
    public List<IdleTime> GetMessage(User user) {
        DBAccess dbAccess = new DBAccess();
        List<IdleTime> list = new ArrayList<IdleTime>();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("IdleTime.SelectCoachIdle", user);
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
    public boolean InsertMessage(IdleTime idleTime) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("IdleTime.InsertMessage", idleTime);
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
    public boolean DeleteIdle(IdleTime idleTime) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("IdleTime.DeleteIdle", idleTime);
            sqlSession.commit();
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        if (flag != 0) return true;
        return false;
    }

}
