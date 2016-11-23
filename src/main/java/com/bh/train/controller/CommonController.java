package com.bh.train.controller;

import com.bh.train.common.controller.BaseController;
import com.bh.train.model.BhDictionaryLine;
import com.bh.train.service.CacheService;
import com.bh.train.service.DictionaryService;
import com.bh.train.vo.SelectVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhuyy on 2016/11/14.
 */
@Controller
@RequestMapping("/back/common")
public class CommonController extends BaseController<CommonController> {

    @Resource
    private CacheService cacheService;

    @Resource
    private DictionaryService dictionaryService;

    @RequestMapping("/getSelectData")
    @ResponseBody
    public List<SelectVo> getSelectData(String headerCode) {
        List<BhDictionaryLine> bhDictionaryLineList = (List<BhDictionaryLine>) cacheService.getCache(headerCode);
        if (bhDictionaryLineList == null) {
            bhDictionaryLineList = dictionaryService.queryDetailByHeaderCode(headerCode);
        }
        List<SelectVo> selectVoList = new ArrayList<SelectVo>();
        for (BhDictionaryLine bhDictionaryLine : bhDictionaryLineList) {
            SelectVo selectVo = new SelectVo();
            selectVo.setId(bhDictionaryLine.getLineCode());
            selectVo.setText(bhDictionaryLine.getLineName());
            selectVoList.add(selectVo);
        }
        return selectVoList;
    }
}
