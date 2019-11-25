package com.ydy.application.entity.department;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * 病房-病床-设备-患者
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@TableName("departments_room_bed_dev_pat")
@Data
public class DepartmentsRBDP extends Model<DepartmentsRBDP> {

    private static final long serialVersionUID = 1L;

    /**
     * 病房id
     */
    @TableId(value = "rid")
    private Integer rid;
    /**
     * 病床id
     */
    @TableId(value = "bid")
    private Integer bid;
    /**
     * 设备id
     */
    private Integer did;
    /**
     * 患者id
     */
    private Integer pid;

    @Override
    protected Serializable pkVal() {
        return null;
    }

}
