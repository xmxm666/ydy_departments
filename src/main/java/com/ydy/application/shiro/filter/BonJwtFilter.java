package com.ydy.application.shiro.filter;

import com.alibaba.fastjson.JSON;

import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.service.department.DepartmentsAdminService;
import com.ydy.application.shiro.token.JwtToken;
import com.ydy.application.util.*;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.SignatureAlgorithm;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.util.StringUtils;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;
import java.util.stream.Stream;

/**
 *  支持restful url 的过滤链  JWT json web token 过滤器，无状态验证
 */
public class BonJwtFilter extends AbstractPathMatchingFilter {

    private static final Logger LOGGER = LoggerFactory.getLogger(BonJwtFilter.class);
    private static final String STR_EXPIRED = "expiredJwt";


    private StringRedisTemplate redisTemplate;
    private DepartmentsAdminService accountService;

    @Override
    protected boolean isAccessAllowed(ServletRequest servletRequest, ServletResponse servletResponse, Object mappedValue) throws Exception {
        Subject subject = getSubject(servletRequest,servletResponse);

        //记录调用api日志到数据库
//        LogExeManager.getInstance().executeLogTask(LogTaskFactory.bussinssLog(WebUtils.toHttp(servletRequest).getHeader("appId"),
//                WebUtils.toHttp(servletRequest).getRequestURI(),WebUtils.toHttp(servletRequest).getMethod(),(short)1,null));

        boolean isJwtPost = (null != subject && !subject.isAuthenticated()) && isJwtSubmission(servletRequest);
        // 判断是否为JWT认证请求
        if (isJwtPost) {
            AuthenticationToken token = createJwtToken(servletRequest);
            try {
                subject.login(token);
                return this.checkRoles(subject,mappedValue);
            }catch (AuthenticationException e) {

                // 如果是JWT过期
                if (STR_EXPIRED.equals(e.getMessage())) {
                    // 这里初始方案先抛出令牌过期，之后设计为在Redis中查询当前appId对应令牌，其设置的过期时间是JWT的两倍，此作为JWT的refresh时间
                    // 当JWT的有效时间过期后，查询其refresh时间，refresh时间有效即重新派发新的JWT给客户端，
                    // refresh也过期则告知客户端JWT时间过期重新认证

                    // 当存储在redis的JWT没有过期，即refresh time 没有过期
                    String appId = WebUtils.toHttp(servletRequest).getHeader("appId");
                    String jwt = WebUtils.toHttp(servletRequest).getHeader("authorization");
                    String refreshJwt = redisTemplate.opsForValue().get("JWT-SESSION-"+appId);
                    if (null != refreshJwt && refreshJwt.equals(jwt)) {
                        // 重新申请新的JWT
                        // 根据appId获取其对应所拥有的角色(这里设计为角色对应资源，没有权限对应资源)
//                        String roles = accountService.loadAccountRole(appId);
                        String roles = "";
                        //seconds为单位,10 hours
                        long refreshPeriodTime = 36000L;
                        String newJwt = JsonWebTokenUtil.issueJWT(UUID.randomUUID().toString(),appId,
                                "token-server",refreshPeriodTime >> 1,roles,null, SignatureAlgorithm.HS512);
                        // 将签发的JWT存储到Redis： {JWT-SESSION-{appID} , jwt}
                        redisTemplate.opsForValue().set("JWT-SESSION-"+appId,newJwt,refreshPeriodTime, TimeUnit.SECONDS);
//                        Message message = new Message().ok(1005,"new jwt").addData("jwt",newJwt);
                        Response message = Response.ok(newJwt);
                        RequestResponseUtil.responseWrite(JSON.toJSONString(message),servletResponse);
                        return false;
                    }else {
                        // jwt时间失效过期,jwt refresh time失效 返回jwt过期客户端重新登录
                        Response message = Response.returnCode(ReturnCode.TOKEN_INVALID);
                        RequestResponseUtil.responseWrite(JSON.toJSONString(message),servletResponse);
                        return false;
                    }

                }
                // 其他的判断为JWT错误无效
                Response message = Response.returnCode(ReturnCode.TOKEN_INVALID);
                RequestResponseUtil.responseWrite(JSON.toJSONString(message),servletResponse);
                return false;

            }catch (Exception e) {
                // 其他错误
                LOGGER.error(IpUtil.getIpFromRequest(WebUtils.toHttp(servletRequest))+"--JWT认证失败"+e.getMessage(),e);
                // 告知客户端JWT错误1005,需重新登录申请jwt
                Response message = Response.returnCode(ReturnCode.TOKEN_INVALID);
                RequestResponseUtil.responseWrite(JSON.toJSONString(message),servletResponse);
                return false;
            }
        }else {
            // 请求未携带jwt 判断为无效请求
            Response message = Response.returnCode(ReturnCode.NO_TOKEN);
            RequestResponseUtil.responseWrite(JSON.toJSONString(message),servletResponse);
            return false;
        }
    }

    @Override
    protected boolean onAccessDenied(ServletRequest servletRequest, ServletResponse servletResponse) throws Exception {
        Subject subject = getSubject(servletRequest,servletResponse);

        // 未认证的情况上面已经处理  这里处理未授权
        if (subject != null && subject.isAuthenticated()){
            //  已经认证但未授权的情况
            // 告知客户端JWT没有权限访问此资源
            Response message = Response.returnCode(ReturnCode.NOT_ROLE_OPERATION);
            RequestResponseUtil.responseWrite(JSON.toJSONString(message),servletResponse);
        }
        // 过滤链终止
        return false;
    }

    private boolean isJwtSubmission(ServletRequest servletRequest) {
        if(servletRequest instanceof HttpServletRequest) {
            HttpServletRequest request = (HttpServletRequest) servletRequest;
            String jwt = request.getHeader("token");
            return !StringUtils.isEmpty(jwt);
        }
        return false;
    }

    private AuthenticationToken createJwtToken(ServletRequest servletRequest) {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        String jwt = request.getHeader("token");
        Claims claims = AuthTokenUtil.parserJavaWebToken(jwt);
        String userName = null == claims.get("username") ? null : (String) claims.get("username");
        return new JwtToken(userName, jwt);
    }

    /**
     * description 验证当前用户是否属于mappedValue任意一个角色
     *
     * @param subject 1
     * @param mappedValue 2
     * @return boolean
     */
    private boolean checkRoles(Subject subject, Object mappedValue){
        String[] rolesArray = (String[]) mappedValue;
        return rolesArray == null || rolesArray.length == 0 || Stream.of(rolesArray).anyMatch(role -> subject.hasRole(role.trim()));
    }


    public void setRedisTemplate(StringRedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }


    public void setAccountService(DepartmentsAdminService accountService) {
        this.accountService = accountService;
    }
}
