package com.bh.train.service.impl;

import com.bh.train.common.service.BaseService;
import com.bh.train.common.util.PageController;
import com.bh.train.dao.BhCourseInfoMapper;
import com.bh.train.model.BhCourseInfo;
import com.bh.train.service.CourseService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by ruanhua on 2016/10/25.
 */
@Service("courseService")
public class CourseServiceImpl extends BaseService implements CourseService {

    @Resource
    private BhCourseInfoMapper bhCourseInfoMapper;

    @Override
    public PageController<BhCourseInfo> find(BhCourseInfo bhCourseInfo, String page, String rows) {
        if(null==bhCourseInfo){
            bhCourseInfo = new BhCourseInfo();
        }
        int[] pageNumber = super.pageNumber(page,rows);
        bhCourseInfo.setLimit(pageNumber[1]);
        bhCourseInfo.setStart(pageNumber[0]);
        List<BhCourseInfo> bhCourseInfoList = bhCourseInfoMapper.selectPage(bhCourseInfo);
        int totalCount = bhCourseInfoMapper.selectCount(bhCourseInfo);
        PageController<BhCourseInfo> controller  =new PageController<BhCourseInfo>(bhCourseInfoList, totalCount);
        return  controller;
    }


}
