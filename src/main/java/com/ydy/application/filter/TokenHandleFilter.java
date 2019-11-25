//package com.ydy.application.filter;
//
//import java.io.IOException;
//import java.util.Date;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.http.HttpServletRequest;
//
//import org.apache.commons.lang3.StringUtils;
//
//import com.alibaba.fastjson.JSON;
//import com.ydy.application.Enum.PLAT_TYPE;
//import com.ydy.application.token.ContextHolder;
//import com.ydy.application.util.AuthTokenUtil;
//
//import io.jsonwebtoken.Claims;
//import lombok.extern.slf4j.Slf4j;
//
///**
// * 设置上下文信息过滤器
// */
//@Slf4j
//public class TokenHandleFilter implements Filter {
//
//	/**
//	 * 回收
//	 */
//	@Override
//	public void destroy() {
//
//	}
//
//	@Override
//	public void init(FilterConfig filterConfig) throws ServletException {
//		log.info("cloud request context filter inited");
//	}
//
//	@Override
//	public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		HttpServletRequest request = (HttpServletRequest) servletRequest;
//		String ip = null;
//		log.info("cloud request context filter inited");
//		if (request != null) {
//			ip = getIPAddress(request);
//			log.info("*****************ip******************************{}", ip);
//		}
//
//		String token = request.getHeader("token");
//
//		if (StringUtils.isNotBlank(token)) {
//			Claims claims = AuthTokenUtil.parserJavaWebToken(token);
//
//			AuthTokenDTO ctx = new AuthTokenDTO();
//			String platType = null == claims.get("platType") ? null : (String) claims.get("platType");
//			Integer userId = null == claims.get("userId") ? null : (Integer) claims.get("userId");
//			String accountNo = null == claims.get("accountNo") ? null : (String) claims.get("accountNo");
//			String userName = null == claims.get("userName") ? null : (String) claims.get("userName");
//			Long registerTime = null == claims.get("registerTime") ? null : (Long) claims.get("registerTime");
//			ctx.setUserId(userId);
//			ctx.setPlatType(platType);
//			ctx.setAccountNo(accountNo);
//			ctx.setUserName(userName);
//			//ctx.setRegisterTime(new Date(registerTime));
//			if (PLAT_TYPE.DEPARTMENT_ADMIN.getCode().equals(platType)) {
//				Integer sectionId = null == claims.get("section_id") ? null : (Integer) claims.get("section_id");
//				ctx.setSectionId(sectionId);
//			} else if (PLAT_TYPE.JXC.getCode().equals(platType)) {
//				String mechantNo = null == claims.get("mechantNo") ? null : (String) claims.get("mechantNo");
//				ctx.setMechantNo(mechantNo);
//			}
//			
//			log.info("注册时间============", registerTime);
//			// ctx.setRegisterTime(new Date(getHeaderLong(request, "registerTime")));
//			ctx.setAccessToken(request.getHeader("token"));
//
////			if (StringUtils.isNotBlank(userName)){
////				ctx.setUserName(URLEncoder.encode(userName,"UTF-8"));
////			}else{
////				ctx.setUserName(userName);
////			}
//			ContextHolder.set(ctx);
//			log.info("*******************操作上下文已设置：{}*******************", JSON.toJSONString(ctx)
//					+ "*********url******" + request.getRequestURL().toString() + "********ip******" + ip);
//		}
//		log.info("*******************操作上下文已设置：{}*******************", request.getRequestURL().toString());
//		chain.doFilter(request, response);
//	}
//
//	private static Long getHeaderLong(HttpServletRequest request, String key) {
//		String headerVal = request.getHeader(key);
//		if (StringUtils.trimToEmpty(headerVal).equals(StringUtils.EMPTY)) {
//			return 0L;
//		}
//		Long retVal = 0L;
//		try {
//			retVal = Long.valueOf(headerVal);
//		} catch (NumberFormatException e) {
//			log.info("上下文转换异常，key=" + key + ", 值=" + (StringUtils.isEmpty(headerVal) ? "空值" : headerVal));
//			retVal = 0L;
//		}
//		return retVal;
//	}
//
//	private static Integer getHeaderInteger(HttpServletRequest request, String key) {
//		String headerVal = request.getHeader(key);
//		if (StringUtils.trimToEmpty(headerVal).equals(StringUtils.EMPTY)) {
//			return 0;
//		}
//		Integer retVal = 0;
//		try {
//			retVal = Integer.valueOf(headerVal);
//		} catch (NumberFormatException e) {
//			log.info("上下文转换异常，key=" + key + ", 值=" + (StringUtils.isEmpty(headerVal) ? "空值" : headerVal));
//			retVal = 0;
//		}
//		return retVal;
//	}
//
//	public static String getIPAddress(HttpServletRequest request) {
//		String ip = null;
//
//		// X-Forwarded-For：Squid 服务代理
//		String ipAddresses = request.getHeader("X-Forwarded-For");
//
//		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
//			// Proxy-Client-IP：apache 服务代理
//			ipAddresses = request.getHeader("Proxy-Client-IP");
//		}
//
//		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
//			// WL-Proxy-Client-IP：weblogic 服务代理
//			ipAddresses = request.getHeader("WL-Proxy-Client-IP");
//		}
//
//		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
//			// HTTP_CLIENT_IP：有些代理服务器
//			ipAddresses = request.getHeader("HTTP_CLIENT_IP");
//		}
//
//		if (ipAddresses == null || ipAddresses.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
//			// X-Real-IP：nginx服务代理
//			ipAddresses = request.getHeader("X-Real-IP");
//		}
//
//		// 有些网络通过多层代理，那么获取到的ip就会有多个，一般都是通过逗号（,）分割开来，并且第一个ip为客户端的真实IP
//		if (ipAddresses != null && ipAddresses.length() != 0) {
//			ip = ipAddresses.split(",")[0];
//		}
//
//		// 还是不能获取到，最后再通过request.getRemoteAddr();获取
//		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ipAddresses)) {
//			ip = request.getRemoteAddr();
//		}
//		return ip;
//	}
//
//}
