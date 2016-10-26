package com.bh.train.service.impl;

import com.bh.train.common.Constant;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.service.BaseService;
import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhRoleMapper;
import com.bh.train.dao.BhUserMapper;
import com.bh.train.model.BhRole;
import com.bh.train.model.BhUser;
import com.bh.train.model.BhUserRole;
import com.bh.train.service.UserService;
import com.bh.train.vo.LoginReqVo;
import java.lang.String;
import java.util.ArrayList;

import java.util.Date;
import java.util.List;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;

/**
 * Created by zhuyy on 2016/10/20.
 */
@Service("userService")
public class UserServiceImpl extends BaseService implements UserService{

    @Resource
    private BhUserMapper bhUserMapper;

    @Resource
    private BhRoleMapper  bhRoleMapper;

    @Override
    public BhUser login(LoginReqVo loginReqVo) {
        BhUser user = bhUserMapper.selectForLogin(loginReqVo);
        if (user == null) {
            throw new BusinessException("用户名或密码有误！", Constant.ERROR_CODE);
        }
        return user;
    }

    @Override
    public PageController<BhUser> find (BhUser bhUser, String page, String rows) {

        if(null==bhUser){
            bhUser = new BhUser();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhUser.setLimit(pageNumber[1]);
        bhUser.setStart(pageNumber[0]);
        List<BhUser> bhUserList = bhUserMapper.selectPage(bhUser);
        int totalCount = bhUserMapper.selectCount(bhUser);
        PageController<BhUser> controller  =new PageController<BhUser>(bhUserList, totalCount);
        return  controller;
    }

    @Override
    public boolean delete(List<LoginReqVo> loginReqVos) {
        bhUserMapper.deleteBathUserRole(loginReqVos);
        int count = bhUserMapper.updatbatchUserEnabledFlag(loginReqVos);
        return returnResult(count);
    }

    @Override
    public boolean insert(BhUser bhUser) {
        bhUser.setPassword(bhUser.getLoginName());
        bhUser.setEnabledFlag("Y");
        bhUser.setAddTime(new Date());
        int count = bhUserMapper.insert(bhUser);
        return returnResult(count);
    }

    @Override
    public boolean update(BhUser bhUser) {
        if (bhUser==null||null==bhUser.getUserId()){
            return  false;
        }
        bhUser.setEnabledFlag("Y");
        bhUser.setUpdateTime(new Date());
        int count = bhUserMapper.updateByPrimaryKey(bhUser);
        return returnResult(count);
    }

    @Override
    public boolean isLoginName(String loginName) {
        BhUser bhUser = bhUserMapper.selectUserByLoginName(loginName);
        if (null==bhUser){
            return  true;
        }
        return false;
    }

    @Override
    public List<CheckTreeNode> getUserRole(String userId) {
        List<CheckTreeNode> treelist = new ArrayList<CheckTreeNode>();
        if (!StringUtils.isEmpty(userId)){
            Integer usId=Integer.parseInt(userId);
            List<BhRole> bhRoles = bhRoleMapper.selectRoleRelevancyUserId(usId);
            for (BhRole bhRole : bhRoles) {
                if (StringUtils.isEmpty(bhRole.getIsBindUser())){
                    CheckTreeNode check = new CheckTreeNode(bhRole.getRoleId()+"", null , bhRole.getRoleName(), false);
                    treelist.add(check);
                }else{
                    CheckTreeNode check = new CheckTreeNode(bhRole.getRoleId()+"", null , bhRole.getRoleName(), true);
                    treelist.add(check);
                }

            }
        }

        return treelist;

    }

    @Override
    public boolean updateUserRole(List<BhUserRole> bhUserRoles, Integer userId) {
        bhUserMapper.deleteUserRoleByUserId(userId);
       if (null!=bhUserRoles&&!bhUserRoles
               .isEmpty()){
            bhUserMapper.insertBatchUserRole(bhUserRoles);
       }
        return returnResult(1);
    }

    @Override
    public boolean updateUserPassword(LoginReqVo loginReqVo) {
        if (null==loginReqVo){
            return false;
        }
        int count=0;
        if (loginReqVo.getUserId()!=null){
            count= bhUserMapper.updateUserPassword(loginReqVo);
        }else if (StringUtils.isEmpty(loginReqVo.getUserName())){
            count= bhUserMapper.updateUserPasswordByLoginName(loginReqVo);
        }
        return returnResult(count);
    }
}
