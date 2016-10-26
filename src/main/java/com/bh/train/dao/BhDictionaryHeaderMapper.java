package com.bh.train.dao;

import com.bh.train.model.BhDictionaryHeader;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BhDictionaryHeaderMapper {
    int deleteByPrimaryKey(String headerCode);

    int insert(BhDictionaryHeader record);

    int insertSelective(BhDictionaryHeader record);

    BhDictionaryHeader selectByPrimaryKey(String headerCode);

    int updateByPrimaryKeySelective(BhDictionaryHeader record);

    int updateByPrimaryKey(BhDictionaryHeader record);

    /**
     * 模糊查询用户信息 分页查询
     * @param record
     * @return
     */
    List<BhDictionaryHeader> selectPage(BhDictionaryHeader record);

    /**
     * 据模糊条件查询出总记录数
     * @param record
     * @return
     */
    int selectCount(BhDictionaryHeader record);

    int deleteDictionarys(Map<String, Object> map);
}