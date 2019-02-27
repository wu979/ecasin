package com.csd.web.controller.busines.staff;

import com.csd.common.page.PageVo;
import com.csd.system.user.entity.StaffRequest;
import com.csd.system.user.po.User;
import com.csd.system.user.service.StaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @desc:员工档案
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/27 16:40.
 */
@Controller
@RequestMapping("/staff")
public class StaffController {


    @Autowired
    private StaffService staffService;


    /**
     * 首页
     * @return
     */
    @RequestMapping(value = "/index" , method = RequestMethod.GET)
    public String index(){
        return "busines/staff/staff";
    }



    /**
     * 档案列表
     * @return
     */
    @RequestMapping(value = "/findByPage" , method = RequestMethod.POST)
    @ResponseBody
    public PageVo<User> findByPage(PageVo<User> page, StaffRequest request){
        return staffService.findByPage(page,request);
    }
}
