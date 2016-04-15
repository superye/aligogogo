package com.fjnu.test;

import com.fjnu.controller.action.SuperAction;
import com.fjnu.domain.Seat;
import com.fjnu.service.AddMessageService;
import com.fjnu.service.AddMessageServiceImpl;
import com.fjnu.service.DeleteMessageService;
import com.fjnu.service.DeleteMessageServiceImpl;
import com.opensymphony.xwork2.ModelDriven;

import java.io.UnsupportedEncodingException;

/**
 * Created by spzn on 16-2-13.
 */
public class test3Action extends SuperAction implements ModelDriven<Seat>{
    Seat seat = new Seat();

    public String DeleteMessage() {
        DeleteMessageService deleteMessageService =
                new DeleteMessageServiceImpl();
        boolean flag = deleteMessageService.DeleteSeat(seat);
        if (flag) return "true";
        else return "false";
    }

    public String InsertMessage() throws UnsupportedEncodingException {
        AddMessageService addMessageService =
                new AddMessageServiceImpl();
        boolean flag = addMessageService.AddSeat(seat);
        if (flag) {
            return "true";
        }
        return "false";
    }

    @Override
    public Seat getModel() {
        return seat;
    }
}
