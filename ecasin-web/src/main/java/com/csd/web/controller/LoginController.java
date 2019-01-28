package com.csd.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/28 15:37.
 */
@Controller

public class LoginController {

    @RequestMapping(value = {"/login","/"})
    public String loginPage(){
        return "login";
    }

}
