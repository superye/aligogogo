package com.fjnu.service;

import com.fjnu.domain.User;

/**
 * Created by yehao on 16/1/10.
 */

/**
 * 处理登陆相关的服务
 */
public interface LoginService {
    public boolean check(User user) throws Exception;
}
