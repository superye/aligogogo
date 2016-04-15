package com.fjnu.test;

import com.fjnu.controller.action.SuperAction;
import com.fjnu.domain.IdleTime;
import com.fjnu.service.AddMessageService;
import com.fjnu.service.AddMessageServiceImpl;
import com.fjnu.service.DeleteMessageService;
import com.fjnu.service.DeleteMessageServiceImpl;
import com.opensymphony.xwork2.ModelDriven;

import java.io.UnsupportedEncodingException;

/**
 * Created by spzn on 16-2-13.
 */
public class test4Action extends SuperAction implements ModelDriven<IdleTime>{
    IdleTime idleTime = new IdleTime();

    public String DeleteMessage() {
        DeleteMessageService deleteMessageService =
                new DeleteMessageServiceImpl();
        boolean flag = deleteMessageService.DeleteIdle(idleTime);
        if (flag) return "true";
        else return "false";
    }

    public String InsertMessage() throws UnsupportedEncodingException {
        AddMessageService addMessageService =
                new AddMessageServiceImpl();
        boolean flag = addMessageService.AddIdle(idleTime);
        if (flag) {
            return "true";
        }
        return "false";
    }

    @Override
    public IdleTime getModel() {
        return idleTime;
    }
}
