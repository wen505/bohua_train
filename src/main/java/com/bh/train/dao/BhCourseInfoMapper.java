package com.bh.train.dao;

import com.bh.train.model.BhCourseInfo;
import java.util.List;
import java.util.Map;

public interface BhCourseInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BhCourseInfo record);

    int insertSelective(BhCourseInfo record);

    BhCourseInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BhCourseInfo record);

    int updateByPrimaryKey(BhCourseInfo record);
    /**
     * 模糊查询用户信息 分页查询
     * @param record
     * @return
     */
    List<BhCourseInfo> selectPage(BhCourseInfo record);

    /**
     * 据模糊条件查询出总记录数
     * @param record
     * @return
     */
    int selectCount(BhCourseInfo record);

    /**
     * 根据ID删除课程信息
     * @param map
     * @return
     */
    int deleteCourseInfos(Map<String, Object> map);
}