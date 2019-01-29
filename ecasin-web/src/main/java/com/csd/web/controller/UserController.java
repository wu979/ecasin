package com.csd.web.controller;

import com.csd.exception.application.ApplicationException;
import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import com.csd.exception.status.BaseStatus;
import com.csd.system.user.po.User;
import com.csd.system.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/28 15:46.
 */
@Controller
@RequestMapping("/user")
public class UserController {


    @Autowired
    private UserService userService;


    @RequestMapping("/getUser")
    @ResponseBody
    public Result getUser(){

        String userId = "bbdbf895c1e24b59bf88ee984cd07f28";

        User user = userService.selectByPrimaryKey(userId);

        System.out.println(user.getUserPhone());
        if(user.getUserPhone().equals("18683789594")){
            throw new ApplicationException(BaseStatus.EXCAPTION.getCode(),BaseStatus.EXCAPTION.getMessage());
        }
        return ResultUtil.success(user);
    }

}
