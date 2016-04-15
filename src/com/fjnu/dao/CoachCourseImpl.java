package com.fjnu.dao;

import com.fjnu.domain.CoachCourse;
import com.fjnu.domain.CoachStudent;
import com.fjnu.domain.Course;
import com.fjnu.domain.UserInfo;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by spzn on 16-1-10.
 */
public class CoachCourseImpl implements CoachCourseDAO{
    @Override
    public boolean InsertMessage(CoachCourse coachCourse) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("CoachCourse.InsertMessage", coachCourse);
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
    public List<CoachStudent> GetMessage(CoachStudent coachStudent) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;

        List<CoachStudent> list = new ArrayList<CoachStudent>();
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("CoachCourse.GetCoachCourse", coachStudent);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public boolean UpdatePrice(CoachCourse coachCourse) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("CoachCourse.UpdatePrice", coachCourse);
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
    public boolean DeleteCoachCourse(CoachCourse coachCourse) {
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;
        int flag = 0;
        try {
            sqlSession = dbAccess.getSqlSession();
            flag = sqlSession.update("CoachCourse.DeleteCoachCourse", coachCourse);
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
    public List<UserInfo> GetCoach() {
        List<UserInfo> list = new ArrayList<UserInfo>();
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;

        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("User.SelectCoach");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }

    @Override
    public List<Course> GetCourse() {
        List<Course> list = new ArrayList<Course>();
        DBAccess dbAccess = new DBAccess();
        SqlSession sqlSession = null;

        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("CoachCourse.SelectCourse");
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (sqlSession != null) {
                sqlSession.close();
            }
        }
        return list;
    }
}
