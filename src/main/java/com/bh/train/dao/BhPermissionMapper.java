package com.bh.train.dao;

import com.bh.train.model.BhPermission;

import java.util.List;

public interface BhPermissionMapper {
    int deleteByPrimaryKey(Integer prmissionId);

    int insert(BhPermission record);

    int insertSelective(BhPermission record);

    BhPermission selectByPrimaryKey(Integer prmissionId);

    int updateByPrimaryKeySelective(BhPermission record);

    int updateByPrimaryKey(BhPermission record);

    /**
     * 查询权限以及绑定的角色
     * @param roleId
     * @return
     */
    List<BhPermission> selectPermissionRelevancyRole(Integer roleId);
}