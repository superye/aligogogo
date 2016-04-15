package com.fjnu.dao;

import com.fjnu.domain.CoachCourse;
import com.fjnu.domain.CoachStudent;
import com.fjnu.domain.Course;
import com.fjnu.domain.UserInfo;

import java.util.List;

/**
 * Created by spzn on 16-2-15.
 */
public interface CoachCourseDAO {
    public List<CoachStudent> GetMessage(CoachStudent coachStudent);
    public boolean UpdatePrice(CoachCourse coachCourse);
    public boolean InsertMessage(CoachCourse coachCourse);
    public boolean DeleteCoachCourse(CoachCourse coachCourse);
    public List<UserInfo> GetCoach();
    public List<Course> GetCourse();
}
