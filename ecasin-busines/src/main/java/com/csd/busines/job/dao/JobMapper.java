package com.csd.busines.job.dao;

import com.csd.busines.job.po.Job;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import java.util.Map;

public interface JobMapper {
    
    int deleteByPrimaryKey(String jobId);

    
    int insert(Job record);

    
    int insertSelective(Job record);

    
    Job selectByPrimaryKey(String jobId);

    
    int updateByPrimaryKeySelective(Job record);

    
    int updateByPrimaryKey(Job record);


    PageList<Job> findRoleByUnJobList(Map<String,Object> map, PageBounds pageBounds);


    PageList<Job> findRoleByJobList(Map<String,Object> map, PageBounds pageBounds);
}