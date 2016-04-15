package com.fjnu.dao;

import com.fjnu.domain.IdleTime;
import com.fjnu.domain.User;

import java.util.List;

/**
 * Created by spzn on 16-2-15.
 */
public interface IdleTimeDAO {
    public List<IdleTime> GetMessage(User user);
    public boolean InsertMessage(IdleTime idleTime);
    public boolean DeleteIdle(IdleTime idleTime);
}
