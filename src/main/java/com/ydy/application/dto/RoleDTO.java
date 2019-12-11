package com.ydy.application.dto;

import com.ydy.application.entity.role.AuthRole;

public class RoleDTO extends AuthRole {

    private Integer[] resources;

    public Integer[] getResources() {
        return resources;
    }

    public void setResources(Integer[] resources) {
        this.resources = resources;
    }
}
