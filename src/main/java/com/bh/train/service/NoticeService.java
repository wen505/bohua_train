package com.bh.train.service;

import com.bh.train.common.util.PageController;
import com.bh.train.model.BhNotice;
import com.bh.train.model.BhNotice;

import java.util.List;

/**
 * 通知服务类接口
 * Created by lp on 2016/11/1.
 */
public interface NoticeService {
    /**
     * 分页查询
     * @param bhNotice
     * @param page
     * @return
     */
    public PageController<BhNotice> find(BhNotice bhNotice , String page , String rows);

    /**
     * 分页查询
     * @param bhNotice
     * @param page
     * @return
     */
    public List<BhNotice> findFirstPage(BhNotice bhNotice , String page , String rows);

    /**
     * 根据id查询
     * @param noticeId
     * @return
     */
    public BhNotice getById(String noticeId);
    /**
     * 删除公告信息
     * @param bhNotices
     * @return
     */
    public  boolean delete(List<BhNotice> bhNotices);

    /**
     * 添加公告信息
     * @param bhNotice
     * @return
     */
    public  boolean insert(BhNotice bhNotice);

    /**
     * 修改公告信息信息
     * @param bhNotice
     * @return
     */
    public boolean  update(BhNotice bhNotice);
}
