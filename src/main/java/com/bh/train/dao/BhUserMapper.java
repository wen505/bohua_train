package com.bh.train.dao;

import com.bh.train.model.BhUser;
import com.bh.train.vo.LoginReqVo;
import java.lang.String;
import java.util.List;

public interface BhUserMapper {
    int deleteByPrimaryKey(Integer userId);

    int insert(BhUser record);

    int insertSelective(BhUser record);

    BhUser selectByPrimaryKey(Integer userId);

    int updateByPrimaryKeySelective(BhUser record);

    int updateByPrimaryKey(BhUser record);

    /**
     * 登陆
     * @param loginReqVo
     * @return
     */
    BhUser selectForLogin(LoginReqVo loginReqVo);

    /**
     * 修改用户密码
     * @param loginReqVo
     * @return
     */
    int updateUserPassword(LoginReqVo loginReqVo);

    /**
     * 根据登录名修改用户密码
     * @param loginReqVo
     * @return
     */
    int updateUserPasswordByLoginName(LoginReqVo loginReqVo);

    /**
     * 模糊查询用户信息 分页查询
     * @param bhUser
     * @return
     */
    List<BhUser> selectPage(BhUser bhUser);

    /**
     * 据模糊条件查询出总记录数
     * @param bhUser
     * @return
     */
    int selectCount(BhUser bhUser);

    /**
     *批量修改用户信息的可用状态
     * @param list
     * @return
     */
    int updatbatchUserEnabledFlag(List list);

    /**
     * 删除用户角色关联表
     * @param list
     * @return
     */
    int deleteBathUserRole(List list);

    /**
     * 根据登录名查询用户
     * @param loginName
     * @return
     */
    BhUser selectUserByLoginName(String loginName);

    /**
     *  根据用户id删除用户角色关联表
     * @param userId
     * @return
     */
    int deleteUserRoleByUserId(Integer userId);

    /**
     *
     * 批量添加用户与角色关联的表中的数据
     * @param list
     * @return
     */
    int insertBatchUserRole(List list);

    /**
     *查询不在制定角色下的用户
     * @param bhUser
     * @return
     */
    List<BhUser> findNotUserByRoleId(BhUser bhUser);

    /**
     * 查询不在制定角色下的用户记录数
     * @param bhUser
     * @return
     */
    int findNotUserCountByRoleId(BhUser bhUser);
}