package com.bh.train.service;

import com.bh.train.model.BhUser;
import com.bh.train.vo.LoginReqVo;

/**
 * Created by zhuyy on 2016/10/20.
 */
public interface UserService {
    /**
     * 登录
     * @param loginReqVo
     * @return
     */
    public BhUser login(LoginReqVo loginReqVo);
}
