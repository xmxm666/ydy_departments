package com.ydy.application.shiro.token;

import org.apache.shiro.authc.AuthenticationToken;

/**
 *   JWT token
 */
public class JwtToken implements AuthenticationToken{

    private static final long serialVersionUID = 1L;

    /**
     * 用户的标识
     */
    private String userName;
    private String jwt;

    public JwtToken(String userName, String jwt) {
        this.userName = userName;
        this.jwt = jwt;
    }

    @Override
    public Object getPrincipal() {
        return this.userName;
    }

    @Override
    public Object getCredentials() {
        return this.jwt;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getJwt() {
        return jwt;
    }

    public void setJwt(String jwt) {
        this.jwt = jwt;
    }
}
