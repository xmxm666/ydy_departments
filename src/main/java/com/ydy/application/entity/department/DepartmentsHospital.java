package com.ydy.application.entity.department;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 医院表
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@TableName("departments_hospital")
@Data
public class DepartmentsHospital extends Model<DepartmentsHospital> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 名称
     */
    @NotBlank(message = "医院名称不能为空")
    private String name;
    
	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
