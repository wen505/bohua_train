package com.bh.train.service.impl;

import com.bh.train.common.Constant;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.dao.BhUserMapper;
import com.bh.train.model.BhUser;
import com.bh.train.service.UserService;
import com.bh.train.vo.LoginReqVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by zhuyy on 2016/10/20.
 */
@Service("userService")
public class UserServiceImpl implements UserService{

    @Resource
    private BhUserMapper bhUserMapper;

    @Override
    public BhUser login(LoginReqVo loginReqVo) {
        BhUser user = bhUserMapper.selectForLogin(loginReqVo);
        if (user == null) {
            throw new BusinessException("用户名或密码有误！", Constant.ERROR_CODE);
        }
        return user;
    }
}
