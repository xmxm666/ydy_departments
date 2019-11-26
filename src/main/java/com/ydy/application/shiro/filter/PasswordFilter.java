package com.ydy.application.shiro.filter;


import com.alibaba.fastjson.JSON;

import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.shiro.token.PasswordToken;
import com.ydy.application.util.IpUtil;
import com.ydy.application.util.JsonUtil;
import com.ydy.application.util.RequestResponseUtil;
import com.ydy.application.util.Response;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Map;
import java.util.concurrent.TimeUnit;

/**
 *   基于 用户名密码 的认证过滤器
 */
public class PasswordFilter extends AccessControlFilter {

    private static final Logger LOGGER = LoggerFactory.getLogger(PasswordFilter.class);

    @Override
    protected boolean isAccessAllowed(ServletRequest request, ServletResponse response, Object mappedValue) {

        Subject subject = getSubject(request,response);
        // 如果其已经登录，再此发送登录请求
        //  拒绝，统一交给 onAccessDenied 处理
        return null != subject && subject.isAuthenticated();
    }

    @Override
    protected boolean onAccessDenied(ServletRequest request, ServletResponse response) throws Exception {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        if (httpRequest.getMethod().equals(RequestMethod.OPTIONS.name())) {
            setHeader(httpRequest,httpResponse);
            return true;
        }
        AuthenticationToken authenticationToken = null;
        try {
            authenticationToken = createPasswordToken(request);
        }catch (Exception e) {
            // response 告知无效请求
//                Message message = new Message().error(1111,"error request");
//                RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
            return false;
        }

        Subject subject = getSubject(request,response);
        try {
            subject.login(authenticationToken);
            //登录认证成功,进入请求派发json web token url资源内
            return true;
        }catch (AuthenticationException e) {
            LOGGER.warn(authenticationToken.getPrincipal()+"::"+e.getMessage());
            // 返回response告诉客户端认证失败
//            Response message = Response.returnCode(ReturnCode.LOGIN_FAIL_AUTHENTICATION);
//            RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
            Response message = Response.returnCode(ReturnCode.LOGIN_FAIL_AUTHENTICATION);
            RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
            return false;
        }catch (Exception e) {
            LOGGER.error(authenticationToken.getPrincipal()+"::认证异常::"+e.getMessage(),e);
            // 返回response告诉客户端认证失败
            Response message = Response.returnCode(ReturnCode.LOGIN_FAIL_AUTHENTICATION);
            RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
            return false;
        }
        // 之后添加对账户的找回等
        // response 告知无效请求
//        Response message = Response.returnCode(ReturnCode.SERVICE_UNAVAILABLE);
//        RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
//        return false;
    }

    private AuthenticationToken createPasswordToken(ServletRequest servletRequest) throws Exception {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        
        byte buffer[] = getRequestPostBytes(request);  
        String charEncoding = request.getCharacterEncoding();  
        if (charEncoding == null) {  
            charEncoding = "UTF-8";  
        }  
        String param = new String(buffer, charEncoding);

        PasswordToken passwordToken = JsonUtil.json2Ojbect(param, PasswordToken.class);
        return passwordToken;
    }
    
     public static byte[] getRequestPostBytes(HttpServletRequest request)  
                        throws IOException {  
        int contentLength = request.getContentLength();  
        if(contentLength<0){  
            return null;  
        }  
        byte buffer[] = new byte[contentLength];  
        for (int i = 0; i < contentLength;) {  
  
            int readlen = request.getInputStream().read(buffer, i,  
                                        contentLength - i);  
            if (readlen == -1) {  
                break;  
            }  
            i += readlen;  
        }  
        return buffer;  
    }

    /**
     * 为response设置header，实现跨域
     */
    private void setHeader(HttpServletRequest request, HttpServletResponse response){
        //跨域的header设置
        response.setHeader("Access-control-Allow-Origin", request.getHeader("Origin"));
        response.setHeader("Access-Control-Allow-Methods", request.getMethod());
        response.setHeader("Access-Control-Allow-Credentials", "true");
        response.setHeader("Access-Control-Allow-Headers", request.getHeader("Access-Control-Request-Headers"));
        //防止乱码，适用于传输JSON数据
        response.setHeader("Content-Type","application/json;charset=UTF-8");
        response.setStatus(HttpStatus.OK.value());
    }

}
