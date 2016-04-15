package com.fjnu.service;

import com.fjnu.domain.*;

import java.util.List;

/**
 * Created by yehao on 16/1/10.
 */

/**
 * 查询信息的服务
 */
public interface GetMessageService {
    public List<CoachStudent> GetCoachCourse(CoachStudent coachStudent);
    public Schedule GetIdleMessage(User user);
    public List<CoachStudent> GetCoachStudent(CoachStudent coachStudent);
    public Schedule GetSchedule(CoachStudent coachStudent);
    public List<CoachStudent> GetStudentCourse(CoachStudent coachStudent);
    public List<Seat> GetSeat();
    public String GetUserName(String username);
    public int GetMinClassroom(CoachStudent coachStudent);
    public List<UserInfo> GetCoach();
    public List<Course> GetCourse();
    public List<Seat> GetStation();
    public List<Feedback> GetFeedback();
    public int[][] GetSeatDetail(CoachStudent coachStudent);

    public List<CoachStudent> GetNopayOrder();

    public int GetCoursePrice(CoachStudent coachStudent);
}
