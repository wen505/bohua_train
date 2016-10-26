package com.bh.train.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;

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

    @RequestMapping("/add")
    @ResponseBody
    public RspData add(BhDictionaryHeader bhDictionaryHeader) {
        RspData rspData = null;
        bhDictionaryHeader.setAddTime(new Date());
        bhDictionaryHeader.setUpdateTime(new Date());
        int res = 0;
        try {
            res = dictionaryService.addDictionaryHeader(bhDictionaryHeader);
            if(res == 1){
                rspData = RspData.success(null);
            }else {
                logger.error("添加字典配置数据库异常！");
                rspData = RspData.error(Constant.BUSSINESS_ERROR_CODE, "添加字典配置数据库异常！");
            }
        } catch (Exception e) {
            logger.error("系统异常！",e);
            rspData = RspData.error(Constant.SYSTEM_ERROR_CODE, "系统异常！");
        }
        return rspData;
    }

    @RequestMapping("/checkHeaderCode")
    @ResponseBody
    public RspData checkHeaderCode(HttpServletRequest request,HttpServletResponse response) {
        RspData rspData = null;
        String headerCode = request.getParameter("headerCode");
        BhDictionaryHeader bhDictionaryHeader = null;
        try {
            bhDictionaryHeader = dictionaryService.checkHeaderCode(headerCode);
            if (bhDictionaryHeader == null) {
                rspData = RspData.success(null);
            }else {
                logger.error("该配置编码已存在！");
                rspData = RspData.error(Constant.BUSSINESS_ERROR_CODE, "该配置编码已存在！");
            }
        } catch (Exception e) {
            logger.error("系统异常！",e);
            rspData = RspData.error(Constant.SYSTEM_ERROR_CODE, "系统异常！");
        }
        return rspData;
    }

    @RequestMapping("/update")
    @ResponseBody
    public RspData update(BhDictionaryHeader bhDictionaryHeader) {
        RspData rspData = null;
        bhDictionaryHeader.setUpdateTime(new Date());
        int res = 0;
        try {
            res = dictionaryService.updateDictionaryHeader(bhDictionaryHeader);
            if(res == 1){
                rspData = RspData.success(null);
            }else {
                logger.error("修改字典配置数据库异常！");
                rspData = RspData.error(Constant.BUSSINESS_ERROR_CODE, "修改字典配置数据库异常！");
            }
        } catch (Exception e) {
            logger.error("系统异常！",e);
            rspData = RspData.error(Constant.SYSTEM_ERROR_CODE, "系统异常！");
        }
        return rspData;
    }

    @RequestMapping("/delete")
    @ResponseBody
    public RspData delete(HttpServletRequest request) {
        RspData rspData = null;
        List<String> headerCodes = new ArrayList<String>();
        try {
            String str = IOUtils.toString(request.getInputStream(), "utf-8");
            JSONArray ja = JSON.parseArray(str);
            ListIterator<Object> listIterator = ja.listIterator();
            while (listIterator.hasNext()) {
                JSONObject jo = (JSONObject) listIterator.next();
                headerCodes.add(jo.get("headerCode").toString());
            }
            int res = 0;
            res = dictionaryService.deleteDictionaryHeaders(headerCodes);
            if (res == 1) {
                rspData = RspData.success(null);
            } else {
                logger.error("删除字典配置数据库异常！");
                rspData = RspData.error(Constant.BUSSINESS_ERROR_CODE, "删除字典配置数据库异常！");
            }
        } catch (BusinessException e) {
            logger.error(e.getMessage(), e);
            rspData = RspData.error(Constant.BUSSINESS_ERROR_CODE, e.getMessage());
        } catch (IOException e) {
            logger.error("IO异常！", e);
            rspData = RspData.error(Constant.SYSTEM_ERROR_CODE, "IO异常！");
        } catch (Exception e) {
            logger.error("系统异常！", e);
            rspData = RspData.error(Constant.SYSTEM_ERROR_CODE, "系统异常！");
        }
        return rspData;
    }

}