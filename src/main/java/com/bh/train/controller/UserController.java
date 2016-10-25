package com.bh.train.controller;

import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.common.vo.RspData;
import com.bh.train.model.BhUser;
import com.bh.train.model.BhUserRole;
import com.bh.train.service.UserService;
import com.bh.train.vo.LoginReqVo;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;


/**
 * 用户管理
 * Created by lp on 2016/10/23.
 */
@Controller
@RequestMapping("/back/user")
public class UserController extends BaseController<UserController> {
    @Resource
    private UserService userService;
    /**
     * 条件查询
     * @param bhUser
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public PageController<BhUser> find (BhUser bhUser){
        try {
            PageController<BhUser> controller = userService.find(bhUser, getPage(), getRows());
            return  controller;
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return new  PageController<BhUser>();
        }
    }

    /**
     * 删除用户
     * @param loginReqVos
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public RspData delete(@RequestBody List<LoginReqVo> loginReqVos){
        try {
            boolean delete = userService.delete(loginReqVos);
            return  RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "删除失败！");
        }
    }

    /**
     * 添加用户
     * @param bhUser
     * @return
     */
    @RequestMapping("/insert")
    @ResponseBody
    public RspData insert(BhUser bhUser){
        try {
            boolean delete = userService.insert(bhUser);
            System.out.println(delete);
            return  RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "添加失败！");
        }
    }

    /**
     * 修改用户信息
     * @param bhUser
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public RspData  update(BhUser bhUser){
        try {
            boolean delete = userService.update(bhUser);
            return  RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }

    /**
     * 验证用户信息
     * @param loginName
     * @return
     */
    @RequestMapping("/isLoginName")
    @ResponseBody
    public RspData isLoginName(String loginName){
        try {
            boolean delete = userService.isLoginName(loginName);
            return  RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "验证失败！");
        }
    }
    /**
     * 根据用户id  查询权限
     * @param userId
     * @return
     */
    @RequestMapping("/getUserRole")
    @ResponseBody
    public RspData getUserRole(String userId){
        try {
            List<CheckTreeNode> userRole = userService.getUserRole(userId);
            return  RspData.success(userRole);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "查询失败！");
        }
    }

    /**
     * 修改用户角色
     * @param bhUserRoles
     * @return
     */
    @RequestMapping("/updateUserRole")
    @ResponseBody
    public RspData updateUserRole(@RequestBody  List<BhUserRole> bhUserRoles , String userId){
        try {
            if (!StringUtils.isEmpty(userId)){
                Integer usid= Integer.parseInt(userId);
                boolean falg = userService.updateUserRole(bhUserRoles,usid);
                return  RspData.issuccess(falg);
            }
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }

    /**
     * 根据修改用户密码
     * @param loginReqVo
     * @return
     */
    @RequestMapping("/updateUserPassword")
    @ResponseBody
    public RspData  updateUserPassword(LoginReqVo loginReqVo){
        try {
            boolean falg = userService.updateUserPassword(loginReqVo);
            return  RspData.issuccess(falg);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }
    /**
     * 重置用户密码
     * @param loginReqVo
     * @return
     */
    @RequestMapping("/resetPwd")
    @ResponseBody
    public RspData  resetPwd(LoginReqVo loginReqVo){
        try {
            loginReqVo.setNewPassword(loginReqVo.getUserName());
            boolean falg = userService.updateUserPassword(loginReqVo);
            return  RspData.issuccess(falg);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(),e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }
}
