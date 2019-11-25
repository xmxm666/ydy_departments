package com.ydy.application.Enum;

import com.alibaba.fastjson.JSONObject;
import com.ydy.application.util.JsonUtil;

/**
 * 响应返回码
 * 如果是业务错误,则需要在微服务里定义错误子类型
 */
public enum JXCReturnCode {
	
	EXCLE_DETAIL_TOO_BIG("20001","导入设备数不能超过30000个"),
	GOODS_NOT_EXIST("20002","设备不存在");

	// 错误子类型标记
	public static final String API_SUB_FLAG = "subCode";
	
	private String code;
	private String msg;
	
	JXCReturnCode(String code,String msg){
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
