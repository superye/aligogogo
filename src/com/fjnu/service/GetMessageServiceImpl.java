package com.fjnu.service;

import com.fjnu.dao.*;
import com.fjnu.domain.*;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yehao on 16/1/11.
 */

/**
 * 获取选课信息
 */
public class GetMessageServiceImpl implements GetMessageService {
    @Override
    public String GetUserName(String username) {
        if (username == null || username == "") return null;
        UserInfo userInfo = new UserInfo();
        userInfo.setUsername(username);
        String name;
        UserDAO userDAO = new UserImpl();
        List<UserInfo> list = userDAO.GetName(userInfo);
        if (list.size() == 0) return null;
        userInfo = list.get(0);
        return userInfo.getName();
    }

    @Override
    //获取教师及学生对应课程情况
    public List<CoachStudent> GetCoachStudent(CoachStudent coachStudent) {
        ChoosenImpl choosen = new ChoosenImpl();
        List<CoachStudent> list = new ArrayList<CoachStudent>();
        list = choosen.GetUserChoosen(coachStudent);
        DuplicateRemoval2(list);
        return list;
    }

    @Override
    //获取教师教授课程情况
    public List<CoachStudent> GetCoachCourse(CoachStudent coachStudent) {
        CoachCourseImpl coachCourse = new CoachCourseImpl();
        List<CoachStudent> list = new ArrayList<CoachStudent>();
        list = coachCourse.GetMessage(coachStudent);
        return list;
    }

    @Override
    //获取教师空闲时间信息
    public Schedule GetIdleMessage(User user) {
        Schedule schedule = new Schedule();
        schedule.Clear();
        IdleTimeImpl idleTime = new IdleTimeImpl();
        List<IdleTime> list = new ArrayList<IdleTime>();
        list = idleTime.GetMessage(user);

        for (int i = 0; i < list.size(); i++) {
            int week = Integer.parseInt(list.get(i).getWeekday());
            int clazz = Integer.parseInt(list.get(i).getClazz());
            schedule.getITschedule()[week][clazz] = list.get(i);
        }

        return schedule;
    }

    //去重
    public void DuplicateRemoval2(List<CoachStudent> list) {
        int len = list.size();
        for (int i = 0; i < len; i++) {
            for (int j = i + 1; j < len; j++) {
                if (Equal2(list.get(i), list.get(j))) {
                    list.remove(j);
                    j--;
                    len--;
                }
            }
        }
    }

    //判等
    public boolean Equal2(CoachStudent c1, CoachStudent c2) {
        if (!c1.getCou_id().equals(c2.getCou_id())) return false;
        return true;
    }


    @Override
    //获取学生课程信息
    public List<CoachStudent> GetStudentCourse(CoachStudent coachStudent) {
        ChoosenImpl choosenimpl = new ChoosenImpl();
        List<CoachStudent> list = new ArrayList<CoachStudent>();
        list = choosenimpl.GetUserChoosen(coachStudent);
        return list;
    }

    @Override
    //获取课表
    public Schedule GetSchedule(CoachStudent coachStudent) {
        Schedule schedule = new Schedule();
        schedule.Clear();
        ChoosenDAO choosenDAO = new ChoosenImpl();
        List<CoachStudent> list = choosenDAO.GetUserChoosen(coachStudent);
        //将查询到的数据按星期及时段插入schedule中
        for (int i = 0; i < list.size(); i++) {
            int week = Integer.parseInt(list.get(i).getWeekday());
            int clazz = Integer.parseInt(list.get(i).getClazz());
            list.get(i).setCoa_name(GetUserName(list.get(i).getCoa_id()));
            list.get(i).setStu_name(GetUserName(list.get(i).getStu_id()));
            schedule.getCSschedule()[week][clazz] = list.get(i);
        }
        return schedule;
    }

    @Override
    public int GetMinClassroom(CoachStudent coachStudent) {
        int[] state = new int[105];
        for (int i = 0; i < 105; i++) state[i] = 0;
        ChoosenDAO choosenDAO = new ChoosenImpl();
        SeatDAO seatDAO = new SeatImpl();
        List<Integer> list = choosenDAO.GetClassroomInfo(coachStudent);
        for (int i = 0; i < list.size(); i++) {
           state[list.get(i)]++;
        }
        int ans = 100;
        int Min = -1;
        int CNum;
        if (coachStudent.equals("Online")) {
            for (int i = 1; i <= 100; i++) {
                if (state[i] == 0) {
                    return i;
                }
            }
        }
        CNum = seatDAO.GetClassroomNum(coachStudent.getStation());
        for (int i = 1; i <= CNum; i++) {
            if (state[i] < ans) {
                ans = state[i];
                Min = i;
            }
        }
        return Min;
    }

    @Override
    public List<UserInfo> GetCoach() {
        List<UserInfo> list = new ArrayList<UserInfo>();
        CoachCourseDAO coachCourseDAO = new CoachCourseImpl();
        list = coachCourseDAO.GetCoach();
        return list;
    }

    @Override
    public List<Course> GetCourse() {
        List<Course> list = new ArrayList<Course>();
        CoachCourseDAO coachCourseDAO = new CoachCourseImpl();
        list = coachCourseDAO.GetCourse();
        return list;
    }

    @Override
    public List<Seat> GetStation() {
        List<Seat> list = new ArrayList<Seat>();
        SeatDAO seatDAO = new SeatImpl();
        list = seatDAO.GetStation();
        return list;
    }

    @Override
    public List<Feedback> GetFeedback() {
        List<Feedback> list = new ArrayList<Feedback>();
        FeedbackDAO feedbackDAO = new FeedbackImpl();
        list = feedbackDAO.GetMessage();
        return list;
    }

    @Override
    public List<Seat> GetSeat() {
        List<Seat> list = new ArrayList<>();
        SeatDAO seatDAO = new SeatImpl();
        list = seatDAO.GetSeat();
        return list;
    }

    @Override
    public int[][] GetSeatDetail(CoachStudent coachStudent) {
        int[][] state = new int[26][7];
        List<CoachStudent> list = new ArrayList<>();
        ChoosenDAO choosenDAO = new ChoosenImpl();
        list = choosenDAO.GetAllChoosen(coachStudent);
        int len = list.size();
        for (int i = 0; i < len; i++) {
            state[Integer.parseInt(list.get(i).getClazz())-1][Integer.parseInt(list.get(i).getWeekday())-1]++;
        }
        return state;
    }

    @Override
    public List<CoachStudent> GetNopayOrder() {
        List<CoachStudent> list = new ArrayList<>();
        ChoosenDAO choosenDAO = new ChoosenImpl();
        list = choosenDAO.GetNopayOrder();

        return list;
    }

    @Override
    public int GetCoursePrice(CoachStudent coachStudent) {
        List<Integer> list = new ArrayList<>();
        GetCourseDAO getCourseDAO = new GetCourseImpl();
        list = getCourseDAO.GetCoursePrice(coachStudent);

        return list.get(0);
    }
}
