package com.bh.train.controller;

import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.util.PageController;
import com.bh.train.common.vo.RspData;
import com.bh.train.model.BhRecruit;
import com.bh.train.model.BhRecruitWithBLOBs;
import com.bh.train.model.BhUser;
import com.bh.train.service.RecruitService;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**招聘信息action
 * Created by lp on 2016/11/6.
 */
@Controller
@RequestMapping("/back/recruit")
public class RecruitController extends BaseController<RecruitController> {
    @Resource
    private RecruitService recruitService;

    /**
     * 分页查询
     *
     * @param bhRecruit
     * @return
     */
    @RequestMapping("/find")
    @ResponseBody
    public PageController<BhRecruit> find(BhRecruit bhRecruit) {
        try {
            PageController<BhRecruit> controller = recruitService.find(bhRecruit, getPage(), getRows());
            return controller;
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return new PageController<BhRecruit>();
        }
    }

    /**
     * 删除招聘信息
     *
     * @param bhRecruits
     * @return
     */
    @RequestMapping("/delete")
    @ResponseBody
    public RspData delete(@RequestBody List<BhRecruit> bhRecruits) {
        try {
            boolean delete = recruitService.delete(bhRecruits);
            return RspData.issuccess(delete);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "删除失败！");
        }
    }

    /**
     * 根据id 查询
     *
     * @param noticeId
     * @return
     */
    @RequestMapping("/getById")
    @ResponseBody
    public RspData getById(String recruitId) {
        try {
            if (StringUtils.isEmpty(recruitId)) {
                return RspData.error(Constant.ERROR_CODE, "查询失败！");
            }
            BhRecruit bhRecruit = recruitService.getById(recruitId);
            return RspData.success(bhRecruit);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "查询失败！");
        }
    }
    /**
     * 添加招聘信息
     *
     * @param bhRecruit
     * @return
     */
    @RequestMapping("/insert.do")
    @ResponseBody
    public RspData insert( BhRecruitWithBLOBs bhRecruit) {
        try {
            boolean flag = recruitService.insert(bhRecruit);
            return RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "保存失败！");
        }
    }
    /**
     * 修改招聘信息信息
     *
     * @param bhRecruit
     * @return
     */
    @RequestMapping("/update")
    @ResponseBody
    public RspData update(BhRecruitWithBLOBs bhRecruit) {
        try {
            boolean flag = recruitService.update(bhRecruit);
            return RspData.issuccess(flag);
        } catch (BusinessException e) {
            e.printStackTrace();
            logger.error(e.getMessage(), e);
            return RspData.error(Constant.ERROR_CODE, "修改失败！");
        }
    }

}
