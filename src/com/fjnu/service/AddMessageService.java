package com.fjnu.service;

import com.fjnu.domain.*;

import java.io.UnsupportedEncodingException;

/**
 * Created by spzn on 16-2-12.
 */
public interface AddMessageService {
    public boolean AddCoachCourse(CoachCourse coachCourse);
    public boolean AddChoosen(CoachStudent coachStudent);
    public boolean AddSeat(Seat seat);
    public boolean AddIdle(IdleTime idleTime);
    public boolean AddFeedback(Feedback feedback);
    public CoachStudent Trans(String choosen);
}
