package com.bh.train.common.vo;


import com.bh.train.common.Constant;

/**
 * Created by zhuyy on 2016/10/20.
 */
public class RspData {

    private String code;

    private String msg;

    private Object data;

    public RspData() {
    }

    public RspData(String code, String msg, Object data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    /**
     *返回成功
     * @param data
     * @return
     */
    public static RspData success(Object data) {
        return new RspData(Constant.SUCCESS_CODE, null, data);
    }

    /**
     *  返回成功失败！
     * @param success  是否成功
     * @return （1,成功 2 失败）
     */
    public static RspData issuccess(boolean success) {
       if (success){
           return new RspData(Constant.SUCCESS_CODE, null, null);
       }else {
           return new RspData(Constant.ERROR_CODE, null, null);
       }
    }
    /**
     * 失败返回 ，返回代码为2
     * @param msg
     * @return
     */
    public static RspData error(String msg) {
        return new RspData(Constant.ERROR_CODE, msg, null);
    }

    /**
     *  返回失败
     * @param code 错误代码
     * @param msg 错误消息
     * @return
     */
    public static RspData error(String code, String msg) {
        return new RspData(code, msg, null);
    }



    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }


    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

}
