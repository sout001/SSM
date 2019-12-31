package com.zking.SSM.home.service;

import com.zking.SSM.home.model.LogininfoModel;
import org.junit.Assert;
import org.junit.Test;

import javax.annotation.Resource;

/**
 * create by CSQ on 2019-12-30
 */
public class LoginServiceImplTest extends BaseTest {

    @Resource
    private LoginServiceImpl loginService;

    @Test
    public void addByLoginUser() {
        LogininfoModel logininfoModel = new LogininfoModel();
        logininfoModel.setUsername("test");
        logininfoModel.setPassword("123456");
        int i = loginService.addByLoginUser(logininfoModel);
        System.out.println(i);
    }

    @Test
    public void login(){
        LogininfoModel admin = loginService.login("admin");
        System.out.println(admin);
        Assert.assertNotNull(admin);
    }

}