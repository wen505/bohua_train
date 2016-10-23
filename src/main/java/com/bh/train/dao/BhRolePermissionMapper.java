package com.bh.train.dao;

import com.bh.train.model.BhRolePermission;

public interface BhRolePermissionMapper {
    int deleteByPrimaryKey(Integer relationId);

    int insert(BhRolePermission record);

    int insertSelective(BhRolePermission record);

    BhRolePermission selectByPrimaryKey(Integer relationId);

    int updateByPrimaryKeySelective(BhRolePermission record);

    int updateByPrimaryKey(BhRolePermission record);
}