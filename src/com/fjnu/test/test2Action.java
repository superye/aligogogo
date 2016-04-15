package com.fjnu.test;

import com.fjnu.controller.action.SuperAction;
import com.fjnu.domain.CoachCourse;
import com.fjnu.service.AddMessageService;
import com.fjnu.service.AddMessageServiceImpl;
import com.fjnu.service.DeleteMessageService;
import com.fjnu.service.DeleteMessageServiceImpl;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by spzn on 16-2-13.
 */
public class test2Action extends SuperAction implements ModelDriven<CoachCourse>{
    CoachCourse coachCourse = new CoachCourse();

    public String DeleteMessage() {
        DeleteMessageService deleteMessageService =
                new DeleteMessageServiceImpl();
        boolean flag = deleteMessageService.DeleteCoachCourse(coachCourse);
        if (flag) return "true";
        else return "false";
    }

    public String InsertMessage() {
        AddMessageService addMessageService =
                new AddMessageServiceImpl();
        boolean flag = addMessageService.AddCoachCourse(coachCourse);
        if (flag) {
           return "true";
        }
        return "false";
    }

    @Override
    public CoachCourse getModel() {
        return coachCourse;
    }
}
