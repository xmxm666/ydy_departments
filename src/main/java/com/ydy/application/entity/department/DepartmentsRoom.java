package com.ydy.application.entity.department;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;

import lombok.Data;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * <p>
 *  病房
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@TableName("departments_room")
@Data
public class DepartmentsRoom extends Model<DepartmentsRoom> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 科室id
     */
    @TableField("section_id")
    private Integer sectionId;

    @NotBlank
    @TableField("room_name")
    private String roomName;
    
    /**
     * 是否病房已删除 0 否 1 是
     */
    @TableField("is_deleted")
    private Integer isDeleted;
    
    @TableField("creat_time")
    private Date creatTime;
    
	@Override
	protected Serializable pkVal() {
		 return this.id;
	}

}
