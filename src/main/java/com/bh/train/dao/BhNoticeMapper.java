package com.bh.train.dao;

import com.bh.train.model.BhNotice;

import java.util.List;

public interface BhNoticeMapper {
    int deleteByPrimaryKey(Integer noticeId);

    int insert(BhNotice record);

    int insertSelective(BhNotice record);

    BhNotice selectByPrimaryKey(Integer noticeId);

    int updateByPrimaryKeySelective(BhNotice record);

    int updateByPrimaryKeyWithBLOBs(BhNotice record);

    int updateByPrimaryKey(BhNotice record);

    /**
     * 分页查询
     * @param record
     * @return
     */
    List<BhNotice> selectPage(BhNotice record);

    /**
     * 查询记录数
     * @param record
     * @return
     */
    int selectCount(BhNotice record);

    /**
     * 批量修改可用状态
     * @param list
     * @return
     */
    int updatbatchNoticeEnabledFlag(List list);
}