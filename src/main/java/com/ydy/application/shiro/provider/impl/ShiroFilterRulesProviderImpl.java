package com.ydy.application.shiro.provider.impl;

import com.ydy.application.mapper.role.AuthResourceMapper;
import com.ydy.application.shiro.provider.ShiroFilterRulesProvider;
import com.ydy.application.shiro.rule.RolePermRule;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 */
@Service("ShiroFilterRulesProvider")
public class ShiroFilterRulesProviderImpl implements ShiroFilterRulesProvider {

    @Resource
    private AuthResourceMapper authResourceMapper;

    @Override
    public List<RolePermRule> loadRolePermRules() {

        return authResourceMapper.selectRoleRules();
    }

}
