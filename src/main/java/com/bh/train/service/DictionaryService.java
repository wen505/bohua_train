package com.bh.train.service;

import com.bh.train.common.util.PageController;
import com.bh.train.model.BhDictionaryHeader;
import com.bh.train.model.BhDictionaryLine;
import com.bh.train.model.BhUser;

import java.util.List;

/**
 * Created by zhuyy on 2016/10/25.
 */
public interface DictionaryService {

    public PageController<BhDictionaryHeader> find(BhDictionaryHeader bhDictionaryHeader, String page, String rows);

    public int addDictionaryHeader(BhDictionaryHeader bhDictionaryHeader);

    public BhDictionaryHeader checkHeaderCode(String headerCode);

    public int updateDictionaryHeader(BhDictionaryHeader bhDictionaryHeader);

    public int deleteDictionaryHeaders(List<String> headerCodes);

    public List<BhDictionaryLine> queryDetailByHeaderCode(String headerCode);

    public int saveOrUpdate(BhDictionaryLine bhDictionaryLine, String operateId);

    /**
     * 批量删除字典行表
     * @param lineIds
     * @return
     */
    public int deleteDictionaryDetail(String[] lineIds);

    public List<BhDictionaryHeader> findAllDictionaryHeader();

    public List<BhDictionaryLine> findAllDictionaryDetail();
}
