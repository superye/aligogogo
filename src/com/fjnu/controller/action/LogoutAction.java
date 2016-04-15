package com.fjnu.controller.action;

import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Created by spzn on 16-2-19.
 * 注销用户的Action
 */
public class LogoutAction extends SuperAction{
    @Override
    public String execute() throws Exception {
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session1 = request.getSession();
        session1.invalidate();
        return "Logout";
    }
}
