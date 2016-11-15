package com.bh.train.dao;

import com.bh.train.model.BhNotice;
import com.bh.train.model.BhRecruit;
import com.bh.train.model.BhRecruitWithBLOBs;

import java.util.List;

public interface BhRecruitMapper {
    int deleteByPrimaryKey(Integer recruitId);

    int insert(BhRecruitWithBLOBs record);

    int insertSelective(BhRecruitWithBLOBs record);

    BhRecruitWithBLOBs selectByPrimaryKey(Integer recruitId);

    int updateByPrimaryKeySelective(BhRecruitWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(BhRecruitWithBLOBs record);

    int updateByPrimaryKey(BhRecruit record);
    /**
     * 分页查询
     * @param record
     * @return
     */
    List<BhRecruit> selectPage(BhRecruit record);

    /**
     * 查询记录数
     * @param record
     * @return
     */
    int selectCount(BhRecruit record);

    /**
     * 批量修改可用状态
     * @param list
     * @return
     */
    int updatbatchRecruitEnabledFlag(List list);

    /**
     * 查询不分页
     * @param record
     * @return
     */
    List<BhRecruitWithBLOBs> selectSome(BhRecruit record);

}