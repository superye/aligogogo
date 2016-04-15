package com.fjnu.controller.action;

import com.fjnu.domain.Seat;
import com.fjnu.service.AddMessageService;
import com.fjnu.service.AddMessageServiceImpl;
import com.fjnu.service.GetMessageService;
import com.fjnu.service.GetMessageServiceImpl;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.interceptor.Interceptor;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by yehao on 16/2/28.
 */
public class SeatAction extends SuperAction implements ModelDriven<Seat>{
    Seat seat = new Seat();

    public String GetStation() {
        List<Seat> list = new ArrayList<>();
        GetMessageService getMessageService = new GetMessageServiceImpl();
        list = getMessageService.GetStation();
        request.setAttribute("stationlist", list);
        return "AddSeat";
    }

    public String AddSeat() {
        try {
            System.out.println(seat.getStation_name());
//            seat.setStation_name(new String(seat.getStation_name().getBytes("ISO-8859-1"),"utf-8"));
        } catch (Exception e) {}
        System.out.println(seat.getStation_name());
        /*
        if ("".equals(seat.getClassroom().trim()) || "".equals(seat.getNumOfSeat().trim()))
            return "FAIL";
        */
        AddMessageService addMessageService = new AddMessageServiceImpl();
        addMessageService.AddSeat(seat);
        List<Seat> list = new ArrayList<>();
        GetMessageService getMessageService = new GetMessageServiceImpl();
        list = getMessageService.GetSeat();
        request.setAttribute("SeatList", list);
        return "GetSeatInfo";
    }
    @Override
    public Seat getModel() {
        return seat;
    }
}
