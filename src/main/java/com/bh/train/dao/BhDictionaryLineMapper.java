package com.bh.train.dao;

import com.bh.train.model.BhDictionaryLine;

import java.util.Map;

public interface BhDictionaryLineMapper {
    int deleteByPrimaryKey(Integer lineId);

    int insert(BhDictionaryLine record);

    int insertSelective(BhDictionaryLine record);

    BhDictionaryLine selectByPrimaryKey(Integer lineId);

    int updateByPrimaryKeySelective(BhDictionaryLine record);

    int updateByPrimaryKey(BhDictionaryLine record);

    int deleteDictionaryLines(Map<String, Object> map);
}