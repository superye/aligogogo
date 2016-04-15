package com.fjnu.service;

import com.fjnu.dao.*;
import com.fjnu.domain.*;

import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by spzn on 16-2-12.
 */
public class AddMessageServiceImpl implements AddMessageService{

    @Override
    //将字符串信息进行处理
    public CoachStudent Trans(String choosen) {
        CoachCourseDAO coachCourseDAO = new CoachCourseImpl();
        CoachStudent coachStudent = new CoachStudent();
        coachStudent.setCou_id(sub(choosen, 0).trim());
        coachStudent.setCoa_id(sub(choosen, 1).trim());
        coachStudent.setType(sub(choosen, 2).trim());

      /*  System.out.println(coachStudent.getCou_id());
        System.out.println(coachStudent.getCoa_id());
        System.out.println(coachStudent.getType());
        System.out.println(coachStudent.getClazz());
        System.out.println(coachStudent.getWeekday()); */

        List<CoachStudent> list = new ArrayList<CoachStudent>();
        list = coachCourseDAO.GetMessage(coachStudent);
        list.get(0).setClazz(sub(choosen, 3).trim());
        list.get(0).setWeekday(sub(choosen, 4).trim());
        //为了自动分配教室，此处先将结束时间设为当前时间
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
        String date = df.format(new Date());
        list.get(0).setEnd_day(date);

        GetMessageService getMessageService = new GetMessageServiceImpl();
        int classroom = getMessageService.GetMinClassroom(list.get(0));

        list.get(0).setClassroom(String.valueOf(classroom));

        return list.get(0);
    }

    //以#为分隔符对字符串进行切割截取
    protected String sub(String str, int cut) {
        String subString = "";
        int l = str.length();
        int num = 0;
        boolean flag = false;
        for (int i = 0; i < l; i++) {
            if (str.charAt(i) == '#' && flag == true) {
                break;
            }
            if (str.charAt(i) == '#') {
                num++;
                continue;
            }
            if (num == cut) {
                flag = true;
                subString += str.charAt(i);
                continue;
            }
        }
        return subString;
    }

    @Override
    public boolean AddFeedback(Feedback feedback) {
        FeedbackDAO feedbackDAO = new FeedbackImpl();
        boolean flag = feedbackDAO.InsertMessage(feedback);
        return flag;
    }

    @Override
    //增加教师教授课程信息
    public boolean AddCoachCourse(CoachCourse coachCourse) {
        CoachCourseDAO coachCourseDAO = new CoachCourseImpl();
        boolean flag = true;
        flag = coachCourseDAO.InsertMessage(coachCourse);
        return flag;
    }

    @Override
    //增加学生选课信息
    public boolean AddChoosen(CoachStudent coachStudent) {
        ChoosenDAO choosenDAO = new ChoosenImpl();

        //获取当前星期
        DateFormat df = new SimpleDateFormat("EEEE");
        String d = df.format(new Date());

        DateFormat df2=new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();


        //获取课程初步的起始时间和终止时间
        String week = coachStudent.getWeekday();
     //   System.out.println("!!!!!!!!!!!!!!!!!!!!!" + week);
        int plusWeek = getWeekDis(d, week);
        String start = df2.format(new Date(date.getTime() + plusWeek * 24 * 60 * 60 * 1000)); //start_date
        String end = df2.format(new Date(date.getTime() + (long)(plusWeek + 70) * 24 * 60 * 60 * 1000)); //end_date

        //设置初始起始终止时间
        coachStudent.setStart_day(start);
        coachStudent.setEnd_day(end);

        boolean flag = choosenDAO.InsertMessage(coachStudent);
        //添加课程关联的同时要删除该老师的空闲时间
        if (flag) {
            IdleTime idleTime = new IdleTime();
            idleTime.setCoa_id(coachStudent.getCoa_id());
            idleTime.setWeekday(coachStudent.getWeekday());
            idleTime.setClazz(coachStudent.getClazz());

            DeleteMessageService deleteMessageService = new DeleteMessageServiceImpl();
            deleteMessageService.DeleteIdle(idleTime);
        }
        return flag;
    }

    @Override
    //增加座位信息
    public boolean AddSeat(Seat seat){
        SeatDAO seatDAO = new SeatImpl();
        String station_id = seatDAO.GetStationId(seat).get(0).getStation_id();
        seat.setStation_id(station_id);
        boolean flag = seatDAO.InsertSeat(seat);
        return flag;
    }

    @Override
    //增加教师空闲时间
    public boolean AddIdle(IdleTime idleTime) {
        IdleTimeDAO idleTimeDAO = new IdleTimeImpl();
        boolean flag = idleTimeDAO.InsertMessage(idleTime);
        return flag;
    }
    //获取星期间相差天数
    protected int getWeekDis(String weekNow, String weekTo) {
        int Dis = 0;
        Week week = new Week();
        int now;
        for (now = 0; now < 7; now++) {
            if (week.getWeekC()[now].equals(weekNow)) {
                break;
            }
        }
        now++;
        int to = Integer.parseInt(weekTo);
        if (now >= to) {
            Dis = 7 - (now - to);
        } else {
            Dis = to - now;
        }
        return Dis;
    }
}
