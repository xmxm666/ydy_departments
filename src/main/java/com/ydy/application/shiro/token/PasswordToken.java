package com.ydy.application.shiro.token;


import org.apache.shiro.authc.AuthenticationToken;

/**
 *
 */
public class PasswordToken implements AuthenticationToken{

    private static final long serialVersionUID = 1L;
    private String username;// 用户名
    private String password;// 密码

    public PasswordToken(String username, String password) throws Exception {
        this.username = username;
        this.password = password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getPassword() {
        return this.password;
    }

    @Override
    public Object getPrincipal() {
        return this.username;
    }

    @Override
    public Object getCredentials() {
        return this.password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
