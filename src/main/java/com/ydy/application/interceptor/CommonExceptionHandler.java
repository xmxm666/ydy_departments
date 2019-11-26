package com.ydy.application.interceptor;

import com.ydy.application.Enum.ReturnCode;
import com.ydy.application.util.Response;
import lombok.extern.slf4j.Slf4j;
import org.apache.shiro.authc.AuthenticationException;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@ControllerAdvice
public class CommonExceptionHandler {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public Response exceptionHandler(Exception e)
    {
        log.error("系统错误:" + e.getMessage());
        return Response.returnCode(ReturnCode.SERVICE_UNAVAILABLE);
    }

    @ExceptionHandler(AuthenticationException.class)
    @ResponseBody
    public Response exceptionHandler(AuthenticationException e)
    {
        return Response.returnCode(ReturnCode.LOGIN_FAIL);
    }

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseBody
    public Response exceptionHandler(MethodArgumentNotValidException e)
    {
        log.info("参数为空:" + e.getMessage());
        return Response.returnCode("401", e.getBindingResult().getFieldError().getDefaultMessage());
    }

}