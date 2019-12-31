package com.zking.SSM.home.service;

import com.zking.SSM.home.mapper.LoginMapper;
import com.zking.SSM.home.model.LogininfoModel;
import com.zking.SSM.util.PasswordHelper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * create by CSQ on 2019-12-30
 */
@Service
public class LoginServiceImpl implements LoginService{

    @Resource
    private LoginMapper loginMapper;

    @Override
    public int addByLoginUser(LogininfoModel login) {
        if(login!=null&&!"".equals(login)){
            String salt = PasswordHelper.createSalt();
            String credentials = PasswordHelper.createCredentials(login.getPassword(), salt);
            login.setSalt(salt);
            login.setPassword(credentials);
        }
        return loginMapper.addByLoginUser(login);
    }

    @Override
    public LogininfoModel login(String name) {
        return loginMapper.login(name);
    }
}
