package com.bh.train.common.vo;

import com.alibaba.fastjson.JSON;

import java.io.Serializable;

/**
 * 文件上传响应类
 * Created by lp on 2016/11/5.
 */
public class RspUploadVo implements Serializable {

    /**
     * 错误编码
     */
    private  Integer error;
    /**
     * 上传文件名
     */
    private  String headicon;
    /**
     * 上传文件路径
     */
    private String url;
    /**
     * 返回文字说明
     */
    private  String message;

    public  RspUploadVo(){

    }

    public  RspUploadVo( Integer error,String message){
        this.error = error;
        this.message=message;
    }

    public Integer getError() {
        return error;
    }

    public void setError(Integer error) {
        this.error = error;
    }

    public String getHeadicon() {
        return headicon;
    }

    public void setHeadicon(String headicon) {
        this.headicon = headicon;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public static RspUploadVo json(Integer error,String message) {
        return new RspUploadVo(error, message);
    }
    public static RspUploadVo json(Integer error,String message,RspUploadVo rspUploadVo) {
        rspUploadVo.setError(error);
        rspUploadVo.setMessage(message);
        return rspUploadVo;
    }

    public static String jsonStr(Integer error,String message) {
        RspUploadVo vo = new RspUploadVo(error, message);
        return JSON.toJSONString(vo);
    }
    public static String jsonStr(Integer error,String message,RspUploadVo rspUploadVo) {
        rspUploadVo.setError(error);
        rspUploadVo.setMessage(message);
        return JSON.toJSONString(rspUploadVo);
    }
}
