package com.fjnu.controller.action;

import com.fjnu.domain.CoachStudent;
import com.fjnu.domain.Schedule;
import com.fjnu.domain.TimeTable;
import com.fjnu.domain.User;
import com.fjnu.service.AddMessageService;
import com.fjnu.service.AddMessageServiceImpl;
import com.fjnu.service.GetMessageService;
import com.fjnu.service.GetMessageServiceImpl;
import com.opensymphony.xwork2.ModelDriven;

import java.util.List;

/**
 * Created by spzn on 16-2-24.
 * 与学生相关的Action
 */
public class StudentAction extends SuperAction implements ModelDriven<CoachStudent>{
    CoachStudent coachStudent = new CoachStudent();

    //获取学生课程
    public String GetStudentCourse() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        coachStudent.setStu_id((String)session.getAttribute("LoginId"));
        Schedule schedule = getMessageService.GetSchedule(coachStudent);
        TimeTable timeTable = new TimeTable();
        request.setAttribute("List", schedule.getCSschedule());
        request.setAttribute("TimeList", timeTable);
        return "GetStudentCourse";
    }

    //加载可购买课程
    public String LoadCoachCourse() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        List<CoachStudent> list = getMessageService.GetCoachCourse(coachStudent);
        request.setAttribute("List", list);
        return "LoadCoachCourse";
    }

    //加载选定教师的空闲时间情况
    public String LoadIdleInfo() {
        //获取购买页面传过来的选定教师及课程id,课程类型
        String coa_id = request.getParameter("coa_id");
        String cou_id = request.getParameter("cou_id");
        String type = request.getParameter("type");

        //获取该教师的空闲时间情况
        GetMessageService getMessageService = new GetMessageServiceImpl();
        User user = new User();
        user.setUsername(coa_id);

        Schedule schedule = getMessageService.GetSchedule(coachStudent);
        schedule = getMessageService.GetIdleMessage(user);

        //线上线下课程有区别
        TimeTable timeTable = new TimeTable();
        if ("Online".equals(type)) {
            //线上半小时一段
            request.setAttribute("TimeList", timeTable.getTime());
            request.setAttribute("NumOfClass", 25);
            request.setAttribute("IdleList", schedule.getITschedule());
        } else {
            //线下一小时一段
            Schedule schedule1 = new Schedule();
            schedule1.Clear();
            for (int i = 1; i < 7; i++) {
                for (int j = 1; j < 26; j += 2) {
                    if (schedule.getITschedule()[i][j] != null && schedule.getITschedule()[i][j + 1] != null) {
                        schedule1.getITschedule()[i][(j + 1) / 2] = schedule.getITschedule()[i][j];
                    }
                }
            }
            request.setAttribute("IdleList", schedule1.getITschedule());
            request.setAttribute("TimeList", timeTable.getTime2());
            request.setAttribute("NumOfClass", 12);
        }

        request.setAttribute("coa_id", coa_id);
        request.setAttribute("cou_id", cou_id);
        request.setAttribute("type", type);
        return "LoadIdleInfo";
    }

   //选定并购买课程
    public String  ConfirmPurchase() {
        String Choosen = request.getParameter("choosen");
        AddMessageService addMessageService = new AddMessageServiceImpl();
        CoachStudent coachStudent1 = new CoachStudent();
        coachStudent1 = addMessageService.Trans(Choosen);
        coachStudent1.setStu_id((String)session.getAttribute("LoginId"));
        if ("Online".equals(coachStudent1.getType())) {
            addMessageService.AddChoosen(coachStudent1);
        } else {
            int clazz = Integer.parseInt(coachStudent1.getClazz());
            coachStudent1.setClazz(String.valueOf(clazz * 2));
            addMessageService.AddChoosen(coachStudent1);
            coachStudent1.setClazz(String.valueOf((clazz * 2) - 1));
            addMessageService.AddChoosen(coachStudent1);
        }
        return "ConfirmPurchase";
    }

    @Override
    public CoachStudent getModel() {
       return coachStudent;
    }
}
