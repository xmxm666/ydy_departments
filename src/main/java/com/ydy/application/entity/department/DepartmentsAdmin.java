package com.ydy.application.entity.department;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Date;

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
    private String password;
    
    /**
     * 科室id
     */
    @NotNull(message = "科室不能为空")
    @TableField("section_id")
    private Integer sectionId;

    @TableField("creat_time")
    private Date creatTime;

    /**
     * 是否已删除 0 否 1 是
     */
    @TableField("is_deleted")
    private Integer isDeleted;
    
	@Override
	protected Serializable pkVal() {
		return this.id;
	}
}
