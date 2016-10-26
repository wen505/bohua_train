package com.bh.train.service;

import com.bh.train.common.util.PageController;
import com.bh.train.model.BhCourseInfo;

/**
 * Created by ruanhua on 2016/10/25.
 */
public interface CourseService {

    public PageController<BhCourseInfo> find(BhCourseInfo bhCourseInfo, String page, String rows);


}
