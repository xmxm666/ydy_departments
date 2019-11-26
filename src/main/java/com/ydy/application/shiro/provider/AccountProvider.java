package com.ydy.application.shiro.provider;

import com.ydy.application.entity.department.DepartmentsAdmin;
import org.apache.shiro.authc.Account;

/**
 *    数据库用户密码账户提供
 */
public interface AccountProvider {

    /**
     * description 数据库用户密码账户提供
     *
     * @param username 1
     * @return DepartmentsAdmin
     */
    DepartmentsAdmin loadAccount(String username);

}
