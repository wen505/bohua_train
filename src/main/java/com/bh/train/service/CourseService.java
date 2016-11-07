package com.bh.train.service;

import com.bh.train.common.util.PageController;
import com.bh.train.model.BhCourseInfo;

import java.util.List;

/**
 * Created by ruanhua on 2016/10/25.
 */
public interface CourseService {

    public PageController<BhCourseInfo> find(BhCourseInfo bhCourseInfo, String page, String rows);

    public int addBhCourseInfo(BhCourseInfo bhCourseInfo);

    public int updateBhCourseInfo(BhCourseInfo bhCourseInfo);

    public int deleteCourseInfos(List<String> ids);
}
