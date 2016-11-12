package com.bh.train.dao;

import com.bh.train.model.BhDictionaryLine;

import java.util.List;
import java.util.Map;

public interface BhDictionaryLineMapper {
    int deleteByPrimaryKey(Integer lineId);

    int insert(BhDictionaryLine record);

    int insertSelective(BhDictionaryLine record);

    BhDictionaryLine selectByPrimaryKey(Integer lineId);

    int updateByPrimaryKeySelective(BhDictionaryLine record);

    int updateByPrimaryKey(BhDictionaryLine record);

    int deleteDictionaryLines(Map map);

    List<BhDictionaryLine> selectByHeaderCode(String headerCode);

    BhDictionaryLine selectByLine(BhDictionaryLine record);

    int deleteDictionaryDetail(List<String> lineIdList);

    List<BhDictionaryLine> selectAll();
}