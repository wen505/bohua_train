package com.bh.train.controller;

import com.bh.train.common.controller.BaseController;
import com.bh.train.common.vo.RspData;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;

@Controller
public class DictionaryController extends BaseController<DictionaryController> {
    public DictionaryController() {
    }

    public RspData find(HttpServletRequest request, HttpServletResponse response) {
        return null;
    }
}