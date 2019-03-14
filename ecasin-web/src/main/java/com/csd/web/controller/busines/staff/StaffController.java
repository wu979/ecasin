package com.csd.web.controller.busines.staff;

import com.csd.common.page.PageVo;
import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import com.csd.log.annotation.SystemControllerLog;
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
@RequestMapping("/archives")
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
     * 新增
     * @return
     */
    @RequestMapping(value = "/savePage" , method = RequestMethod.GET)
    public String savePage(){
        return "busines/staff/staff_save";
    }


    /**
     * 新增
     * @return
     */
    @RequestMapping(value = "/updatePage" , method = RequestMethod.GET)
    public String updatePage(){
        return "busines/staff/staff_update";
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


    /**
     * 更新用户激活类型
     * @param request
     * @return
     */
    @RequestMapping(value = "/updateUserType" , method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(descrption = "更新激活类型" , actionType = "2")
    public Result updateUserType(StaffRequest request){
        staffService.updateUserType(request);
        return ResultUtil.success();
    }
}
