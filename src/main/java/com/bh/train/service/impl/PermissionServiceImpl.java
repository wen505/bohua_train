package com.bh.train.service.impl;


import com.bh.train.common.service.BaseService;
import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.tree.TreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhPermissionMapper;
import com.bh.train.model.BhPermission;
import com.bh.train.service.PermissionService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**权限服务类
 * Created by lp on 2016/10/26.
 */
@Service("permissionService")
public class PermissionServiceImpl extends BaseService implements PermissionService {

    @Resource
    private BhPermissionMapper bhPermissionMapper;
    @Override
    public PageController<BhPermission> find(BhPermission bhPermission, String page, String rows) {
        if(null==bhPermission){
            bhPermission = new BhPermission();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhPermission.setLimit(pageNumber[1]);
        bhPermission.setStart(pageNumber[0]);
        List<BhPermission> bhPermissions = bhPermissionMapper.selectPagePermission(bhPermission);
        int totalCount = bhPermissionMapper.selectPermissionCount(bhPermission);
        PageController<BhPermission> controller  =new PageController<BhPermission>(bhPermissions, totalCount);
        return  controller;
    }

    @Override
    public boolean delete(List<BhPermission> bhPermissions) {
        List<BhPermission> permissions = bhPermissionMapper.selectPermissionByParentIDs(bhPermissions);
        if(null!=permissions&&!permissions.isEmpty()){
            return false;
        }
        bhPermissionMapper.deleteRolePermissionByPermissionIds(bhPermissions);
        int count = bhPermissionMapper.updatBatchPermissionEnabledFlag(bhPermissions);
        return returnResult(count);
    }

    @Override
    public boolean insert(BhPermission bhPermission) {
        bhPermission.setEnabledFlag("Y");
        bhPermission.setAddTime(new Date());
        int count = bhPermissionMapper.insert(bhPermission);
        return returnResult(count);
    }

    @Override
    public boolean isPermissionCode(String permissionCode) {
        BhPermission permission = bhPermissionMapper.selectPermissionBypermissionCode(permissionCode);
        if (null==permission){
            return  true;
        }
        return false;
    }

    @Override
    public boolean update(BhPermission bhPermission) {
        bhPermission.setEnabledFlag("Y");
        bhPermission.setUpdateTime(new Date());
        int count = bhPermissionMapper.updateByPrimaryKey(bhPermission);
        return returnResult(count);
    }

    @Override
    public List<TreeNode> selectPermissionTree(BhPermission bhPermission) {
        List<BhPermission> bhPermissions = bhPermissionMapper.selectAllPermission(bhPermission);
        List<TreeNode> treeNodes = new ArrayList<TreeNode>();
        TreeNode root = new TreeNode("0",null,"权限管理",null);
        treeNodes.add(root);
        for (BhPermission permission:bhPermissions) {
            TreeNode treeNode = new TreeNode(permission.getPermissionId()+"",permission.getParentId()+"",permission.getPermissionName(),permission);
            treeNodes.add(treeNode);
        }
        return treeNodes;
    }
}
