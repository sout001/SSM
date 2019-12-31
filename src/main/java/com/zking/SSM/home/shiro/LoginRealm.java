package com.zking.SSM.home.shiro;

import com.zking.SSM.home.model.LogininfoModel;
import com.zking.SSM.home.service.LoginServiceImpl;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.util.ObjectUtils;

import javax.annotation.Resource;

/**
 * create by CSQ on 2019-12-15
 */
public class LoginRealm extends AuthorizingRealm  {

    @Resource
    private LoginServiceImpl loginService;

    /**
     * 授权
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
//        //获取用户名
//        String userName = principals.getPrimaryPrincipal().toString();
//        //生产授权信息
//        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
//        //添加角色信息
//        authorizationInfo.addRoles(loginService.getRolesByUserName(userName));
//        //设置该角色的权限
//        authorizationInfo.setStringPermissions(loginService.getPermissionByuserName(userName));
        return null;
    }


    /**
     * 认证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        
        //获取当前用户名
        String userName = token.getPrincipal().toString();

        LogininfoModel user = loginService.login(userName);

        if(ObjectUtils.isEmpty(user)){
            throw new UnknownAccountException();
        }
        System.out.println(this.getName());
        SimpleAuthenticationInfo authenticationInfo = new SimpleAuthenticationInfo(
                user.getUsername(),
                user.getPassword(),
                ByteSource.Util.bytes(user.getSalt()),
               this.getName()
        );
        return authenticationInfo;
    }
}
