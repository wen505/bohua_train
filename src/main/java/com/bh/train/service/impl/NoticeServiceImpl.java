package com.bh.train.service.impl;

import com.bh.train.common.service.BaseService;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhNoticeMapper;
import com.bh.train.model.BhNotice;
import com.bh.train.service.NoticeService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by lp on 2016/11/1.
 */
@Service("noticeService")
public class NoticeServiceImpl extends BaseService implements NoticeService {
    @Resource
    private BhNoticeMapper bhNoticeMapper;

    @Override
    public BhNotice getById(String noticeId) {
        if (StringUtils.isEmpty(noticeId)){
            return null;
        }
        Integer id = Integer.parseInt(noticeId);
        return  bhNoticeMapper.selectByPrimaryKey(id);
    }

    @Override
    public PageController<BhNotice> find(BhNotice bhNotice, String page, String rows) {
        if(null==bhNotice){
            bhNotice = new BhNotice();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhNotice.setLimit(pageNumber[1]);
        bhNotice.setStart(pageNumber[0]);
        List<BhNotice> bhUsers = bhNoticeMapper.selectPage(bhNotice);
        int totalCount = bhNoticeMapper.selectCount(bhNotice);
        PageController<BhNotice> controller  =new PageController<BhNotice>(bhUsers, totalCount);
        return  controller;
    }

    @Override
    public boolean delete(List<BhNotice> bhNotices) {
        int count = bhNoticeMapper.updatbatchNoticeEnabledFlag(bhNotices);
        return returnResult(count);
    }

    @Override
    public boolean insert(BhNotice bhNotice) {
        bhNotice.setEnabledFlag("Y");
        bhNotice.setAddTime(new Date());
        int count = bhNoticeMapper.insert(bhNotice);
        return returnResult(count);
    }

    @Override
    public boolean update(BhNotice bhNotice) {
        bhNotice.setEnabledFlag("Y");
        bhNotice.setUpdateTime(new Date());
        int count = bhNoticeMapper.updateByPrimaryKeyWithBLOBs(bhNotice);
        return returnResult(count);
    }
}
