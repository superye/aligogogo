package com.fjnu.dao;

import com.fjnu.domain.User;
import com.fjnu.domain.UserInfo;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yehao on 16/1/10.
 */
public class UserImpl implements UserDAO{
    /**
     * 通过用户部分信息,获取用户
     * @param user
     * @return
     */
    @Override
    public List<User> GetUser(User user) {
        DBAccess dbAccess = new DBAccess();
        List<User> list = new ArrayList<User>();
        SqlSession sqlSession = null;
        dbAccess.GetLog();
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("User.CheckUser", user);
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
    public List<UserInfo> GetName(UserInfo userInfo) {
         DBAccess dbAccess = new DBAccess();
        List<UserInfo> list = new ArrayList<UserInfo>();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("User.SelectName", userInfo);
        }catch (IOException e) {
            e.printStackTrace();
        }finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }
}
