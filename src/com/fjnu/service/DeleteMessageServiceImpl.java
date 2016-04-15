package com.fjnu.service;

import com.fjnu.dao.*;
import com.fjnu.domain.*;

/**
 * Created by yehao on 16/2/12.
 */
public class DeleteMessageServiceImpl implements DeleteMessageService{
    @Override
    public boolean DeleteSeat(Seat seat) {
        SeatDAO seatDao = new SeatImpl();
        return seatDao.DeleteSeat(seat);
    }

    @Override
    public boolean DeleteSeatByName(Seat seat) {
        SeatDAO seatDao = new SeatImpl();
        return seatDao.DeleteSeatByName(seat);
    }

    @Override
    public boolean DeleteIdle(IdleTime idleTime) {
        IdleTimeDAO idleTimeDAO = new IdleTimeImpl();
        return idleTimeDAO.DeleteIdle(idleTime);
    }

    @Override
    public boolean DeleteCoachCourse(CoachCourse coachCourse) {
        CoachCourseDAO coachCourseDAO = new CoachCourseImpl();
        return coachCourseDAO.DeleteCoachCourse(coachCourse);
    }

    @Override
    public boolean DeleteChoosen(CoachStudent coachStudent) {
        ChoosenDAO choosenDAO = new ChoosenImpl();
        return choosenDAO.DeleteChoosen(coachStudent);
    }


}
