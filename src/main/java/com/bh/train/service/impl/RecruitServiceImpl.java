package com.bh.train.service.impl;

import com.bh.train.common.service.BaseService;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhRecruitMapper;
import com.bh.train.model.BhRecruit;
import com.bh.train.model.BhRecruitWithBLOBs;
import com.bh.train.service.RecruitService;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * Created by lp on 2016/11/6.
 */
@Service("recruitService")
public class RecruitServiceImpl extends BaseService implements RecruitService {

    @Resource
    private BhRecruitMapper bhRecruitMapper;
    @Override
    public PageController<BhRecruit> find(BhRecruit bhRecruit, String page, String rows) {
        if(null==bhRecruit){
            bhRecruit = new BhRecruit();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhRecruit.setLimit(pageNumber[1]);
        bhRecruit.setStart(pageNumber[0]);
        List<BhRecruit> bhRecruits = bhRecruitMapper.selectPage(bhRecruit);
        int totalCount = bhRecruitMapper.selectCount(bhRecruit);
        PageController<BhRecruit> controller  =new PageController<BhRecruit>(bhRecruits, totalCount);
        return  controller;
    }

    @Override
    public BhRecruitWithBLOBs getById(String recruitId) {
        if (!StringUtils.isEmpty(recruitId)){
            Integer id = Integer.parseInt(recruitId);
            return bhRecruitMapper.selectByPrimaryKey(id);
        }
        return null;
    }

    @Override
    public boolean delete(List<BhRecruit> bhRecruits) {
        int count = bhRecruitMapper.updatbatchRecruitEnabledFlag(bhRecruits);
        return returnResult(count);
    }

    @Override
    public boolean insert(BhRecruitWithBLOBs bhRecruit) {
        bhRecruit.setEnabledFlag("Y");
        bhRecruit.setReleaseTime(new Date());
        int count = bhRecruitMapper.insert(bhRecruit);
        return returnResult(count);
    }

    @Override
    public boolean update(BhRecruitWithBLOBs bhRecruit) {
        bhRecruit.setEnabledFlag("Y");
        bhRecruit.setUpdateTime(new Date());
        int count = bhRecruitMapper.updateByPrimaryKeySelective(bhRecruit);
        return returnResult(count);
    }

    @Override
    public List<BhRecruitWithBLOBs> selectSome(BhRecruit record) {
        return bhRecruitMapper.selectSome(record);
    }
}
