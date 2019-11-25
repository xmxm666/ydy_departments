package com.ydy.application.util;

import java.io.File;
import java.io.FileInputStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.qiniu.common.QiniuException;
import com.qiniu.common.Zone;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.FileInfo;
import com.qiniu.util.Auth;
import com.qiniu.util.StringMap;
import com.ydy.application.config.ConstantQiniu;
import com.ydy.application.dto.ImagesEntity;


@Component
public class QiniuUtils {


    @Autowired
    private ConstantQiniu constantQiniu;

    @Autowired
    private UploadManager uploadManager;

    @Autowired
    private  Auth auth;
    
    public String uploadQNImg(FileInputStream file, String key) throws Exception {
        /*  Configuration cfg = new Configuration(Zone.zone0());
          UploadManager uploadManager = new UploadManager(cfg);*/
          //String accessKey = constantQiniu.getAccessKey();
          String bucket = constantQiniu.getBucket();
          String domainStr = constantQiniu.getDomainStr();
          // String secretKey = constantQiniu.getSecretKey();
          // Auth auth = Auth.create(accessKey, secretKey);
          StringMap putPolicy = new StringMap();
          long expireSeconds = 3600;
          putPolicy.put("returnBody", "{\"key\":\"$(key)\",\"hash\":\"$(etag)\",\"widths\":\"$(imageInfo.width)\",\"heights\":$(imageInfo.height)}");
          String upToken = auth.uploadToken(bucket, null, expireSeconds, putPolicy,false);
          com.qiniu.http.Response response = uploadManager.put(file, key, upToken, null, null);
          ImagesEntity putRet = new Gson().fromJson(response.bodyString(), ImagesEntity.class);
          String returnPath = domainStr + "/" + putRet.key;
          return returnPath;

      }

    
    public String uploadFile(File file, String key) throws Exception {
          String bucket = constantQiniu.getBucket();
          String domainStr = constantQiniu.getDomainStr();
          String upToken = auth.uploadToken(bucket);
          com.qiniu.http.Response response = uploadManager.put(file, key, upToken);
          ImagesEntity putRet = new Gson().fromJson(response.bodyString(), ImagesEntity.class);
          String returnPath = domainStr + "/" + putRet.key;
          return returnPath;
      }

    public static void main(String[] args) {
        Configuration cfg = new Configuration(Zone.zone0());
        //...其他参数参考类注释

        String accessKey = "J2uLxW9fcFDuvnogMncP7P1zUFgZ3PrY--D6prGL";
        String secretKey = "x4qs017UkDSHYKK7yVDB9RVQFUHnxs7S2zGRNPZo";
        String bucket = "gmhealth";
        String key = "FljenY2O-nxENOqtm-7E7V3LhfmT";
        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            FileInfo fileInfo = bucketManager.stat(bucket, key);
            System.out.println(fileInfo.hash);
            System.out.println(fileInfo.fsize);
            System.out.println(fileInfo.mimeType);
            System.out.println(fileInfo.putTime);
        } catch (QiniuException ex) {
            System.err.println(ex.response.toString());
        }
    }

}
