package com.bh.train.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.util.PageController;
import com.bh.train.common.vo.RspData;
import com.bh.train.model.BhCourseInfo;
import com.bh.train.service.CourseService;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;

/**
 * 课程管理
 * Created by ruanhua on 2016/10/25.
 */
@Controller
@RequestMapping("/back/course")
public class CourseController extends BaseController<CourseController> {

    @Resource
    private CourseService courseService;

    /**
     * 条件查询
     * @param bhCourseInfo
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public PageController<BhCourseInfo> find(BhCourseInfo bhCourseInfo) {
        try {
            PageController<BhCourseInfo> controller = courseService.find(bhCourseInfo, getPage(), getRows());
            return controller;
        } catch (BusinessException e) {
            logger.error(e.getMessage(), e);
            return new PageController<BhCourseInfo>();
        }
    }

    /**
     * 添加字典配置大类
     * @param bhCourseInfo
     * @return
     */
    @RequestMapping("/add")
    @ResponseBody
    public RspData add(BhCourseInfo bhCourseInfo) {
        RspData rspData = null;
        bhCourseInfo.setAddTime(new Date());
        bhCourseInfo.setUpdateTime(new Date());
        int res = 0;
        try {
            res = courseService.addBhCourseInfo(bhCourseInfo);
            if(res == 1){
                rspData = RspData.success(null);
            }else {
                logger.error("添加课程信息数据库异常！");
                rspData = RspData.error(Constant.BUSSINESS_ERROR_CODE, "添加课程信息异常！");
            }
        } catch (Exception e) {
            logger.error("系统异常！",e);
            rspData = RspData.error(Constant.SYSTEM_ERROR_CODE, "系统异常！");
        }
        return rspData;
    }

    /**
     * 添加字典配置大类
     * @param bhCourseInfo
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public RspData update(BhCourseInfo bhCourseInfo) {
        RspData rspData = null;
        bhCourseInfo.setUpdateTime(new Date());
        int res = 0;
        try {
            res = courseService.updateBhCourseInfo(bhCourseInfo);
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
        List<String> ids = new ArrayList<String>();
        try {
            String str = IOUtils.toString(request.getInputStream(), "utf-8");
            JSONArray ja = JSON.parseArray(str);
            ListIterator<Object> listIterator = ja.listIterator();
            while (listIterator.hasNext()) {
                JSONObject jo = (JSONObject) listIterator.next();
                ids.add(jo.get("id").toString());
            }
            int res = 0;
            res = courseService.deleteCourseInfos(ids);
            if (res == 1) {
                rspData = RspData.success(null);
            } else {
                logger.error("删除课程配置数据库异常！");
                rspData = RspData.error(Constant.BUSSINESS_ERROR_CODE, "删除课程配置数据库异常！");
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

