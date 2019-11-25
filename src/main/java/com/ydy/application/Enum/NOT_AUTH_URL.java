package com.ydy.application.Enum;

/**
 * 用户状态枚举
 */
public enum NOT_AUTH_URL {


    URL_0("/departmentsAdmin/login", "APP登录URL") ,
    URL_1("swagger", "swagger页面"),
    URL_2("/v2/api-docs", "swagger页面");


    // 码
    private String code;

    // 名称
    private String message;

    //序号  用于区分新加的和以前的，没其他作用
    private Integer sortId;

    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    NOT_AUTH_URL(String code, String message) {
        this.code = code;
        this.message = message;
    }

    private NOT_AUTH_URL() {
    }

    NOT_AUTH_URL(String code, String message, Integer sortId) {
        this.code = code;
        this.message = message;
        this.sortId = sortId;
    }

    /**
     * 判断errorCode是否存在
     *
     * @param code
     * @return
     */
    public static Boolean codeIsExits(String code) {
        for (NOT_AUTH_URL type : NOT_AUTH_URL.values()) {
            if (type.getCode().equals(code)) {
                return true;
            }
        }
        return false;
    }
    
    /**
               * 判断url是否包含了枚举的code
     *
     * @param code
     * @return
     */
    public static Boolean isUrlCotainsAnyCode(String url) {
        for (NOT_AUTH_URL type : NOT_AUTH_URL.values()) {
            if (url.contains(type.getCode())) {
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
        for (NOT_AUTH_URL type : NOT_AUTH_URL.values()) {
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
