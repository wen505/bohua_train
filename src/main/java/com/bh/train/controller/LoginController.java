package com.bh.train.controller;

import com.bh.train.common.Constant;
import com.bh.train.common.controller.BaseController;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.tree.CheckTreeNode;
import com.bh.train.common.util.PageController;
import com.bh.train.common.vo.RspData;
import com.bh.train.model.BhUser;
import com.bh.train.model.BhUserRole;
import com.bh.train.service.UserService;
import com.bh.train.vo.LoginReqVo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * Created by Administrator on 2016/5/30.
 */
@Controller
@RequestMapping("/back")
public class LoginController extends BaseController<LoginController> {

    @Resource
    private UserService userService;

    @RequestMapping("/index")
    public String index(){
        return "/back/login";
    }

    /**
     *登陆
     * @param loginReqVo
     * @return
     */
    @RequestMapping("/login")
    @ResponseBody
    public RspData login(LoginReqVo loginReqVo) {
        BhUser user = null;
        try {
            user = userService.login(loginReqVo);
            getSession().setAttribute(Constant.LOGIN_USER,user);
        } catch (BusinessException e) {
            return RspData.error("2", e.getMessage());
        }
        return RspData.success(null);
    }

    @RequestMapping("/success")
    public String success(){
        return "/common/success";
    }

    @RequestMapping("/fail")
    public String fail(){
        return "/common/error";
    }

    @RequestMapping("/home")
    public String goHome(){
        return "/back/index";
    }
}
