package com.fjnu.controller.action;

import com.fjnu.domain.*;
import com.fjnu.service.*;
import com.opensymphony.xwork2.ModelDriven;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by spzn on 16-2-26.
 */
public class AdminAction extends SuperAction implements ModelDriven<CoachStudent>{
    CoachStudent coachStudent = new CoachStudent();
    private station_day_output sdo;
    private station_day_input sdi;

    public station_day_output getSdo() {
        return sdo;
    }

    public station_day_input getSdi() {
        return sdi;
    }

    public void setSdo(station_day_output sdo) {
        this.sdo = sdo;
    }

    public void setSdi(station_day_input sdi) {
        this.sdi = sdi;
    }

    //加载Coach与课程的对应
    public String LoadCoachCourse() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        List<CoachStudent> list = getMessageService.GetCoachCourse(coachStudent);
        request.setAttribute("List", list);
        return "LoadCoachCourse";
    }

    public String DeleteCoachCourse() {
        DeleteMessageService deleteMessageService = new DeleteMessageServiceImpl();
        CoachCourse coachCourse = new CoachCourse();
        coachCourse.setCoa_id(request.getParameter("coa_id"));
        coachCourse.setCou_id(request.getParameter("cou_id"));
        deleteMessageService.DeleteCoachCourse(coachCourse);
        return "DeleteCoachCourse";
    }

    //获取coach及couse信息
    public String GetCoachAndCourse() throws IOException {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        request.setAttribute("CoachList", getMessageService.GetCoach());
        request.setAttribute("CourseList", getMessageService.GetCourse());
        request.setAttribute("StationList", getMessageService.GetStation());
        return "GetCoachAndCourse";
    }

    //师资安排，增加Coach和Course的对应
    public String InsertCoachCourse() {
        AddMessageService addMessageService = new AddMessageServiceImpl();
        CoachCourse coachCourse = new CoachCourse();
        coachCourse.setCoa_id(coachStudent.getCoa_id());
        coachCourse.setCou_id(coachStudent.getCou_id());
        coachCourse.setPrice(coachStudent.getPrice());
        coachCourse.setStation(coachStudent.getStation());
        try {
            addMessageService.AddCoachCourse(coachCourse);
        }catch (Exception ex) {

        }
        return "InsertCoachCourse";
    }

    public String GetCoachSchedule() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        Schedule schedule = new Schedule();
        if (coachStudent.getCoa_id() != null && !coachStudent.getCoa_id().equals("")) {
            schedule = getMessageService.GetSchedule(coachStudent);
        }
        TimeTable timeTable = new TimeTable();
        request.setAttribute("name", getMessageService.GetUserName(coachStudent.getCoa_id()));
        request.setAttribute("List", schedule.getCSschedule());
        request.setAttribute("TimeList", timeTable);
        return "GetCoachSchedule";
    }

    public String GetStudentSchedule() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        Schedule schedule = new Schedule();
        if (coachStudent.getStu_id() != null && !coachStudent.getStu_id().equals("")) {
            schedule = getMessageService.GetSchedule(coachStudent);
        }
        TimeTable timeTable = new TimeTable();

        request.setAttribute("name", getMessageService.GetUserName(coachStudent.getStu_id()));
        request.setAttribute("List", schedule.getCSschedule());
        request.setAttribute("TimeList", timeTable);
        return "GetStudentSchedule";
    }

    public String GetFeedback() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        List<Feedback> list = new ArrayList<Feedback>();
        list = getMessageService.GetFeedback();
        request.setAttribute("List", list);
        return "GetFeedback";
    }

    public String GetSeatInfo() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        List<Seat> list = new ArrayList<>();
        list = getMessageService.GetSeat();
        request.setAttribute("SeatList",list);
        return "GetSeatInfo";
    }

    public String GetSeatDetail() {
        CoachStudent coachStudent = new CoachStudent();
        /**
         * 转码！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！
         */
        String str = request.getParameter("station");
        try {
         //   str = new String(str.getBytes("ISO-8859-1"),"utf-8");
        }catch (Exception e) {}
        coachStudent.setClassroom(request.getParameter("classroom"));
        coachStudent.setStation(str);
        GetMessageService getMessageService = new GetMessageServiceImpl();
        int[][] state = new int[26][7];
        state = getMessageService.GetSeatDetail(coachStudent);
        request.setAttribute("state", state);
        return "GetSeatDetail";
    }

    public String GetPALInfo() {

        return "GetPALInfo";
    }

    public String GetIncomeInfo() {

        return "GetIncomeInfo";
    }

    public String GetPayInfo() {

        return "GetPayInfo";
    }

    public void DeleteSeat() {
        Seat seat = new Seat();
        System.out.println(request.getParameter("station_name"));
        seat.setStation_name(request.getParameter("station_name"));
        seat.setClassroom(request.getParameter("classroom"));
        DeleteMessageService deleteMessageService = new DeleteMessageServiceImpl();
        deleteMessageService.DeleteSeat(seat);
        this.GetSeatInfo();
    }

    public String DeleteSeatByName() {
        Seat seat = new Seat();
        System.out.println(request.getParameter("station_name"));
        String str = request.getParameter("station_name");
        try {
           // str = new String(str.getBytes("ISO-8859-1"),"utf-8");
        } catch (Exception e) {}
        seat.setStation_name(str);
        seat.setClassroom(request.getParameter("classroom"));
        DeleteMessageService deleteMessageService = new DeleteMessageServiceImpl();
        deleteMessageService.DeleteSeatByName(seat);
        GetMessageService getMessageService = new GetMessageServiceImpl();
        List<Seat> list = new ArrayList<>();
        list = getMessageService.GetSeat();
        request.setAttribute("SeatList",list);
        return "GetSeatInfo";
    }

    public String GetNopayOrder() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        List<CoachStudent> list = new ArrayList<>();

        list = getMessageService.GetNopayOrder();
        request.setAttribute("NopayOrder", list);

        return null;
    }

    public void ChangePayment() {
        int id = Integer.parseInt(request.getParameter("id").toString());

        UpdateMessageService updateMessageService = new UpdateMessageServiceImpl();
        updateMessageService.ChangePayment(id);
    }

    public String Payment() {
        GetMessageService getMessageService = new GetMessageServiceImpl();
        List<CoachStudent> list = new ArrayList<>();
        list = getMessageService.GetNopayOrder();

        request.setAttribute("NopayOrder", list);
        return "payment";
    }

    public void DeleteOrder() {
        int id = Integer.parseInt(request.getParameter("id").toString());

        UpdateMessageService updateMessageService = new UpdateMessageServiceImpl();
        updateMessageService.DeleteOrder(id);
    }

    public String GetClassConsume() {
        System.out.println("here");
        List<CoachStudent> list = new ArrayList<>();
        GetMessageService getMessageService = new GetMessageServiceImpl();
        /*
        if (coachStudent.getStu_id() != null && !coachStudent.getStu_id().equals("")) {
            list = getMessageService.GetStudentCourse(coachStudent);
        }
        */
        list = getMessageService.GetStudentCourse(coachStudent);
        for (int i = 0; i < list.size(); i++) {
            list.get(i).setStu_name(getMessageService.GetUserName(list.get(i).getStu_id()));
            list.get(i).setCoa_name(getMessageService.GetUserName(list.get(i).getCoa_id()));
            list.get(i).setPrice(getMessageService.GetCoursePrice(list.get(i)));

            System.out.println(list.get(i).getId());
        }
        request.setAttribute("consumeList", list);
        return "GetClassConsume";
        /*
        ClassFire classfire = new ClassFire();
        GetFinanceService getFinanceService = new GetFinanceServiceImpl();
        List<ClassFire> list = new ArrayList<>();
        list = getFinanceService.GetClassConsumeInfo();
        request.setAttribute("classconsume", list);
        return "GetClassConsume";
        */
    }

    public String GetDayIncome() {
        DayIncome dayIncome = new DayIncome();
        GetFinanceService getFinanceService = new GetFinanceServiceImpl();
        List<station_day_input> list = new ArrayList<station_day_input>();
        list = getFinanceService.GetDayIncomeInfo();
        request.setAttribute("dayincome", list);
        return "GetDayIncome";
    }

    public String GetDayOutput() {
        station_day_output sdo = new station_day_output();
        GetFinanceService getFinanceService = new GetFinanceServiceImpl();
        List<station_day_output> list = new ArrayList<>();
        list = getFinanceService.GetDayOutputInfo();
        request.setAttribute("dayoutput", list);
        return "GetDayOutput";
    }

    public String GetSalary() {
        Salary salary = new Salary();
        GetFinanceService getFinanceService = new GetFinanceServiceImpl();
        List<Salary> list = new ArrayList<>();
        list = getFinanceService.GetSalaryInfo();
        request.setAttribute("salary", list);
        return "GetSalary";
    }

    public String GetCoa_Salary() {
        Coa_Salary coa_salary = new Coa_Salary();
        GetFinanceService getFinanceService = new GetFinanceServiceImpl();
        List<Coa_Salary> list = new ArrayList<>();
        list = getFinanceService.GetCoa_SalaryInfo();
        request.setAttribute("coa_salary", list);
        return "GetCoa_Salary";
    }
    public String InsertDayOutput() {
        GetFinanceService getFinanceService = new GetFinanceServiceImpl();
        getFinanceService.InsertDayOutput(sdo);
        return "InsertDayOutput";
    }

    public String InsertDayInput() {
        GetFinanceService getFinanceService = new GetFinanceServiceImpl();
        getFinanceService.InsertDayInput(sdi);
        return "InsertDayInput";
    }

    public CoachStudent getModel() { return coachStudent; }
}
