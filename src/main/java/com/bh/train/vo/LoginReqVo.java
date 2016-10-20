package com.bh.train.vo;

/**
 * Created by zhuyy on 2016/10/20.
 */
public class LoginReqVo {
    public String userName;
    public String password;
    public String validCode;

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getValidCode() {
        return validCode;
    }

    public void setValidCode(String validCode) {
        this.validCode = validCode;
    }
}
