package com.ydy.application.util;


import com.alibaba.fastjson.JSON;
import org.apache.shiro.web.util.WebUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;

import javax.servlet.ServletInputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * http request response 过滤XSS SQL 数据工具类
 */
public class RequestResponseUtil {

    private static final Logger LOGGER = LoggerFactory.getLogger(RequestResponseUtil.class);
    private static final String STR_BODY = "body";

    /**
     * description 获取request中的body json 数据转化为map
     *
     * @param request 1
     * @return java.util.Map<java.lang.String,java.lang.String>
     */
    @SuppressWarnings("unchecked")
    public static Map<String, String> getRequestBodyMap(ServletRequest request) {
        Map<String ,String > dataMap = new HashMap<>(16);
        // 判断是否已经将 inputStream 流中的 body 数据读出放入 attribute
        if (request.getAttribute(STR_BODY) != null) {
            // 已经读出则返回attribute中的body
            return (Map<String,String>)request.getAttribute(STR_BODY);
        } else {
            try {
                Map<String,String > maps = JSON.parseObject(request.getInputStream(),Map.class);
                dataMap.putAll(maps);
                request.setAttribute(STR_BODY,dataMap);
            }catch (IOException e) {
                e.printStackTrace();
            }
            return dataMap;
        }
    }

    /**
     * description 封装response  统一json返回
     *
     * @param outStr 1
     * @param response 2
     */
    public static void responseWrite(String outStr, ServletResponse response) {

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json;charset=utf-8");
        PrintWriter printWriter = null;
        try {
            printWriter = WebUtils.toHttp(response).getWriter();
            printWriter.write(outStr);
        }catch (Exception e) {
            LOGGER.error(e.getMessage(),e);
        }
    }

    public static String getRequestPost(HttpServletRequest request)
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

        String charEncoding = request.getCharacterEncoding();
        if (charEncoding == null) {
            charEncoding = "UTF-8";
        }
        String param = new String(buffer, charEncoding);
        return param;
    }

    /**
     * 为response设置header，实现跨域
     */
    public static void setHeader(HttpServletRequest request, HttpServletResponse response){
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
