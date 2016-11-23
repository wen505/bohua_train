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
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Arrays;
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

    private static final String ADD_OPERATE = "add";

    private static final String UPDATE_OPERATE = "update";
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
    @CacheEvict(value = "bohua",allEntries=true)
    public int addDictionaryHeader(BhDictionaryHeader bhDictionaryHeader) {
        return bhDictionaryHeaderMapper.insertSelective(bhDictionaryHeader);
    }

    @Override
    @CacheEvict(value = "bohua",allEntries=true)
    public int updateDictionaryHeader(BhDictionaryHeader bhDictionaryHeader) {
        return bhDictionaryHeaderMapper.updateByPrimaryKeySelective(bhDictionaryHeader);
    }

    @Override
    @CacheEvict(value = "bohua",allEntries=true)
    public int deleteDictionaryHeaders(List<String> headerCodes){
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("updateTime", new Date());
        map.put("flag", Constant.UN_ENABLE_FLAG);
        map.put("headerCodes", headerCodes);
        int res = bhDictionaryHeaderMapper.deleteDictionarys(map);
        if (res != headerCodes.size()) {
            throw new BusinessException("删除字典配置异常", Constant.BUSSINESS_ERROR_CODE);
        }else {
            try {
                res = bhDictionaryLineMapper.deleteDictionaryLines(map);
                res = 1;
            } catch (Exception e) {
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
    @Cacheable(value="bohua", key="#headerCode")
    public List<BhDictionaryLine> queryDetailByHeaderCode(String headerCode) {
        return bhDictionaryLineMapper.selectByHeaderCode(headerCode);
    }

    @CacheEvict(value = "bohua",allEntries=true)
    public int saveOrUpdate(BhDictionaryLine bhDictionaryLine, String operateId) {
        BhDictionaryLine dictionaryLine = bhDictionaryLineMapper.selectByLine(bhDictionaryLine);
        List<BhDictionaryLine> bhDictionaryLineList = queryDetailByHeaderCode(bhDictionaryLine.getHeaderCode());
        int res = 0;
        if (ADD_OPERATE.equals(operateId) && dictionaryLine != null) {
            throw new BusinessException("操作失败,重复添加", Constant.BUSSINESS_ERROR_CODE);
        } else if (ADD_OPERATE.equals(operateId)) {
            res = bhDictionaryLineMapper.insertSelective(bhDictionaryLine);
        } else if (UPDATE_OPERATE.equals(operateId)) {
            if (dictionaryLine != null && !bhDictionaryLine.getLineId().equals(dictionaryLine.getLineId())) {
                throw new BusinessException("操作失败,修改数据有误", Constant.BUSSINESS_ERROR_CODE);
            } else {
                res = bhDictionaryLineMapper.updateByPrimaryKeySelective(bhDictionaryLine);
            }
        }
        return res;
    }

    @CacheEvict(value = "bohua",allEntries=true)
    public int deleteDictionaryDetail(String[] lineIds) {
        List<String> lineIdList = Arrays.asList(lineIds);
        int res = bhDictionaryLineMapper.deleteDictionaryDetail(lineIdList);
        if(res <= 0){
            throw new BusinessException("删除行配置异常", Constant.BUSSINESS_ERROR_CODE);
        }
        return res;
    }

    @Override
    @Cacheable(value="bohua", key="#root.methodName")
    public List<BhDictionaryHeader> findAllDictionaryHeader() {
        return bhDictionaryHeaderMapper.selectAll();
    }

    @Override
    @Cacheable(value="bohua", key="#root.methodName")
    public List<BhDictionaryLine> findAllDictionaryDetail() {
        return bhDictionaryLineMapper.selectAll();
    }
}
