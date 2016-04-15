package com.fjnu.service;

import com.fjnu.dao.UserImpl;
import com.fjnu.domain.User;
import com.fjnu.utils.Md5Utils;
import com.fjnu.utils.TimeSet;
import sun.misc.BASE64Encoder;
import sun.security.provider.MD5;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by yehao on 16/1/10.
 */
public class LoginServiceImpl implements LoginService {

    @Override
    public boolean check(User user) throws Exception{
        /**
         * 获取user列表,判空
         */
        String str = user.getPassword();
        Md5Utils md5Utils = new Md5Utils();
        String newstr = md5Utils.encryption(str);
        user.setPassword(newstr);
        System.out.println(str);
        System.out.println(newstr);
        UserImpl userimpl = new UserImpl();
        List<User> list = new ArrayList<User>();
        list = userimpl.GetUser(user);
        if (list.size() == 0) {
            return false;
        } else {
            return true;
        }
    }
}
