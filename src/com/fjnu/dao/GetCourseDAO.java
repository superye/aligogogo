package com.fjnu.dao;

import com.fjnu.domain.CoachStudent;

import java.util.List;

/**
 * Created by yehao on 16/4/4.
 */
public interface GetCourseDAO {
    public List<Integer> GetCoursePrice(CoachStudent coachStudent);
    public List<String> GetCourseVersion();

}
