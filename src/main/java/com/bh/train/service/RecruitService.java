package com.bh.train.service;

import com.bh.train.common.util.PageController;
import com.bh.train.model.BhRecruit;
import com.bh.train.model.BhRecruitWithBLOBs;

import java.util.List;

/**招聘接口
 * Created by lp on 2016/11/6.
 */
public interface RecruitService {
    /**
     * 分页查询
     * @param bhRecruit
     * @param page
     * @return
     */
    public PageController<BhRecruit> find(BhRecruit bhRecruit , String page , String rows);

    /**
     * 根据id查询
     * @param recruitId
     * @return
     */
    public BhRecruitWithBLOBs getById(String recruitId);
    /**
     * 删除招聘信息
     * @param bhRecruits
     * @return
     */
    public  boolean delete(List<BhRecruit> bhRecruits);

    /**
     * 添加招聘信息
     * @param bhRecruit
     * @return
     */
    public  boolean insert(BhRecruitWithBLOBs bhRecruit);

    /**
     * 修改招聘信息信息
     * @param bhRecruit
     * @return
     */
    public boolean  update(BhRecruitWithBLOBs bhRecruit);
    /**
     * 查询不分页
     * @param record
     * @return
     */
    List<BhRecruitWithBLOBs> selectSome(BhRecruit record);
}
