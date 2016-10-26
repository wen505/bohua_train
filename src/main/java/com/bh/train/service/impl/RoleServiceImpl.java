package com.bh.train.service.impl;

import com.bh.train.common.service.BaseService;
import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhPermissionMapper;
import com.bh.train.dao.BhRoleMapper;
import com.bh.train.dao.BhUserMapper;
import com.bh.train.model.*;
import com.bh.train.service.RoleSerice;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * 角色服务类
 * Created by lp on 2016/10/24.
 */
@Service("roleService")
public class RoleServiceImpl extends BaseService implements RoleSerice{
    @Resource
    private BhRoleMapper bhRoleMapper;
    @Resource
    private BhUserMapper bhUserMapper;
    @Resource
    private BhPermissionMapper bhPermissionMapper;
    @Override
    public PageController<BhRole> find(BhRole bhRole, String page, String rows) {
        if(null==bhRole){
            bhRole = new BhRole();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhRole.setLimit(pageNumber[1]);
        bhRole.setStart(pageNumber[0]);
        List<BhRole> bhUsers = bhRoleMapper.selectPage(bhRole);
        int totalCount = bhRoleMapper.selectCount(bhRole);
        PageController<BhRole> controller  =new PageController<BhRole>(bhUsers, totalCount);
        return  controller;
    }

    @Override
    public boolean delete(List<BhRole> bhRoles) {
        bhRoleMapper.deleteBatchUserRole(bhRoles);
        bhRoleMapper.deleteBathUserPermission(bhRoles);
        int flag = bhRoleMapper.updatbatchRoleEnabledFlag(bhRoles);
        return returnResult(flag);
    }

    @Override
    public boolean insert(BhRole bhRole) {
        bhRole.setAddTime(new Date());
        bhRole.setEnabledFlag("Y");
        int key = bhRoleMapper.insert(bhRole);
        return returnResult(key);
    }

    @Override
    public boolean update(BhRole bhRole) {
        bhRole.setUpdateTime(new Date());
        bhRole.setEnabledFlag("Y");
        int key = bhRoleMapper.updateByPrimaryKey(bhRole);
        return returnResult(key);
    }

    @Override
    public boolean deleteRoleAndUserID(String roleId, String userIds) {
        if (!StringUtils.isEmpty(roleId)) {
            Integer roId = Integer.parseInt(roleId);
            BhRole bhRole = new BhRole();
            bhRole.setRoleId(roId);
            List<String> splitString = splitString(userIds);
            bhRole.setList(splitString);
            int count = bhRoleMapper.deleteBatchUserRoleByRoleId(bhRole);
            return returnResult(count);
        }
        return false;
    }

    @Override
    public boolean insertRoleAndUserID(List<BhUserRole> bhUserRoles) {
        int cout = bhUserMapper.insertBatchUserRole(bhUserRoles);
        return returnResult(cout);
    }

    @Override
    public PageController<BhUser> findNotUserByRoleId(BhUser bhUser, String page, String rows) {
        if(null==bhUser){
            bhUser = new BhUser();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhUser.setLimit(pageNumber[1]);
        bhUser.setStart(pageNumber[0]);
        List<BhUser> bhUsers = bhUserMapper.findNotUserByRoleId(bhUser);
        int totalCount = bhUserMapper.findNotUserCountByRoleId(bhUser);
        PageController<BhUser> controller  =new PageController<BhUser>(bhUsers, totalCount);
        return  controller;
    }

    @Override
    public boolean updateRolePermission(List<BhRolePermission> list,Integer roleId) {
        bhRoleMapper.deleteRolePermissionByRoleId(roleId);
        if (null!=list&&!list
                .isEmpty()){
            bhRoleMapper.insertBatchPermissionRole(list);
        }
        return returnResult(1);
    }

    @Override
    public List<CheckTreeNode> findRolePermission(String roleId) {
        List<CheckTreeNode> treelist = new ArrayList<CheckTreeNode>();
        if (!StringUtils.isEmpty(roleId)){
            Integer roId=Integer.parseInt(roleId);
            List<BhPermission> bhPermissions = bhPermissionMapper.selectPermissionRelevancyRole(roId);
            for (BhPermission bhPermission : bhPermissions) {
                if (StringUtils.isEmpty(bhPermission.getIsBindRole())){
                    CheckTreeNode check = new CheckTreeNode(bhPermission.getPrmissionId()+"", bhPermission.getParentId()+"" , bhPermission.getPermissionName(), false);
                    treelist.add(check);
                }else{
                    CheckTreeNode check = new CheckTreeNode(bhPermission.getPrmissionId()+"", bhPermission.getParentId()+"" , bhPermission.getPermissionName(), true);
                    treelist.add(check);
                }

            }
        }
        return treelist;
    }
}
