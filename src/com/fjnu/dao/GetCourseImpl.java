package com.fjnu.dao;

import com.fjnu.domain.ClassFire;
import com.fjnu.domain.CoachStudent;
import org.apache.ibatis.session.SqlSession;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yehao on 16/4/10.
 */
public class GetCourseImpl implements GetCourseDAO{
    @Override
    public List<Integer> GetCoursePrice(CoachStudent coachStudent) {
        DBAccess dbAccess = new DBAccess();
        List<Integer> list = new ArrayList<>();
        SqlSession sqlSession = null;
        try {
            sqlSession = dbAccess.getSqlSession();
            list = sqlSession.selectList("CoachCourse.GetCoursePrice", coachStudent);
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
    public List<String> GetCourseVersion() {
        return null;
    }
}
