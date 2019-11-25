//package com.ydy.application.filter;
//
//import java.io.IOException;
//import java.io.PrintWriter;
//import java.net.URLEncoder;
//import java.util.Date;
//
//import javax.servlet.Filter;
//import javax.servlet.FilterChain;
//import javax.servlet.FilterConfig;
//import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
//import javax.servlet.ServletResponse;
//import javax.servlet.annotation.WebFilter;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.apache.commons.lang3.StringUtils;
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.boot.web.servlet.ServletComponentScan;
//import org.springframework.core.annotation.Order;
//import org.springframework.stereotype.Component;
//
//import com.alibaba.fastjson.JSON;
//import com.ydy.application.Enum.NOT_AUTH_URL;
//import com.ydy.application.token.ContextHolder;
//
//import lombok.extern.slf4j.Slf4j;
//
///**
// * 设置上下文信息过滤器
// */
//@Slf4j
//public class AuthFilter implements Filter {
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
//		log.info("B filter inited");
//	}
//
//	@Override
//	public void doFilter(ServletRequest servletRequest, ServletResponse response, FilterChain chain)
//			throws IOException, ServletException {
//		HttpServletRequest request = (HttpServletRequest) servletRequest;
//		HttpServletResponse resp = (HttpServletResponse) response;
//		String string = request.getRequestURL().toString();
//		log.info("*****************************url:{}" , request.getRequestURI().toString());
//		// 开放 api 处理
//		if (string.indexOf("/support/service/open") > 0) {
//			log.info("==开放 api 处理==");
//			chain.doFilter(request, response);
//		}
//		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
//		httpServletResponse.setContentType("application/json");
//		httpServletResponse.setCharacterEncoding("UTF-8");
//		String token = request.getHeader("token"); // 从前台的 header中拿token
//		log.info("PreRequestFilter.token:" + token);
//		String url = request.getRequestURL().toString();
//		boolean urlFlag = NOT_AUTH_URL.isUrlCotainsAnyCode(url);
//		log.info("authFlag =============:0" + urlFlag);
//		if (!urlFlag) {
//			// 校验token
//			if (StringUtils.isBlank(token)) {
//				log.info("token为空，禁止访问!");
//				resp.setStatus(401);
//				resp.getWriter().write("未认证");
//				return;
//			}
//		}
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
