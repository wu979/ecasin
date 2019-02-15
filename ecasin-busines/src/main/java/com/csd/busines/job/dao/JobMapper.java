package com.csd.busines.job.dao;

import com.csd.busines.job.po.Job;

public interface JobMapper {
    
    int deleteByPrimaryKey(String jobId);

    
    int insert(Job record);

    
    int insertSelective(Job record);

    
    Job selectByPrimaryKey(String jobId);

    
    int updateByPrimaryKeySelective(Job record);

    
    int updateByPrimaryKey(Job record);
}