package com.bh.train.common;

/**
 * Created by zhuyy on 2016/10/20.
 */
public class Constant {

    /**成功**/
    public static final String SUCCESS_CODE = "1";
    /**失败**/
    public static final String ERROR_CODE = "0";
    /**
     * 用户行为异常
     */
    public static final String USER_ERROR_CODE = "2";
    /**
     * 业务异常
     */
    public static final String BUSSINESS_ERROR_CODE = "3";
    /**
     * 系统异常
     */
    public static final String SYSTEM_ERROR_CODE = "4";

    /**
     * session 中用户key值
     */
    public static final String LOGIN_USER = "LOGIN_USER";
    /**
     * 上传文件目录
     */
    public  static  final String UPLOAD_PATH="upload";
    /**
     * 公告上传文件目录
     */
    public  static  final String NOTICE_PATH="notice";
    /**
     * 与数据库可用标志对应
     */
    public static final String ENABLE_FLAG = "Y";
    /**
     * 与数据库不可用标志对应
     */
    public static final String UN_ENABLE_FLAG = "N";
}
