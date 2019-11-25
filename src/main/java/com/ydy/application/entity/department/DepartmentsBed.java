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
 * 病床
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@TableName("departments_bed")
@Data
public class DepartmentsBed extends Model<DepartmentsBed> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 科室id
     */
    @TableField("section_id")
    private Integer sectionId;
    /**
     * 床位
     */
    @NotBlank
    @TableField("bed_name")
    private String bedName;
    /**
     * 0：正常，1：加床
     */
    private Integer type;
    
    /**
     * 病床添加时间
     */
    @TableField("creat_time")
    private Date creatTime;
    

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "DepartmentsBed{" +
        ", id=" + id +
        ", sectionId=" + sectionId +
        ", bedName=" + bedName +
        ", type=" + type +
        ", creatTime=" + creatTime +
        "}";
    }
}
