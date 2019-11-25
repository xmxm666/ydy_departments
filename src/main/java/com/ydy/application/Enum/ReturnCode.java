package com.ydy.application.Enum;

import com.alibaba.fastjson.JSONObject;
import com.ydy.application.util.JsonUtil;

/**
 * 响应返回码
 * 如果是业务错误,则需要在微服务里定义错误子类型
 */
public enum ReturnCode {
	
	SUCCESS("1000","接口调用成功"),

	LOGIN_FAIL("10001","用户名或密码错误"),
	ERROR_PASSWORD("10002","密码错误"),

	SERVICE_UNAVAILABLE("2000","服务不可用"),
	NO_TOKEN("2001","没有令牌信息,请重新登录"),
	TOKEN_INVALID("2002","令牌无效或已过期"),
	PARAM_INVALID("3000","参数不全或参数非法"),
	RESOURCE_NOT_FOUND("3001","资源没找到或不存在"),
	RESOURCE_EXIST("3002","资源已存在"),
	READ_FILE_FAIL("3003","文件读取失败"),

	SAVE_FAIL("3004","保存失败"),
	SAVE_FAIL_ROLE("30041","保存失败：请选择角色！"),
	SAVE_FAIL_SECTION("30042","保存失败：请选择科室！"),
	SAVE_FAIL_ROOM("30043","保存失败：请选择病房！"),
	SAVE_FAIL_BED("30044","保存失败：请选择病床！"),
	DELETE_FAIL("3005","删除失败"),
	DELETE_FAIL_PATIENT("30051","删除失败：该病床还有患者！"),
	UPDATE_FAIL("3007","更新失败"),

	NOT_ALLOWED_COMPANY("3006","对企业权限不够，操作被不允许"),
	NOT_COMPANY_EXTIS("3008","指定访问的企业code信息不存在，拒绝访问"),
	NOT_COMPANY_PARAM_INVALID("3009","没有指定访问的企业code，拒绝访问"),
	NOT_ALLOWED_SITE("3010","对站点权限不够，操作被不允许"),
	NOT_SITE_EXTIS("3011","请求指定企业code信息不存在"),
	COMPANY_NOT_LOGIN("3012","您已切换了访问的企业，请重新登陆"),
	NOT_SITE_CODE("3013","没有指定访问的站点code，拒绝访问"),
	NOT_SITE_INFO_CODE("3014","指定的站点code信息不存在，拒绝访问"),
	NOT_SITE_ACCESS("3015","没有站点访问权限，拒绝访问"),
	NOT_ROLE_OPERATION("3016","没有角色操作权限，拒绝访问"),
	BIZ_FAIL("4000","业务处理失败"),
	ACCOUNT_CLOSE("5000","账号未开通或者被锁定"),
	ACCOUNT_INVALID("5001","账号已经失效");

	// 错误子类型标记
	public static final String API_SUB_FLAG = "subCode";
	
	private String code;
	private String msg;
	
	ReturnCode(String code,String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public String getCode() {
		return code;
	}

	public String getMsg() {
		return msg;
	}


	public String toJson() {
		return JsonUtil.object2Json(this);
	}

	/**
	 * Returns the name of this enum constant, as contained in the
	 * declaration.  This method may be overridden, though it typically
	 * isn't necessary or desirable.  An enum type should override this
	 * method when a more "programmer-friendly" string form exists.
	 *
	 * @return the name of this enum constant
	 */
	@Override
	public String toString() {
		JSONObject object = new JSONObject();
		object.put("code",code);
		object.put("msg",msg);
		return object.toString();
	}
}
