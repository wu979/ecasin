package com.csd.busines.job.service;

import com.csd.busines.job.dao.JobMapper;
import com.csd.busines.job.po.Job;
import com.csd.busines.job.request.JobRequest;
import com.csd.common.page.PageVo;
import com.csd.common.service.MapParaService;
import com.csd.system.role.dao.RoleMapper;
import com.csd.utils.StringUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/15 9:45.
 */
@Service
public class JobService {


    @Resource
    private JobMapper jobMapper;


    @Resource
    private RoleMapper roleMapper;


    public PageVo<Job> findRoleByUnJobList(PageVo<Job> page, JobRequest request) {
        PageBounds pageBounds = page.pageToPageBounds(page);
        Map<String,Object> map = MapParaService.getParameter(request);
        if(!StringUtil.isEmpty(request.getRoleId())){
            map.put("roleId",request.getRoleId());
        }
        if(!StringUtil.isEmpty(request.getJobType())){
            map.put("jobType",request.getJobType());
        }
        PageList<Job> unSelectJobList = jobMapper.findRoleByUnJobList(map, pageBounds);
        page.listToPage(page,unSelectJobList);
        return page;
    }


    public PageVo<Job> findRoleByJobList(PageVo<Job> page, JobRequest request){
        PageBounds pageBounds = page.pageToPageBounds(page);
        Map<String,Object> map = MapParaService.getParameter(request);
        if(!StringUtil.isEmpty(request.getRoleId())){
            map.put("roleId",request.getRoleId());
        }
        PageList<Job> selectJobList = jobMapper.findRoleByJobList(map, pageBounds);
        page.listToPage(page,selectJobList);
        return page;
    }

}
