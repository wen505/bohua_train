package com.bh.train.common.config;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2016/6/2.
 */
@ControllerAdvice
public class SimpleController {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public String handleBusinessException(Exception ex) {
        return "";
    }
}
