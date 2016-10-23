package com.bh.train.service;

import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.model.BhUser;
import com.bh.train.model.BhUserRole;
import com.bh.train.vo.LoginReqVo;
import java.lang.String;
import java.util.List;


/**
 * 用户服务类接口
 * Created by zhuyy on 2016/10/20.
 */
public interface UserService {
    /**
     * 登录
     * @param loginReqVo
     * @return
     */
    public BhUser login(LoginReqVo loginReqVo);

    /**
     * 条件查询
     * @param bhUser
     * @param page
     * @param rows
     * @return
     */
    public PageController<BhUser> find (BhUser bhUser, String page, String rows );

    /**
     * 删除用户
     * @param loginReqVos
     * @return
     */
    public  boolean delete(List<LoginReqVo> loginReqVos);

    /**
     * 添加用户
     * @param bhUser
     * @return
     */
    public  boolean insert(BhUser bhUser);

    /**
     * 修改用户信息
     * @param bhUser
     * @return
     */
    public boolean  update(BhUser bhUser);

    /**
     * 验证用户信息
     * @param loginName
     * @return
     */
    public boolean  isLoginName(String loginName);
    /**
     * 根据用户id  查询权限
     * @param userId
     * @return
     */
    public List<CheckTreeNode> getUserRole(String userId);

    /**
     * 修改用户角色
     * @param bhUserRoles
     * @return
     */
    public  boolean  updateUserRole(List<BhUserRole> bhUserRoles , Integer userId);

    /**
     * 根据修改用户密码
     * @param loginReqVo
     * @return
     */
    public boolean updateUserPassword(LoginReqVo loginReqVo);


}
