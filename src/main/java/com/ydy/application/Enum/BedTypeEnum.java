package com.ydy.application.Enum;

import com.alibaba.fastjson.JSONObject;
import com.ydy.application.util.JsonUtil;

/**
 * 病床类型
 */
public enum BedTypeEnum {
	
	NORMAL(0,"正常床位"),
	ADD(1,"加床床位");
	
	private Integer code;
	private String msg;
	
	BedTypeEnum(Integer code,String msg){
		this.code = code;
		this.msg = msg;
	}
	
	public Integer getCode() {
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
