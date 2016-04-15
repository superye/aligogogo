package com.fjnu.service;

import com.fjnu.domain.*;

/**
 * Created by yehao on 16/2/12.
 */
public  interface DeleteMessageService {
    public boolean DeleteSeat(Seat seat);
    public boolean DeleteSeatByName(Seat seat);
    public boolean DeleteIdle(IdleTime idleTime);
    public boolean DeleteCoachCourse(CoachCourse coachCourse);
    public boolean DeleteChoosen(CoachStudent coachStudent);

}
