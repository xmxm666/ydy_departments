package com.ydy.application.shiro.provider.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.ydy.application.entity.department.DepartmentsAdmin;
import com.ydy.application.entity.department.DepartmentsSection;
import com.ydy.application.service.department.DepartmentsAdminService;
import com.ydy.application.shiro.provider.AccountProvider;
import org.apache.shiro.authc.Account;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

/**
 */
@Service("AccountProvider")
public class AccountProviderImpl implements AccountProvider {

      @Autowired
      private DepartmentsAdminService adminService;

    @Override
    public DepartmentsAdmin loadAccount(String username) {
        DepartmentsAdmin admin = adminService.selectOne(new EntityWrapper<DepartmentsAdmin>().eq("username", username));
        return admin;
    }
}
