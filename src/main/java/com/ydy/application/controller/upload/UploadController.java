package com.ydy.application.controller.upload;


import java.io.FileInputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ydy.application.filter.AuthTokenDTO;
import com.ydy.application.token.ContextHolder;
import com.ydy.application.util.QiniuUtils;
import com.ydy.application.util.Response;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;


/**
 * <p>
 * 用户信息变更记录日志表 前端控制器
 * </p>
 *
 * @author lilei123
 * @since 2019-03-13
 */
@Api(tags = "图片上传接口")
@Controller
@RequestMapping("/upload")
@Slf4j
public class UploadController {
	
	@Autowired
	private QiniuUtils qiniuUtils;
	
	//处理文件上传
	@ApiOperation(value = "文件上传", notes = "注意问题点：\n 1>输入参数：   \n")
	@PostMapping(value="/file")
    public @ResponseBody Response uploadImg(@RequestParam("file") MultipartFile file,
            HttpServletRequest request) throws Exception {
		AuthTokenDTO authTokenDTO = ContextHolder.get();
        FileInputStream inputStream = (FileInputStream) file.getInputStream();
        String path = qiniuUtils.uploadQNImg(inputStream, null);
        log.info("上传文件地址============{}", path);
        return Response.ok(path);
    }
	
	
}

