package com.zking.SSM.home.service;

import com.zking.SSM.home.model.UserinfoModel;
import com.zking.SSM.home.service.BaseTest;
import com.zking.SSM.home.service.UserInfoServiceImpl;
import org.junit.Test;
import org.junit.runner.Request;

import javax.annotation.Resource;

/**
 * create by CSQ on 2019-12-30
 */
public class UserInfoServiceImplTest extends BaseTest {

    @Resource
    private UserInfoServiceImpl userInfoService;

    @Test
    public void registered() {
        UserinfoModel user = new UserinfoModel();
        user.setPhoneNumber("17570812981");
        user.setEmail("642829931@qq.com");
        int registered = userInfoService.registered(user);
        System.out.println(registered);
    }

    @Test
    public void test(){

    }
}