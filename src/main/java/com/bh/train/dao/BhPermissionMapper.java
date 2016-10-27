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
     * 根据多个父类id查询权限
     * @param list
     */
    List<BhPermission> selectPermissionByParentIDs(List list);
    /**
     * 查询权限以及绑定的角色
     * @param roleId
     * @return
     */
    List<BhPermission> selectPermissionRelevancyRole(Integer roleId);

    /**
     *查询权限记录数
     * @param bhPermission
     * @return
     */
    int selectPermissionCount(BhPermission bhPermission);

    /**
     *分页查询权限
     * @param bhPermission
     * @return
     */
    List<BhPermission> selectPagePermission(BhPermission bhPermission);

    /**
     *批量修改权限信息的可用状态
     * @param list
     * @return
     */
    int updatBatchPermissionEnabledFlag(List list);

    /**
     * 根据权限编码查询权限
     * @param permissionCode
     * @return
     */
    BhPermission selectPermissionBypermissionCode(String permissionCode);

    /**
     * 根据多个权限ID删除权限角色表
     * @param list
     * @return
     */
    int deleteRolePermissionByPermissionIds(List list);

    /**
     * 条件查询所有的权限  不分页
     * @param bhPermission
     * @return
     */
    List<BhPermission> selectAllPermission(BhPermission bhPermission);

}