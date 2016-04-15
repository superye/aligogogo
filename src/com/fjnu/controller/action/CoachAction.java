package com.fjnu.controller.action;

import com.fjnu.domain.*;
import com.fjnu.service.*;
import com.opensymphony.xwork2.ModelDriven;
import net.sf.json.JSONObject;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by spzn on 16-2-18.
 * 与Coach相关的Aciton
 */
public class CoachAction extends SuperAction implements ModelDriven<CoachStudent>{
    CoachStudent coachStudent = new CoachStudent();

    //获取登陆教师的课程表及时间表
    public String GetCoachCourse() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        coachStudent.setCoa_id((String)session.getAttribute("LoginId"));
        Schedule schedule = getMessageService.GetSchedule(coachStudent);
        TimeTable timeTable = new TimeTable();
        request.setAttribute("List", schedule.getCSschedule());
        request.setAttribute("TimeList", timeTable);
        return "GetCoachCourse";
    }

   //获取登陆教师的课程表，空闲表和时间表
    public String GetIdleInfo() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        coachStudent.setCoa_id((String)session.getAttribute("LoginId"));
        User user = new User();
        user.setUsername((String) session.getAttribute("LoginId"));
        Schedule schedule = getMessageService.GetSchedule(coachStudent);
        request.setAttribute("CourseList", schedule.getCSschedule());

        schedule = getMessageService.GetIdleMessage(user);
        request.setAttribute("IdleList", schedule.getITschedule());

        TimeTable timeTable = new TimeTable();
        request.setAttribute("TimeList", timeTable);

        return "IdleInfo";
    }

    //插入空闲时间
    public String InsertIdletime() {
        IdleTime idleTime = new IdleTime();
        idleTime.setCoa_id(coachStudent.getCoa_id());
        idleTime.setClazz(coachStudent.getClazz());
        idleTime.setWeekday(coachStudent.getWeekday());
        AddMessageService addMessageService = new AddMessageServiceImpl();
        boolean flag = addMessageService.AddIdle(idleTime);
        JSONObject json=new JSONObject();
        if (flag) {
            try {
                json.put("status","Addsuccess");
                byte[] jsonBytes = json.toString().getBytes("utf-8");
                response.setContentType("text/html;charset=utf-8");
                response.setContentLength(jsonBytes.length);
                System.out.println(json);
                response.getOutputStream().write(jsonBytes);
                response.getOutputStream().flush();
                response.getOutputStream().close();
            }  catch (Exception e) {
                e.printStackTrace();
            }
            return "success";
        }
        else return "false";
    }

    //删除空闲时间
    public String DeleteIdletime() {
        IdleTime idleTime = new IdleTime();
        idleTime.setCoa_id(coachStudent.getCoa_id());
        idleTime.setClazz(coachStudent.getClazz());
        idleTime.setWeekday(coachStudent.getWeekday());
        DeleteMessageService deleteMessageService =
                new DeleteMessageServiceImpl();
        boolean flag = deleteMessageService.DeleteIdle(idleTime);
        JSONObject json=new JSONObject();
        if (flag) {
            try {
                json.put("status","success");
                byte[] jsonBytes = json.toString().getBytes("utf-8");
                response.setContentType("text/html;charset=utf-8");
                response.setContentLength(jsonBytes.length);
                System.out.println(json);
                response.getOutputStream().write(jsonBytes);
                response.getOutputStream().flush();
                response.getOutputStream().close();
            }  catch (Exception e) {
                e.printStackTrace();
            }
            return "success";
        }
        else return "false";
    }

    //获取登陆教师的课程信息
    public String GetCoachCourseForFeedback() {
        String Flag = (String)session.getAttribute("Flag");
        if ("1".equals(Flag)) {
            session.setAttribute("Flag", "0");
        } else {
            session.setAttribute("IsSubmit", "");
        }
        GetMessageService getMessageService = new GetMessageServiceImpl();
        coachStudent.setCoa_id((String) session.getAttribute("LoginId"));
        List<CoachStudent> list = getMessageService.GetCoachStudent(coachStudent);
        request.setAttribute("List", list);
        return "GetCoachCourseForFeedback";
    }

    //插入反馈信息
    public String InsertFeedbackInfo() {

        AddMessageService addMessageService = new AddMessageServiceImpl();

        //从网页接受插入信息
        Feedback feedback = new Feedback();
        String Fid = (String)session.getAttribute("LoginId");
        String cou_id = request.getParameter("cou_id").trim();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = dateFormat.format(new Date()).trim();
        String IsNonarrival = request.getParameter("IsNonarrival").trim();
        String lateTime = "0";
        String IsLate = "0";
        if ("1".equals(IsNonarrival)) {
            lateTime = "0";
            IsLate = "0";
        } else {
            IsLate = request.getParameter("IsLate").trim();
            if ("0".equals(IsLate)) {
                lateTime = "0";
            } else {
                lateTime = request.getParameter("lateTime").trim();
            }
        }
        feedback.setFid(Fid);
        feedback.setCou_id(cou_id);
        feedback.setDate(date);
        feedback.setIsNonarrival(IsNonarrival);
        feedback.setIsLate(IsLate);
        feedback.setLateTime(lateTime);

        session.setAttribute("IsSubmit", "");
        if (addMessageService.AddFeedback(feedback)) {
            session.setAttribute("IsSubmit", "提交成功");
            session.setAttribute("Flag", "1");
        }

        return "InsertFeedbackInfo";
    }

    @Override
    public CoachStudent getModel() {
        return coachStudent;
    }
}
