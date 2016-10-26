package com.bh.train.service.impl;

import com.bh.train.common.service.BaseService;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhDictionaryHeaderMapper;
import com.bh.train.model.BhDictionaryHeader;
import com.bh.train.service.DictionaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by zhuyy on 2016/10/25.
 */
@Service("dictionaryService")
public class DictionaryServiceImpl extends BaseService implements DictionaryService {

    @Resource
    private BhDictionaryHeaderMapper bhDictionaryHeaderMapper;

    @Override
    public PageController<BhDictionaryHeader> find(BhDictionaryHeader bhDictionaryHeader, String page, String rows) {
        if(null==bhDictionaryHeader){
            bhDictionaryHeader = new BhDictionaryHeader();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhDictionaryHeader.setLimit(pageNumber[1]);
        bhDictionaryHeader.setStart(pageNumber[0]);
        List<BhDictionaryHeader> bhDictionaryHeaderList = bhDictionaryHeaderMapper.selectPage(bhDictionaryHeader);
        int totalCount = bhDictionaryHeaderMapper.selectCount(bhDictionaryHeader);
        PageController<BhDictionaryHeader> controller  =new PageController<BhDictionaryHeader>(bhDictionaryHeaderList, totalCount);
        return  controller;
    }
}
