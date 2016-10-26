package com.bh.train.controller;

import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.util.PageController;
import com.bh.train.common.vo.RspData;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bh.train.model.BhDictionaryHeader;
import com.bh.train.model.BhUser;
import com.bh.train.service.DictionaryService;
import com.bh.train.vo.SelectVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/back/dictionary")
public class DictionaryController extends BaseController<DictionaryController> {

    @Resource
    private DictionaryService dictionaryService;

//    @RequestMapping("/find")
//    @ResponseBody
//    public RspData find(BhDictionaryHeader bhDictionaryHeader) {
//        RspData rspData = new RspData();
//        try {
//            PageController<BhDictionaryHeader> controller = dictionaryService.find(bhDictionaryHeader, getPage(), getRows());
//            rspData = RspData.success(controller);
//        } catch (BusinessException e) {
//            logger.error(e.getMessage(), e);
//            rspData.setCode(Constant.BUSSINESS_ERROR_CODE);
//            rspData.setMsg(e.getMessage());
//        }
//        return rspData;
//    }
    @RequestMapping("/find")
    @ResponseBody
    public PageController<BhDictionaryHeader> find(BhDictionaryHeader bhDictionaryHeader) {
        try {
            PageController<BhDictionaryHeader> controller = dictionaryService.find(bhDictionaryHeader, getPage(), getRows());
            return controller;
        } catch (BusinessException e) {
            logger.error(e.getMessage(), e);
            return new PageController<BhDictionaryHeader>();
        }
    }

    @RequestMapping("/initPage")
    @ResponseBody
    public RspData initPage() {
        RspData rspData = new RspData();
        List<SelectVo> result = new ArrayList<SelectVo>();
        SelectVo selectVo = new SelectVo();
        selectVo.setId("user");
        selectVo.setText("自定义");
        result.add(selectVo);
        selectVo.setId("system");
        selectVo.setText("系统");
        result.add(selectVo);
        Map<String, List> map = new HashMap<String, List>();
        map.put("dictionaryType", result);
        return RspData.success(map);
    }
}