package com.fjnu.test;

import com.fjnu.controller.action.SuperAction;
import com.fjnu.domain.CoachStudent;
import com.fjnu.service.AddMessageService;
import com.fjnu.service.AddMessageServiceImpl;
import com.fjnu.service.DeleteMessageService;
import com.fjnu.service.DeleteMessageServiceImpl;
import com.opensymphony.xwork2.ModelDriven;

import java.io.UnsupportedEncodingException;

/**
 * Created by spzn on 16-2-14.
 */
public class test5Action extends SuperAction implements ModelDriven<CoachStudent> {
    CoachStudent coachStudent = new CoachStudent();

    public String DeleteMessage() {
        DeleteMessageService deleteMessageService =
                new DeleteMessageServiceImpl();
        boolean flag = deleteMessageService.DeleteChoosen(coachStudent);
        if (flag) return "true";
        return "false";
    }

    public String InsertMessage() throws UnsupportedEncodingException {
        AddMessageService addMessageService =
                new AddMessageServiceImpl();
        boolean flag = addMessageService.AddChoosen(coachStudent);
        if (flag) {
            return "true";
        }
        return "false";
    }

    @Override
    public CoachStudent getModel() {
        return coachStudent;
    }
}
