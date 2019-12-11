package com.ydy.application.shiro.filter;


import com.alibaba.fastjson.JSON;
import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.shiro.token.PasswordToken;
import com.ydy.application.util.JsonUtil;
import com.ydy.application.util.RequestResponseUtil;
import com.ydy.application.util.Response;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.AccessControlFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
            RequestResponseUtil.setHeader(httpRequest,httpResponse);
            return true;
        }
        AuthenticationToken authenticationToken = null;
        try {
            authenticationToken = createPasswordToken(request);
        }catch (Exception e) {
            // response 告知无效请求
            Response message = Response.returnCode(ReturnCode.LOGIN_FAIL);
            RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
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
            Response message = Response.returnCode(ReturnCode.LOGIN_FAIL);
            RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
            return false;
        }catch (Exception e) {
            LOGGER.error(authenticationToken.getPrincipal()+"::认证异常::"+e.getMessage(),e);
            // 返回response告诉客户端认证失败
            Response message = Response.returnCode(ReturnCode.LOGIN_FAIL_AUTHENTICATION);
            RequestResponseUtil.responseWrite(JSON.toJSONString(message),response);
            return false;
        }
    }

    private AuthenticationToken createPasswordToken(ServletRequest request) throws Exception {
        String param = RequestResponseUtil.getRequestPost((HttpServletRequest) request);
        PasswordToken passwordToken = JsonUtil.json2Ojbect(param, PasswordToken.class);

        //由于 request.getInputStream() 只能获取一次body的问题，参数放入attribute中
        request.setAttribute("username", passwordToken.getUsername());
        request.setAttribute("password", passwordToken.getPassword());
        return passwordToken;
    }
    




}
