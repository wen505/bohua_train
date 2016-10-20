package com.bh.train.controller;

import com.bh.train.common.Constant;
import com.bh.train.common.exception.BusinessException;
import com.bh.train.common.vo.RspData;
import com.bh.train.model.BhUser;
import com.bh.train.service.UserService;
import com.bh.train.vo.LoginReqVo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


/**
 * Created by Administrator on 2016/5/30.
 */
@Controller
@RequestMapping("/back")
public class LoginController {

    private Logger LOGGER = Logger.getLogger(LoginController.class);
    @Resource
    private UserService userService;

    @RequestMapping("/index")
    public String index(){
        return "/back/login";
    }

    @RequestMapping("/login")
    @ResponseBody
    public RspData login(LoginReqVo loginReqVo, HttpServletRequest request) {
        HttpSession session = request.getSession();
        BhUser user = null;
        try {
            user = userService.login(loginReqVo);
            session.setAttribute(Constant.LOGIN_USER,user);
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

    @RequestMapping("/goHome")
    public String goHome(){
        return "/back/index";
    }
}
