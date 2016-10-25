package com.bh.train.controller;

import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.util.PageController;
import com.bh.train.model.BhCourseInfo;
import com.bh.train.service.CourseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

}