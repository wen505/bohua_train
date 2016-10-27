package com.bh.train.controller;

import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.tree.TreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.common.vo.RspData;
import com.bh.train.dao.BhPermissionMapper;
import com.bh.train.model.BhPermission;
import com.bh.train.service.PermissionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by lp on 2016/10/26.
 */
@Controller
@RequestMapping("/back/permission")
public class PermissionController extends BaseController<PermissionController> {
    @Resource
    private PermissionService permissionService;

    /**
     * 分页查询
     * @param bhPermission
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public PageController<BhPermission> find(BhPermission bhPermission ){
        try {
            PageController<BhPermission> controller = permissionService.find(bhPermission, getPage(), getRows());
            return  controller;
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return new  PageController<BhPermission>();
        }
    }
    /**
     * 删除权限信息
     * @param bhPermissions
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public  RspData delete(@RequestBody  List<BhPermission> bhPermissions){
        try {
            boolean delete = permissionService.delete(bhPermissions);
            return  RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "删除失败！");
        }
    }

    /**
     * 添加权限信息
     * @param bhPermission
     * @return
     */
    @RequestMapping("/insert")
    @ResponseBody
    public  RspData insert(BhPermission bhPermission){
        try {
            boolean flag = permissionService.insert(bhPermission);
            return  RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "添加失败！");
        }
    }

    /**
     * 修改权限信息信息
     * @param bhPermission
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public  RspData  update(BhPermission bhPermission){
        try {
            boolean delete = permissionService.update(bhPermission);
            return  RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }

    /**
     * 验证权限编码是否存在
     * @param permissionCode
     * @return
     */
    @RequestMapping("/isPermissionCode")
    @ResponseBody
    public  RspData isPermissionCode(String permissionCode) {
        try {
            boolean flag =  permissionService.isPermissionCode(permissionCode);
            return  RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "验证失败！");
        }

    }

    /**
     * 查询权限树
     *
     * @param bhPermission
     * @return
     */
    @RequestMapping("/selectPermissionTree")
    @ResponseBody
    public RspData selectPermissionTree(BhPermission bhPermission){
        try {
            bhPermission.setPermissionType("menu");
            List<TreeNode> treeNodes = permissionService.selectPermissionTree(bhPermission);
            return  RspData.success(treeNodes);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "查询失败！");
        }
    }
}
