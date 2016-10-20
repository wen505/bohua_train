package com.bh.train.common.vo;

/**
 * Created by zhuyy on 2016/10/20.
 */
public class RspErrorVo {

    private String code;
    private String msg;

    public RspErrorVo(String code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
