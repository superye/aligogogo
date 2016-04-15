package com.fjnu.dao;

import com.fjnu.domain.Choosen;
import com.fjnu.domain.CoachStudent;
import com.fjnu.domain.User;

import java.util.List;

/**
 * Created by yehao on 16/1/10.
 */
public interface ChoosenDAO {
    public List<Choosen> GetChoosen(User user);
    public List<CoachStudent> GetUserChoosen(CoachStudent coachStudent);
    public List<Integer> GetClassroomInfo(CoachStudent coachStudent);
    public boolean InsertMessage(CoachStudent coachStudent);
    public boolean DeleteChoosen(CoachStudent coachStudent);
    public List<CoachStudent> GetAllChoosen(CoachStudent coachStudent);
    public boolean ChangePayment(CoachStudent coachStudent);
    public List<CoachStudent> GetNopayOrder();

    public boolean DeleteOrder(int id);
}
