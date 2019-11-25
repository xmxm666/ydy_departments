package com.ydy.application.entity.department;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * <p>
 *      科室
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@TableName("departments_section")
public class DepartmentsSection extends Model<DepartmentsSection> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @NotBlank
    private String name;

    @TableField("hospital_id")
    @NotNull
    private Integer hospitalId;

    @TableField("creat_time")
    private Date creatTime;

    /**
     * 是否已删除 0 否 1 是
     */
    @TableField("is_deleted")
    private Integer isDeleted;

    public Integer getHospitalId() {
        return hospitalId;
    }

    public void setHospitalId(Integer hospitalId) {
        this.hospitalId = hospitalId;
    }

    public Integer getIsDeleted() {
        return isDeleted;
    }

    public void setIsDeleted(Integer isDeleted) {
        this.isDeleted = isDeleted;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "DepartmentsSection{" +
        ", id=" + id +
        ", name=" + name +
        ", creatTime=" + creatTime +
        "}";
    }
}
