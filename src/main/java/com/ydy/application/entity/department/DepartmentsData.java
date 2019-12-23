package com.ydy.application.entity.department;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 * <p>
 * 历史数据表
 * </p>
 *
 * @author zqx123
 * @since 2019-12-13
 */
@TableName("departments_data")
public class DepartmentsData extends Model<DepartmentsData> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;
    private String mac;
    private BigDecimal spo2;
    private BigDecimal hr;
    private BigDecimal rr;
    private BigDecimal sbp;
    private BigDecimal dbp;
    /**
     * 测量时间
     */
    @TableField("creat_time")
    private Date creatTime;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public BigDecimal getSpo2() {
        return spo2;
    }

    public void setSpo2(BigDecimal spo2) {
        this.spo2 = spo2;
    }

    public BigDecimal getHr() {
        return hr;
    }

    public void setHr(BigDecimal hr) {
        this.hr = hr;
    }

    public BigDecimal getRr() {
        return rr;
    }

    public void setRr(BigDecimal rr) {
        this.rr = rr;
    }

    public BigDecimal getSbp() {
        return sbp;
    }

    public void setSbp(BigDecimal sbp) {
        this.sbp = sbp;
    }

    public BigDecimal getDbp() {
        return dbp;
    }

    public void setDbp(BigDecimal dbp) {
        this.dbp = dbp;
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
        return "DepartmentsData{" +
        ", id=" + id +
        ", mac=" + mac +
        ", spo2=" + spo2 +
        ", hr=" + hr +
        ", rr=" + rr +
        ", sbp=" + sbp +
        ", dbp=" + dbp +
        ", creatTime=" + creatTime +
        "}";
    }
}
