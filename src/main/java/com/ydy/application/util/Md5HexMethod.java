package com.ydy.application.util;

import java.security.MessageDigest;
import java.util.Date;
import java.util.Random;

import org.apache.commons.codec.digest.DigestUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 影像系统参数加密方法
 */
public class Md5HexMethod {

	private static Logger logger = LoggerFactory.getLogger(Md5HexMethod.class);

	/**
	 * @Description 生成一个length位的随机字符串
	 * @param length
	 */
	public static String getRandomString(int length) {
		String base = "abcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < length; i++) {
			int number = random.nextInt(base.length());
			sb.append(base.charAt(number));
		}
		return sb.toString();
	}

	/**
	 * 影像系统加密方法
	 * 
	 * @param strTxt
	 *            随机数字
	 * @param keyStr
	 *            影像系统提供中间参数
	 * @param dateStr
	 *            yyyyMMdd
	 */
	public static String md5Encode(String strTxt, String keyStr, String dateStr) {
		dateStr = DateUtil.toShortDay(new Date());
		logger.info("发起方生成的随机字符串:" + strTxt);
		logger.info("双方系统约定的字符串:" + keyStr);
		logger.info("系统当前的日期(yyyyMMdd):" + dateStr);
		logger.info("准备加密的原文:" + (strTxt + keyStr + dateStr));
		String strMtxt = DigestUtils.md5Hex(strTxt + keyStr + dateStr);
		logger.info("原文加密后得到的密文:" + strMtxt);
		return strMtxt;
	}

	public static String MD5Encode(String origin) {
		String resultString = null;

		try {
			resultString = new String(origin);
			MessageDigest md = MessageDigest.getInstance("MD5");
			resultString = byteArrayToHexString(md.digest(resultString
					.getBytes()));
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return resultString;
	}

	private final static String[] hexDigits = { "0", "1", "2", "3", "4", "5",
			"6", "7", "8", "9", "a", "b", "c", "d", "e", "f" };

	public static String byteArrayToHexString(byte[] b) {
		StringBuffer resultSb = new StringBuffer();
		for (int i = 0; i < b.length; i++) {
			resultSb.append(byteToHexString(b[i]));
		}
		return resultSb.toString();
	}

	private static String byteToHexString(byte b) {
		int n = b;
		if (n < 0)
			n = 256 + n;
		int d1 = n / 16;
		int d2 = n % 16;
		return hexDigits[d1] + hexDigits[d2];
	}

	public static void main(String[] args) {
		String s = MD5Encode("123456");
		System.out.println(s);
	}

}
