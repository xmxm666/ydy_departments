package com.ydy.application.shiro.realm;


import com.ydy.application.shiro.matcher.JwtMatcher;
import com.ydy.application.shiro.matcher.PasswordMatcher;
import com.ydy.application.shiro.provider.AccountProvider;
import com.ydy.application.shiro.token.JwtToken;
import com.ydy.application.shiro.token.PasswordToken;
import org.apache.shiro.realm.Realm;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/**
 *   realm管理器
 */
@Component
public class RealmManager {

    private PasswordMatcher passwordMatcher;
    private JwtMatcher jwtMatcher;
    private AccountProvider accountProvider;

    @Autowired
    public RealmManager(AccountProvider accountProvider,PasswordMatcher passwordMatcher,JwtMatcher jwtMatcher) {
        this.accountProvider = accountProvider;
        this.passwordMatcher = passwordMatcher;
        this.jwtMatcher = jwtMatcher;
    }

    public List<Realm> initGetRealm() {
        List<Realm> realmList = new LinkedList<>();
        // ----- password
        PasswordRealm passwordRealm = new PasswordRealm();
        passwordRealm.setAccountProvider(accountProvider);
        passwordRealm.setCredentialsMatcher(passwordMatcher);
        passwordRealm.setAuthenticationTokenClass(PasswordToken.class);
        realmList.add(passwordRealm);
        // ----- jwt
        JwtRealm jwtRealm = new JwtRealm();
        jwtRealm.setCredentialsMatcher(jwtMatcher);
        jwtRealm.setAuthenticationTokenClass(JwtToken.class);
        realmList.add(jwtRealm);
        return Collections.unmodifiableList(realmList);
    }
}
