package com.bh.train.dao;

import com.bh.train.model.BhUserRole;

public interface BhUserRoleMapper {
    int deleteByPrimaryKey(Integer userRoleId);

    int insert(BhUserRole record);

    int insertSelective(BhUserRole record);

    BhUserRole selectByPrimaryKey(Integer userRoleId);

    int updateByPrimaryKeySelective(BhUserRole record);

    int updateByPrimaryKey(BhUserRole record);
}