package com.ydy.application.entity.department;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

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
 * 医生表
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@TableName("departments_admin")
@Data
public class DepartmentsAdmin extends Model<DepartmentsAdmin> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 用户名
     */
    @NotBlank(message = "用户名不能为空")
    private String username;
    /**
     * 密码
     */
    @NotBlank(message = "密码不能为空")
    private String password;
    
    /**
     * 科室id
     */
    @TableField("section_id")
    private Integer sectionId;

    @TableField("creat_time")
    private Date creatTime;

    /**
     * 角色   0-管理员， 1-医生
     */
    private Integer role;
    
	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
