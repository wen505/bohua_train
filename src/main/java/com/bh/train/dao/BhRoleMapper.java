package com.bh.train.dao;

import com.bh.train.model.BhRole;

import java.util.List;

/**
 * 角色dao
 */
public interface BhRoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(BhRole record);

    int insertSelective(BhRole record);

    BhRole selectByPrimaryKey(Integer roleId);

    int updateByPrimaryKeySelective(BhRole record);

    int updateByPrimaryKey(BhRole record);

    /**
     * 查询角色 并关联用户
     * @param userId
     * @return
     */
    List<BhRole> selectRoleelevancyRUserId(Integer userId);
}