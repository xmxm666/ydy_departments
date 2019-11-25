package com.ydy.application.Enum;

/**
 * 进销存出入库类型枚举
 */
public enum JAX_WAREHOUSE_TYPE {


	OUT(0, "出库") ,
	IN(1, "入库");


    // 码
    private Integer code;

    // 名称
    private String message;


    JAX_WAREHOUSE_TYPE(Integer code, String message) {
        this.code = code;
        this.message = message;
    }

    private JAX_WAREHOUSE_TYPE() {
    }


    /**
     * 判断Code是否存在
     *
     * @param code
     * @return
     */
    public static Boolean codeIsExits(Integer code) {
        for (JAX_WAREHOUSE_TYPE type : JAX_WAREHOUSE_TYPE.values()) {
            if (type.getCode().intValue() == code.intValue()) {
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
    public static String getNameByCode(Integer code) {
        for (JAX_WAREHOUSE_TYPE type : JAX_WAREHOUSE_TYPE.values()) {
            if (type.getCode().intValue() == code.intValue()) {
                return type.getMessage();
            }
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

}
