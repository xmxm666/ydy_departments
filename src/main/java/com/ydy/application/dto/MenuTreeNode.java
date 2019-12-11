package com.ydy.application.dto;

import com.ydy.application.entity.role.AuthResource;

import java.util.ArrayList;
import java.util.List;

/**
 *
 */
public class MenuTreeNode extends AuthResource {

    private List<AuthResource> children = new ArrayList<>();

    public void addChilren(AuthResource node) {
        this.children.add(node);
    }

    public List<AuthResource> getChildren() {
        return children;
    }

    public void setChildren(List<AuthResource> children) {
        this.children = children;
    }
}
