package com.ydy.application.interceptor;

import java.lang.reflect.Method;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.alibaba.fastjson.JSON;
import com.ydy.application.Enum.NOT_AUTH_URL;
import com.ydy.application.Enum.PLAT_TYPE;
import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.AuthTokenUtil;

import io.jsonwebtoken.Claims;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class AuthorityInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("*****************************url:{}", request.getRequestURI().toString());
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		String token = request.getHeader("token"); // 从前台的 header中拿token
//		log.info("PreRequestFilter.token:" + token);
//		String url = request.getRequestURL().toString();
//		boolean urlFlag = NOT_AUTH_URL.isUrlCotainsAnyCode(url);
//		log.info("authFlag =============:0" + urlFlag);
//		if (!urlFlag) {
//			// 校验token
//			if (StringUtils.isBlank(token)) {
//				log.info("token为空，禁止访问!");
//				response.setStatus(401);
//				response.getWriter().write("未认证");
//				return false;
//			}
//		}
		//解析token
		String ip = null;
		log.info("cloud request context filter inited");
		if (request != null) {
			ip = getIPAddress(request);
			log.info("*****************ip******************************{}", ip);
		}
		if (StringUtils.isNotBlank(token)) {
			Claims claims = AuthTokenUtil.parserJavaWebToken(token);

			AuthTokenDTO ctx = new AuthTokenDTO();
			String platType = null == claims.get("platType") ? null : (String) claims.get("platType");
			String userName = null == claims.get("username") ? null : (String) claims.get("username");
			Integer userId = null == claims.get("userId") ? null : (Integer) claims.get("userId");
			ctx.setUserName(userName);
			ctx.setUserId(userId);
			//ctx.setRegisterTime(new Date(registerTime));
			if (PLAT_TYPE.DEPARTMENT_ADMIN.getCode().equals(platType)) {
				Integer sectionId = null == claims.get("section_id") ? null : (Integer) claims.get("section_id");
				ctx.setSectionId(sectionId);
			}
			ContextHolder.set(ctx);
			log.info("*******************操作上下文已设置：{}*******************", JSON.toJSONString(ctx)
					+ "*********url******" + request.getRequestURL().toString() + "********ip******" + ip);
		}
		log.info("*******************操作上下文已设置：{}*******************", request.getRequestURL().toString());
		return true;
	}
	
	public static String getIPAddress(HttpServletRequest request) {
		String ip = null;

		// X-Forwarded-For：Squid 服务代理
		String ipAddresses = request.getHeader("X-Forwarded-For");

		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
			// Proxy-Client-IP：apache 服务代理
			ipAddresses = request.getHeader("Proxy-Client-IP");
		}

		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
			// WL-Proxy-Client-IP：weblogic 服务代理
			ipAddresses = request.getHeader("WL-Proxy-Client-IP");
		}

		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
			// HTTP_CLIENT_IP：有些代理服务器
			ipAddresses = request.getHeader("HTTP_CLIENT_IP");
		}

		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
			// X-Real-IP：nginx服务代理
			ipAddresses = request.getHeader("X-Real-IP");
		}

		// 有些网络通过多层代理，那么获取到的ip就会有多个，一般都是通过逗号（,）分割开来，并且第一个ip为客户端的真实IP
		if (ipAddresses != null && ipAddresses.length() != 0) {
			ip = ipAddresses.split(",")[0];
		}

		// 还是不能获取到，最后再通过request.getRemoteAddr();获取
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}