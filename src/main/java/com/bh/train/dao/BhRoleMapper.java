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
     * 查询角色 并关联角色
     * @param userId
     * @return
     */
    List<BhRole> selectRoleRelevancyUserId(Integer userId);

    /**
     * 模糊查询角色信息 分页查询
     * @param bhRole
     * @return
     */
    List<BhRole> selectPage(BhRole bhRole);

    /**
     * 据模糊条件查询出总记录数
     * @param bhRole
     * @return
     */
    int selectCount(BhRole bhRole);

    /**
     *批量修改角色信息的可用状态
     * @param list
     * @return
     */
    int updatbatchRoleEnabledFlag(List list);

    /**
     *删除角色权限关联表
     * @param list
     * @return
     */
   int deleteBathUserPermission(List list);

    /**
     * 删除用户角色关联表
     * @param list
     * @return
     */
   int deleteBatchUserRole(List list);

    /**
     *批量添加用户与角色关联的表中的数据
     * @param list
     * @return
     */
    int insertBatchPermissionRole(List list);

    /**
     * 根据用户id删除用户角色关联表
     * @param roleId
     * @return
     */
    int deleteRolePermissionByRoleId(Integer roleId);

    /**
     * 删除用户角色关联表
     * @param bhRole
     * @return
     */
    int deleteBatchUserRoleByRoleId(BhRole bhRole);

}