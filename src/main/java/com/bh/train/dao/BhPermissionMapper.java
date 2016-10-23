package com.bh.train.dao;

import com.bh.train.model.BhPermission;

public interface BhPermissionMapper {
    int deleteByPrimaryKey(Integer prmissionId);

    int insert(BhPermission record);

    int insertSelective(BhPermission record);

    BhPermission selectByPrimaryKey(Integer prmissionId);

    int updateByPrimaryKeySelective(BhPermission record);

    int updateByPrimaryKey(BhPermission record);
}