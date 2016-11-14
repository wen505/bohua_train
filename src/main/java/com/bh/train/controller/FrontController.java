package com.bh.train.controller;

import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.vo.RspData;
import com.bh.train.model.BhNotice;
import com.bh.train.service.NoticeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * 前台请求
 * Created by lp on 2016/11/14.
 */
@Controller
@RequestMapping(value = "/front/index")
public class FrontController extends BaseController<FrontController>{
    @Resource
    private NoticeService noticeService;

    /**
     * 分页查询
     *
     * @return
     */
    @RequestMapping("/getNoticeInfo")
    public ModelAndView getNoticeInfo(String noticeId) {
        ModelAndView modelAndView = new ModelAndView();
        try {
            BhNotice bhNotice = noticeService.getById(noticeId);
            modelAndView.addObject("notice",bhNotice);
            modelAndView.addObject("addTime",new SimpleDateFormat("yyyy/MM/dd").format(bhNotice.getAddTime()));
            modelAndView.setViewName("/front/noticetemplate");
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            modelAndView.setViewName("/common/error");
        }
        return modelAndView;
    }
    /**
     * 分页查询
     *
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public RspData find() {
        try {
            List<BhNotice> controller = noticeService.findFirstPage(null, "1", "4");
            return RspData.success(controller);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error("");
        }
    }
}
