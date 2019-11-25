package com.ydy.application.dto.department;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

import java.util.Date;

import org.hibernate.validator.constraints.NotBlank;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 *医生登录
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Data
public class DepartMentLoginDTO{
    /**
     * 用户名
     */
//	@NotBlank
    private String username;
    /**
     * 密码
     */
//	@NotBlank
    private String password;

}
