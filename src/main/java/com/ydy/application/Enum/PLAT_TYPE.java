package com.ydy.application.Enum;


/**
 * 平台类型枚举
 */
public enum PLAT_TYPE {
    DEPARTMENT_ADMIN("0", "医生端"),
    PLATTPE_SAAS("1", "手机端"),
    PLATTPE_PLAT("2", "运营平台管理端"),
    JXC("3", "进销存端");


    // 码
    private String code;

    // 名称
    private String message;

    PLAT_TYPE(String code, String message) {
        this.code = code;
        this.message = message;
    }

    private PLAT_TYPE() {
    }

    /**
     * 判断errorCode是否存在
     *
     * @param code
     * @return
     */
    public static Boolean codeIsExits(String code) {
        for (PLAT_TYPE type : PLAT_TYPE.values()) {
            if (type.getCode().equals(code)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 根据errorCode获取名称
     *
     * @param code
     * @return
     */
    public static String getNameByCode(String code) {
        for (PLAT_TYPE type : PLAT_TYPE.values()) {
            if (type.getCode().equals(code)) {
                return type.getMessage();
            }
        }
        return null;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }


}
