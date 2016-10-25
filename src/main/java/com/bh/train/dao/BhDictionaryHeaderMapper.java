package com.bh.train.dao;

import com.bh.train.model.BhDictionaryHeader;

public interface BhDictionaryHeaderMapper {
    int deleteByPrimaryKey(String headerCode);

    int insert(BhDictionaryHeader record);

    int insertSelective(BhDictionaryHeader record);

    BhDictionaryHeader selectByPrimaryKey(String headerCode);

    int updateByPrimaryKeySelective(BhDictionaryHeader record);

    int updateByPrimaryKey(BhDictionaryHeader record);
}