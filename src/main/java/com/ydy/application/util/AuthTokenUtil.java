package com.ydy.application.util;

import java.util.Date;
import java.util.Map;

import com.ydy.application.Enum.PLAT_TYPE;
import com.ydy.application.filter.AuthTokenDTO;
import io.jsonwebtoken.*;

import javax.xml.bind.DatatypeConverter;

public class AuthTokenUtil {
	
	static final String BEARER = "Bearer ";
	static final String SECRET = "wjjSecret";
	
	/**
	 * 创建token
	 */
	public static String createAuthToken(Map<String, Object> map) {
		String jwt = Jwts.builder().setClaims(map)
//				.setExpiration(new Date(System.currentTimeMillis() + 3600_000_000L))// 1000hour
//				.setExpiration(new Date(System.currentTimeMillis() + (Long) map.get("expTime")))  // saas,plat 0.5小时  app 30天
				.signWith(SignatureAlgorithm.HS512, SECRET).compact();
		return BEARER + jwt;
	}

	/**
	 * 解析Token，同时也能验证Token，当验证失败返回null
	 */
	public static Claims parserJavaWebToken(String token) {
		try {
			return Jwts.parser().setSigningKey(SECRET).parseClaimsJws(token.replace(BEARER, "")).getBody();
		} catch (Exception e) {
			return null;
		}
	}
	
	public static void main(String[] args) {
		String str = "Bearer eyJhbGciOiJIUzUxMiJ9.eyJwaG9uZSI6IjE3NjEyMTY3MjI5IiwicmVnaXN0ZXJUaW1lIjoxNTQyMDE2MjYzMDAwLCJhY2NvdW50Tm8iOiJHTTIwMTgxMTEyMTc1MTAzMDAxMDI1Iiwic2V4IjoiMSIsIm5ld09sZEZsYWciOiIwIiwicGxhdFR5cGUiOiIwIiwiZXhwIjoxNTQ2MTMzMDg2LCJ1c2VySWQiOiI1NDAiLCJhZ2UiOjM4fQ.RRGPsZAvwf5FpM4GP6PqZeZExjxo0nKuAtKJm6a0pWjYm4LxjeyYaVhC6H-XmBYhettBSxv2UAJO3cAFP5tlDg";
		Claims c = AuthTokenUtil.parserJavaWebToken(str);
		System.out.println(c);
	}
}
