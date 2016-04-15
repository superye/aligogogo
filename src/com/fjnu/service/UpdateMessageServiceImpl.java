package com.fjnu.service;

import com.fjnu.dao.ChoosenDAO;
import com.fjnu.dao.ChoosenImpl;
import com.fjnu.domain.CoachStudent;

/**
 * Created by yehao on 16/4/4.
 */
public class UpdateMessageServiceImpl implements UpdateMessageService{

    @Override
    public boolean ChangePayment(int id) {
        ChoosenDAO choosenDAO = new ChoosenImpl();
        CoachStudent coachStudent = new CoachStudent();
        coachStudent.setId(id);
        choosenDAO.ChangePayment(coachStudent);
        return true;
    }

    @Override
    public boolean DeleteOrder(int id) {
        ChoosenDAO choosenDAO = new ChoosenImpl();
        CoachStudent coachStudent = new CoachStudent();
        choosenDAO.DeleteOrder(id);
        return true;
    }
}
