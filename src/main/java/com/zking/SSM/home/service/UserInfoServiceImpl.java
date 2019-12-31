package com.zking.SSM.home.service;

import com.zking.SSM.home.mapper.UserInfoMapper;
import com.zking.SSM.home.model.UserinfoModel;
import com.zking.SSM.home.service.UserInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * create by CSQ on 2019-12-30
 */
@Service
public class UserInfoServiceImpl implements UserInfoService {

    @Resource
    private UserInfoMapper userInfoMapper;

    @Override
    public int registered(UserinfoModel user) {
        return userInfoMapper.registered(user);
    }
}
