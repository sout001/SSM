package com.zking.SSM.home.mapper;

import com.zking.SSM.home.model.LogininfoModel;
import org.apache.ibatis.annotations.Param;

/**
 * create by CSQ on 2019-12-30
 */
public interface LoginMapper {

    /**
     * 添加用户账号的方法
     * @param login
     * @return
     */
    int addByLoginUser(LogininfoModel login);

    /**
     * 用户登录的方法
     * @param name
     * @return
     */
    LogininfoModel login(@Param("name") String name);

}
