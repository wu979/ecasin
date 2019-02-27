package com.csd.web.controller.busines.job;

import com.csd.busines.job.po.Job;
import com.csd.busines.job.request.JobRequest;
import com.csd.busines.job.service.JobService;
import com.csd.common.page.PageVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @desc:职位
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/19 13:04.
 */
@Controller
@RequestMapping("/job")
public class JobController {

    @Autowired
    private JobService jobService;

    @RequestMapping(value = "/index" , method = RequestMethod.GET)
    public String index(){
        return "";
    }


    /**
     * 角色授权. 未选职位列表
     * @param page
     * @param request
     * @return
     */
    @RequestMapping(value = "/findRoleByUnJobList", method = RequestMethod.POST)
    @ResponseBody
    public PageVo<Job> findRoleByUnJobList(PageVo<Job> page, JobRequest request){
        return jobService.findRoleByUnJobList(page,request);
    }


    /**
     * 角色授权. 已选职位列表
     * @param page
     * @param request
     * @return
     */
    @RequestMapping(value = "/findRoleByJobList", method = RequestMethod.POST)
    @ResponseBody
    public PageVo<Job> findRoleByJobList(PageVo<Job> page, JobRequest request){
        return jobService.findRoleByJobList(page,request);
    }
}
