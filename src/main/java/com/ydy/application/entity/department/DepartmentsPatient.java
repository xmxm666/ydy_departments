package com.ydy.application.entity.department;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 子用户表  患者
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@Data
@TableName("departments_patient")
public class DepartmentsPatient extends Model<DepartmentsPatient> {

    private static final long serialVersionUID = 1L;

    /**
     * 患者ID
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    /**
     * 科室ID
     */
    @TableField("section_id")
    private Integer sectionId;
    /**
     * 病历号
     */
    @NotBlank(message = "病历号不能为空")
    private String caseno;
    /**
     * 姓名
     */
    @NotBlank(message = "姓名不能为空")
    private String name;
    /**
     * 性别：1男，2女
     */
    private Integer sex;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 添加时间
     */
    @TableField("creat_time")
    private Date creatTime;

    /**
     * 主治医生
     */
    private String doctor;

    /**
     * 0：不是历史用户，1：历史用户
     */
    private Integer history;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }
}
