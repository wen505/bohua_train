package com.bh.train.service.impl;

import com.bh.train.common.Constant;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.service.BaseService;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhDictionaryHeaderMapper;
import com.bh.train.dao.BhDictionaryLineMapper;
import com.bh.train.model.BhDictionaryHeader;
import com.bh.train.model.BhDictionaryLine;
import com.bh.train.service.DictionaryService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by zhuyy on 2016/10/25.
 */
@Service("dictionaryService")
public class DictionaryServiceImpl extends BaseService implements DictionaryService {

    @Resource
    private BhDictionaryHeaderMapper bhDictionaryHeaderMapper;

    @Resource
    private BhDictionaryLineMapper bhDictionaryLineMapper;

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

    @Override
    public int addDictionaryHeader(BhDictionaryHeader bhDictionaryHeader) {
        return bhDictionaryHeaderMapper.insertSelective(bhDictionaryHeader);
    }

    @Override
    public int updateDictionaryHeader(BhDictionaryHeader bhDictionaryHeader) {
        return bhDictionaryHeaderMapper.updateByPrimaryKeySelective(bhDictionaryHeader);
    }

    @Override
    public int deleteDictionaryHeaders(List<String> headerCodes){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("updateTime", new Date());
        map.put("flag", Constant.UN_ENABLE_FLAG);
        map.put("headerCodes", headerCodes);
        int res = bhDictionaryHeaderMapper.deleteDictionarys(map);
        if (res != 1) {
            throw new BusinessException("删除字典配置异常", Constant.BUSSINESS_ERROR_CODE);
        }else {
            res = bhDictionaryLineMapper.deleteDictionaryLines(map);
            if (res != 1) {
                throw new BusinessException("删除字典配置异常", Constant.BUSSINESS_ERROR_CODE);
            }
        }
        return res;
    }

    @Override
    public BhDictionaryHeader checkHeaderCode(String headerCode) {
        BhDictionaryHeader bhDictionaryHeader = bhDictionaryHeaderMapper.selectByPrimaryKey(headerCode);
        return bhDictionaryHeader;
    }

    @Override
    public List<BhDictionaryLine> queryDetailByHeaderCode(String headerCode) {
        return bhDictionaryLineMapper.selectByHeaderCode(headerCode);
    }

    public int saveOrUpdate(BhDictionaryLine bhDictionaryLine) {
        BhDictionaryLine dictionaryLine = bhDictionaryLineMapper.selectByLine(bhDictionaryLine);
        int res = 0;
        if (dictionaryLine != null) {//更新
            bhDictionaryLine.setLineId(dictionaryLine.getLineId());
            res = bhDictionaryLineMapper.updateByPrimaryKeySelective(bhDictionaryLine);
        } else {//新增
            res = bhDictionaryLineMapper.insertSelective(bhDictionaryLine);
        }
        return res;
    }
}
