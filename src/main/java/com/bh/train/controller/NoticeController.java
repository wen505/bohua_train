package com.bh.train.controller;

import com.alibaba.fastjson.JSON;
import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.util.PageController;
import com.bh.train.common.util.ServiceUtil;
import com.bh.train.common.vo.RspData;
import com.bh.train.common.vo.RspUploadVo;
import com.bh.train.model.BhNotice;
import com.bh.train.model.BhRole;
import com.bh.train.model.BhUser;
import com.bh.train.service.FileOperateService;
import com.bh.train.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.util.List;

/**
 * 公告
 * Created by lp on 2016/11/1.
 */
@Controller
@RequestMapping("/back/notice")
public class NoticeController extends BaseController<NoticeController> {
    @Resource
    private NoticeService noticeService;
    @Resource
    private FileOperateService fileOperateService;

    /**
     * 分页查询
     *
     * @param bhNotice
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public PageController<BhNotice> find(BhNotice bhNotice) {
        try {
            PageController<BhNotice> controller = noticeService.find(bhNotice, getPage(), getRows());
            return controller;
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return new PageController<BhNotice>();
        }
    }

    /**
     * 删除公告信息
     *
     * @param bhNotices
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public RspData delete(@RequestBody List<BhNotice> bhNotices) {
        try {
            boolean delete = noticeService.delete(bhNotices);
            return RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "删除失败！");
        }
    }

    /**
     * 根据id 查询
     *
     * @param noticeId
     * @return
     */
    @RequestMapping("/getById")
    @ResponseBody
    public RspData getById(String noticeId) {
        try {
            if (StringUtils.isEmpty(noticeId)) {
                return RspData.error(Constant.ERROR_CODE, "查询失败！");
            }
            BhNotice bhNotice = noticeService.getById(noticeId);
            return RspData.success(bhNotice);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "查询失败！");
        }
    }
    /**
     * 添加公告信息
     *
     * @param bhNotice
     * @return
     */
    @RequestMapping("/insert.do")
    @ResponseBody
    public RspData insert( BhNotice bhNotice) {
        try {
            BhUser user = (BhUser) getSession().getAttribute(Constant.LOGIN_USER);
            if (null == user) {
                return RspData.error(Constant.ERROR_CODE, "请先登录！");
            }
            bhNotice.setReleaseUser(user.getLoginName());
            boolean flag = noticeService.insert(bhNotice);
            return RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "保存失败！");
        }
    }
    /**
     * 修改公告信息信息
     *
     * @param bhNotice
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public RspData update(BhNotice bhNotice) {
        try {
            BhUser user = (BhUser) getSession().getAttribute(Constant.LOGIN_USER);
            if (null == user) {
                return RspData.error(Constant.ERROR_CODE, "请先登录！");
            }
            bhNotice.setReleaseUser(user.getLoginName());
            if(!StringUtils.isEmpty(bhNotice.getImageUrl())){
                fileOperateService.deleteFile(getRealPath(),  bhNotice.getNextImageUrl(), Constant.NOTICE_PATH);
            }else{
                bhNotice.setImageUrl(bhNotice.getNextImageUrl());
            }
            boolean flag = noticeService.update(bhNotice);
            return RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }


}
