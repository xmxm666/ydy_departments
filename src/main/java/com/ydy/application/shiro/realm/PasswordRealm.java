package com.ydy.application.shiro.realm;

import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.shiro.provider.AccountProvider;
import com.ydy.application.shiro.token.PasswordToken;
import com.ydy.application.util.Md5HexMethod;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

/**
 *   这里是登录认证realm
 */
public class PasswordRealm extends AuthorizingRealm {


    private AccountProvider accountProvider;

    /**
     * description 此Realm只支持PasswordToken
     * @return java.lang.Class<?>
     */
    @Override
    public Class<?> getAuthenticationTokenClass() {
        return PasswordToken.class;
    }


    /**
     * description 这里只需要认证登录，成功之后派发 json web token 授权在那里进行
     *
     * @param principalCollection 1
     * @return org.apache.shiro.authz.AuthorizationInfo
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        if (!(authenticationToken instanceof PasswordToken)) {
            return null;
        }

        if(null==authenticationToken.getPrincipal()||null==authenticationToken.getCredentials()){
            throw new UnknownAccountException();
        }
        String username = (String)authenticationToken.getPrincipal();
        DepartmentsAdmin account = accountProvider.loadAccount(username);
        if (account != null) {
            // 对密码进行MD5加密
            ((PasswordToken) authenticationToken).setPassword(Md5HexMethod.MD5Encode(((PasswordToken) authenticationToken).getPassword()));
            return new SimpleAuthenticationInfo(username,account.getPassword(),getName());
        } else {
            return new SimpleAuthenticationInfo(username,"",getName());
        }

    }

    public void setAccountProvider(AccountProvider accountProvider) {
        this.accountProvider = accountProvider;
    }
}
