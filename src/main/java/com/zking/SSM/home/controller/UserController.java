package com.zking.SSM.home.controller;

import com.zking.SSM.home.model.LogininfoModel;
import com.zking.SSM.home.service.LoginServiceImpl;
import com.zking.SSM.home.service.UserInfoServiceImpl;
import com.zking.SSM.home.model.UserinfoModel;
import com.zking.SSM.util.DataProtocol;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

/**
 * create by CSQ on 2019-12-30
 */
@Controller
public class UserController {

    @Resource
    private UserInfoServiceImpl userInfoService;

    @Resource
    private LoginServiceImpl loginService;

    @RequestMapping(value = "/regUser",method = RequestMethod.POST)
    public String regUser(UserinfoModel user, Model model){

        String req = null;
        int n = userInfoService.registered(user);
        if(n>0){
            LogininfoModel login = new LogininfoModel();
            login.setUsername("user_"+System.currentTimeMillis());
            login.setPassword(user.getPassWord());
            int i = loginService.addByLoginUser(login);
            if(i>0){
                req = "login";
            }
        } else {
            req = "reg";
        }

        return req;
    }

    /**
     * 通过用户登录的方法
     * @param logininfoModel
     * @return
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String login(LogininfoModel logininfoModel,Model model){

        String req = null;
        LogininfoModel userByUserName = loginService.login(logininfoModel.getUsername());
            if(userByUserName.getState()==0&&userByUserName.getState()!=null){
                Subject subject = SecurityUtils.getSubject();
                UsernamePasswordToken token = new UsernamePasswordToken(logininfoModel.getUsername(),logininfoModel.getPassword());
                try {
                  req = "index";
                } catch (AuthenticationException e) {
                    req = "login";
                }
            } else {
                req = "login";
            }

        return req;
    }

}
