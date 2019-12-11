package com.ydy.application.shiro.realm;

import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.shiro.token.JwtToken;
import com.ydy.application.util.AuthTokenUtil;
import com.ydy.application.util.JsonUtil;
import com.ydy.application.util.JsonWebTokenUtil;
import com.ydy.application.util.RedisUtil;
import io.jsonwebtoken.MalformedJwtException;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;

import java.util.Map;
import java.util.Set;

/**
 *
 */
public class JwtRealm extends AuthorizingRealm {

    private static final String JWT = "jwt:";

    @Autowired
    private RedisUtil redisUtil;

    @Override
    public Class<?> getAuthenticationTokenClass() {
        // 此realm只支持jwtToken
        return JwtToken.class;
    }

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {

        String payload = (String) principalCollection.getPrimaryPrincipal();
        // likely to be json, parse it:
        if (payload.startsWith(JWT)) {
            AuthTokenDTO authTokenDTO = AuthTokenUtil.parseJwt(payload.substring(4));
            Set<String> roles = JsonUtil.split(authTokenDTO.getRoles());

            SimpleAuthorizationInfo info =  new SimpleAuthorizationInfo();
            if(null!=roles&&!roles.isEmpty()) {
                info.setRoles(roles);
            }
//            if(null!=permissions&&!permissions.isEmpty()) {
//                info.setStringPermissions(permissions);
//            }
            return info;
        }
        return null;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        if (!(authenticationToken instanceof JwtToken)) {
            return null;
        }
        JwtToken jwtToken = (JwtToken)authenticationToken;
        String jwt = (String)jwtToken.getCredentials();
        String payload = (String)jwtToken.getPrincipal();
        if(null == payload){
            //令牌无效
            throw new AuthenticationException("errJwt");
        }
        return new SimpleAuthenticationInfo(JWT + jwt,jwt,this.getName());
    }
}
