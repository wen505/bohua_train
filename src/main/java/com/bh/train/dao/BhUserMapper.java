package com.bh.train.dao;

import com.bh.train.model.BhUser;
import com.bh.train.vo.LoginReqVo;

public interface BhUserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(BhUser record);

    int insertSelective(BhUser record);

    BhUser selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(BhUser record);

    int updateByPrimaryKey(BhUser record);

    BhUser selectForLogin(LoginReqVo loginReqVo);
}