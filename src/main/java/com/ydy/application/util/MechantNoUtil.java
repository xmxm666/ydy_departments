package com.ydy.application.util;

import java.util.Date;
import java.util.Random;

public class MechantNoUtil {

	
	/* 
	 * 返回长度为【strLength】的随机数，在前面补0 
	 */  
	public static String randCode(int strLength) {  
		
		//int strLength=4;//4位长度	      
	    Random rm = new Random();  
	      
	    // 获得随机数  
	    double pross = (1 + rm.nextDouble()) * Math.pow(10, strLength);  
	  
	    // 将获得的获得随机数转化为字符串  
	    String fixLenthString = String.valueOf(pross);  
	  
	    // 返回固定的长度的随机数  
	    return fixLenthString.substring(1, strLength + 1);  
	} 
	
	/* 
	 * 返回长度为20的賬戶唯一編號
	 */
	public static String getMechantNo(String head) {  
		
		String randCode4 = MechantNoUtil.randCode(6);
		
		String mechantNo =head+  new Date().getTime()+randCode4;
		
		return mechantNo;
		
	}
	
	
	/* 
	 * 返回长度为10的批次号
	 */
	public static String getBatchNo(String head) {  
		
		String randCode8 = MechantNoUtil.randCode(8);
		
		String mechantNo =head+randCode8;
		
		return mechantNo;
		
	}
	
}
