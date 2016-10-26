package com.bh.train.service;

import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.model.*;
import com.bh.train.model.BhRole;


import java.util.List;

/**liupeg
 * Created by lp on 2016/10/24.
 * 角色管理服务类
 */
public interface RoleSerice {
    /**
     * 分页查询
     * @param bhRole
     * @param page
     * @return
     */
    public PageController<BhRole> find(BhRole bhRole ,String page ,String rows);
    /**
     * 删除角色
     * @param bhRoles
     * @return
     */
    public  boolean delete(List<BhRole> bhRoles);

    /**
     * 添加角色
     * @param bhRole
     * @return
     */
    public  boolean insert(BhRole bhRole);

    /**
     * 修改角色信息
     * @param bhRole
     * @return
     */
    public boolean  update(BhRole bhRole);

    /**
     * 查询不属于该角色下的用户
     * @param bhUser
     * @param page
     * @param rows
     * @return
     */
    public  PageController<BhUser> findNotUserByRoleId(BhUser bhUser, String page, String rows);

    /**
     * 修改角色权限
     *
     * @param list
     * @return
     */
    public boolean updateRolePermission(List<BhRolePermission> list, Integer roleId);

    /**
     * 查询角色权限 以及不属于该角色的权限
     *
     * @param roleId
     * @return
     */
    public List<CheckTreeNode> findRolePermission(String roleId);

    /**
     * 批量删除 用户角色关系表
     * @param roleId
     * @param userIds
     * @return
     */
    public boolean deleteRoleAndUserID(String roleId,String userIds);
    /**
     * 批量添加 用户角色关系表
     * @param bhUserRoles
     * @return
     */
    public boolean insertRoleAndUserID(List<BhUserRole> bhUserRoles);
}
