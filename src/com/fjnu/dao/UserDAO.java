package com.fjnu.dao;

import com.fjnu.domain.User;
import com.fjnu.domain.UserInfo;

import java.util.List;

/**
 * Created by yehao on 16/1/10.
 */
public interface UserDAO {
    public List<User> GetUser(User user);
    public List<UserInfo> GetName(UserInfo userInfo);
}
