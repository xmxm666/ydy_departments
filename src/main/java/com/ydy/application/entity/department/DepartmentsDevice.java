package com.ydy.application.entity.department;

import java.io.Serializable;

import com.baomidou.mybatisplus.enums.IdType;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;

import javax.validation.constraints.NotNull;
import java.io.Serializable;

/**
 * <p>
 * 设备
 * </p>
 *
 * @author rz123
 * @since 2019-08-06
 */
@TableName("departments_device")
public class DepartmentsDevice extends Model<DepartmentsDevice> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @TableField("section_id")
    private Integer sectionId;

    @NotNull(message = "设备编号不能为空")
    @TableField("device_number")
    private String deviceNumber;

    private String mac;

    @TableField("creat_time")
    private Date creatTime;

    @TableField("update_time")
    private Date updateTime;

    @TableField("last_upload_time")
    private Date lastUploadTime;

    @TableField("last_offline_upload_time")
    private Date lastOfflineUploadTime;

    @TableField("device_name")
    private String deviceName;

    /**
     * 是否已删除 0 否 1 是
     */
    @TableField("is_deleted")
    private Integer isDeleted;

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

    public Integer getSectionId() {
        return sectionId;
    }

    public void setSectionId(Integer sectionId) {
        this.sectionId = sectionId;
    }

    public String getDeviceNumber() {
        return deviceNumber;
    }

    public void setDeviceNumber(String deviceNumber) {
        this.deviceNumber = deviceNumber;
    }

    public String getMac() {
        return mac;
    }

    public void setMac(String mac) {
        this.mac = mac;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getLastUploadTime() {
        return lastUploadTime;
    }

    public void setLastUploadTime(Date lastUploadTime) {
        this.lastUploadTime = lastUploadTime;
    }

    public Date getLastOfflineUploadTime() {
        return lastOfflineUploadTime;
    }

    public void setLastOfflineUploadTime(Date lastOfflineUploadTime) {
        this.lastOfflineUploadTime = lastOfflineUploadTime;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "DepartmentsDevice{" +
        ", id=" + id +
        ", sectionId=" + sectionId +
        ", deviceNumber=" + deviceNumber +
        ", mac=" + mac +
        ", creatTime=" + creatTime +
        ", updateTime=" + updateTime +
        ", lastUploadTime=" + lastUploadTime +
        ", lastOfflineUploadTime=" + lastOfflineUploadTime +
        ", deviceName=" + deviceName +
        "}";
    }
}
