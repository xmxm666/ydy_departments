package com.ydy.application.entity.role;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

/**
 *   资源
 */
@TableName("auth_resource")
public class AuthResource extends Model<AuthResource> {

    @TableId(value = "ID", type = IdType.AUTO)
    private Integer id;

    @TableField("CODE")
    private Integer code;

    @TableField("NAME")
    @NotBlank(message = "资源名称不能为空")
    private String name;

    @TableField("PARENT_ID")
    private Integer parentId;

    @TableField("URI")
    private String uri;

    @NotNull(message = "资源类型不能为空")
    @TableField("TYPE")
    private Short type;

    @TableField("METHOD")
    private String method;

    @TableField("ICON")
    private String icon;

    //前端路由
    @TableField("ROUTER")
    private String router;

    @TableField("STATUS")
    private Short status;

    @TableField("CREATE_TIME")
    private Date createTime;

    @TableField("UPDATE_TIME")
    private Date updateTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getUri() {
        return uri;
    }

    public void setUri(String uri) {
        this.uri = uri == null ? null : uri.trim();
    }

    public Short getType() {
        return type;
    }

    public void setType(Short type) {
        this.type = type;
    }

    public String getMethod() {
        return method;
    }

    public void setMethod(String method) {
        this.method = method == null ? null : method.trim();
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon == null ? null : icon.trim();
    }

    public Short getStatus() {
        return status;
    }

    public void setStatus(Short status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getRouter() {
        return router;
    }

    public void setRouter(String router) {
        this.router = router;
    }

    @Override
    protected Serializable pkVal() {
        return null;
    }
}