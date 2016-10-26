package com.bh.train.controller;

import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.common.vo.RspData;
import com.bh.train.model.BhRole;
import com.bh.train.model.BhRolePermission;
import com.bh.train.model.BhUser;
import com.bh.train.model.BhUserRole;
import com.bh.train.service.RoleSerice;
import com.bh.train.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
 * 角色控制层
 * Created by lp on 2016/10/24.
 */
@Controller
@RequestMapping("/back/role")
public class RoleController extends BaseController<RoleController> {
    @Resource
    private RoleSerice roleSerice;
    @Resource
    private UserService userService;
    /**
     * 分页查询
     * @param bhRole
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public PageController<BhRole> find(BhRole bhRole){
        try {
            PageController<BhRole> controller = roleSerice.find(bhRole, getPage(), getRows());
            return  controller;
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return new  PageController<BhRole>();
        }
    }
    /**
     * 删除角色
     * @param bhRoles
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public RspData delete(@RequestBody List<BhRole> bhRoles){
        try {
            boolean delete = roleSerice.delete(bhRoles);
            return  RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "删除失败！");
        }
    }

    /**
     * 添加角色
     * @param bhRole
     * @return
     */
    @RequestMapping("/insert")
    @ResponseBody
    public RspData insert(BhRole bhRole){
        try {
            boolean flag = roleSerice.insert(bhRole);
            return  RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "添加失败！");
        }
    }

    /**
     * 修改角色信息
     * @param bhRole
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public RspData  update(BhRole bhRole){
        try {
            boolean flag = roleSerice.update(bhRole);
            return  RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }
    /**
     * 查询不属于该角色下的用户
     * @param bhUser

     * @return
     */
    @RequestMapping("/findNotUserByRoleId")
    @ResponseBody
    public  PageController<BhUser> findNotUserByRoleId(BhUser bhUser){
        try {
            PageController<BhUser> controller = roleSerice.findNotUserByRoleId(bhUser, getPage(), getRows());
            return  controller;
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return new  PageController<BhUser>();
        }
    }
    /**
     * 查询在角色下的用户
     *
     * @param bhUser
     * @return
     */
    @RequestMapping("/findUserByRoleId")
    @ResponseBody
    public  PageController<BhUser> findUserByRoleId(BhUser bhUser) {
        try {
            PageController<BhUser> page = userService.find(bhUser,
                    getPage(), getRows());
            return page;
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return new  PageController<BhUser>();
        }
    }
    /**
     * 批量删除 用户角色关系表
     * @param roleId
     * @param userIds
     * @return
     */
    @RequestMapping("/deleteRoleAndUserId")
    @ResponseBody
    public RspData deleteRoleAndUserId(String roleId,String userIds){
        try {
            boolean flag = roleSerice.deleteRoleAndUserID(roleId,userIds);
            return  RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }
    /**
     * 批量添加 用户角色关系表
     * @param bhUserRoles
     * @return
     */
    @RequestMapping("/insertRoleAndUserId")
    @ResponseBody
    public RspData insertRoleAndUserId(@RequestBody  List<BhUserRole> bhUserRoles){
        try {
            boolean flag = roleSerice.insertRoleAndUserID(bhUserRoles);
            return  RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }
    /**
     * 修改角色权限
     *
     * @param list
     * @return
     */
    @RequestMapping("/updateRolePermission")
    @ResponseBody
    public RspData updateRolePermission(@RequestBody  List<BhRolePermission> list, String roleId){
        try {
            if (!StringUtils.isEmpty(roleId)){
                Integer roid= Integer.parseInt(roleId);
                boolean falg = roleSerice.updateRolePermission(list,roid);
                return  RspData.issuccess(falg);
            }
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
        return RspData.error(Constant.ERROR_CODE, "修改失败！");
    }

    /**
     * 查询角色权限 以及不属于该角色的权限
     *
     * @param roleId
     * @return
     */
    @RequestMapping("/findRolePermission")
    @ResponseBody
    public RspData findRolePermission(String roleId){
        try {
            List<CheckTreeNode> checkTreeNodes = roleSerice.findRolePermission(roleId);
            return  RspData.success(checkTreeNodes);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "加载失败。。！");
        }
    }

}
