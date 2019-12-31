package com.zking.SSM.home.service;

import com.zking.SSM.home.model.UserinfoModel;

/**
 * create by CSQ on 2019-12-30
 */
public interface UserInfoService {

    /**
     * 用户注册的方法
     * @param user 用户信息模型
     * @return 受影响的行数
     */
    int registered(UserinfoModel user);
}
