package com.fjnu.controller.action;

import com.fjnu.domain.User;
import com.fjnu.service.GetMessageService;
import com.fjnu.service.GetMessageServiceImpl;
import com.fjnu.service.LoginServiceImpl;
import com.opensymphony.xwork2.ModelDriven;

/**
 * Created by yehao on 16/1/10.
 * 与登陆相关的Action
 */
public class LoginAction extends SuperAction implements ModelDriven<User>{
    User user = new User();

    /**
     * 登陆action
     * @return
     * @throws Exception
     */
    @Override
    public String execute() throws Exception {
        LoginServiceImpl loginService = new LoginServiceImpl();
        GetMessageService getMessageService = new GetMessageServiceImpl();
        session.setAttribute("LoginPassword", user.getPassword());
        if (loginService.check(user)) {
            String Name = getMessageService.GetUserName(user.getUsername());
            session.setAttribute("LoginName", Name);
            session.setAttribute("LoginId", user.getUsername());
            session.setAttribute("IsSubmit", " ");
            session.setAttribute("Flag", "1");

            if ("1".equals(user.getIdentity())) {
                return "stu_success";
            } else if ("2".equals(user.getIdentity())) {
                return "coa_success";
            } else if ("3".equals(user.getIdentity())) {
                return "admin_success";
            }
        }
        session.setAttribute("error", "用户不存在或者密码错误！");
        return "FAIL";
    }

    @Override
    public User getModel() {
        return user;
    }
}
