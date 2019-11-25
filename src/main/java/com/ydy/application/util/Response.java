package com.ydy.application.util;

import com.ydy.application.Enum.ReturnCode;

import lombok.Data;

@Data
public class Response {
	
	private String code;
	private String message;
	private Object data;
	private Object extendOne;
	private Object extendTwo;
	private Object extendThree;
	
	public Response() {
		super();
	}

	public Response(String code, String message, Object data) {
		super();
		this.code = code;
		this.message = message;
		this.data = data;
	}
	
	public Response(String code, String message, Object data, Object extendOne, Object extendTwo, Object extendThree) {
		super();
		this.code = code;
		this.message = message;
		this.data = data;
		this.extendOne = extendOne;
		this.extendTwo = extendTwo;
		this.extendThree = extendThree;
	}
	
	public static Response ok(Object data){
		Response res = new Response();
		res.setCode(ReturnCode.SUCCESS.getCode());
		res.setData(data);
		res.setMessage(ReturnCode.SUCCESS.getMsg());
		return res;
	}
	
	public static Response ok(Object data, Object extendOne, Object extendTwo, Object extendThree){
		Response res = new Response();
		res.setCode(ReturnCode.SUCCESS.getCode());
		res.setData(data);
		res.setMessage(ReturnCode.SUCCESS.getMsg());
		res.setExtendOne(extendOne);
		res.setExtendTwo(extendTwo);
		res.setExtendThree(extendThree);
		return res;
	}
	
	public static Response fail(){
		Response res = new Response();
		res.setCode(ReturnCode.BIZ_FAIL.getCode());
		res.setMessage(ReturnCode.BIZ_FAIL.getMsg());
		return res;
	}
	
	public static Response returnCode(ReturnCode returnCode){
		Response res = new Response();
		res.setCode(returnCode.getCode());
		res.setMessage(returnCode.getMsg());
		return res;
	}
	
	public static Response returnCode(String code, String msg){
		Response res = new Response();
		res.setCode(code);
		res.setMessage(msg);
		return res;
	}
	public static Response returnCodeAndData(String code, String msg,Object data){
		Response res = new Response();
		res.setCode(code);
		res.setMessage(msg);
		res.setData(data);
		return res;
	}
	
	public static Response ok(){
		Response res = new Response();
		res.setCode(ReturnCode.SUCCESS.getCode());
		res.setMessage(ReturnCode.SUCCESS.getMsg());
		return res;
	}

}