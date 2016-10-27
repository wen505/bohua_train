package com.bh.train.service;
import com.bh.train.common.tree.TreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.model.BhPermission;

import java.util.List;

/**权限服务类接口
 * Created by lp on 2016/10/26.
 */
public interface PermissionService {
    /**
     * 分页查询
     * @param bhPermission
     * @param page
     * @return
     */
    public PageController<BhPermission> find(BhPermission bhPermission , String page , String rows);
    /**
     * 删除权限信息
     * @param bhPermissions
     * @return
     */
    public  boolean delete(List<BhPermission> bhPermissions);

    /**
     * 添加权限信息
     * @param bhPermission
     * @return
     */
    public  boolean insert(BhPermission bhPermission);

    /**
     * 修改权限信息信息
     * @param bhPermission
     * @return
     */
    public boolean  update(BhPermission bhPermission);

    /**
     * 验证权限编码是否存在
     * @param permissionCode
     * @return
     */
    public boolean  isPermissionCode(String permissionCode);

    /**
     * 查询权限树
     *
     * @param bhPermission
     * @return
     */
    public List<TreeNode> selectPermissionTree(BhPermission bhPermission);
}
