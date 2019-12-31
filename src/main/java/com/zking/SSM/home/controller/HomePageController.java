package com.zking.SSM.home.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Author Administrator
 * CreateTime 2019-11-27 15:39
 */
@Controller
@RequestMapping(value = "/",method = {RequestMethod.GET,RequestMethod.POST,RequestMethod.DELETE})
public class HomePageController {

    @RequestMapping("/")
    public String toHome(){
        return "index";
    }
}
