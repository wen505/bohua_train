package com.bh.train.dao;

import com.bh.train.model.BhDictionaryLine;

public interface BhDictionaryLineMapper {
    int deleteByPrimaryKey(Integer lineId);

    int insert(BhDictionaryLine record);

    int insertSelective(BhDictionaryLine record);

    BhDictionaryLine selectByPrimaryKey(Integer lineId);

    int updateByPrimaryKeySelective(BhDictionaryLine record);

    int updateByPrimaryKey(BhDictionaryLine record);
}