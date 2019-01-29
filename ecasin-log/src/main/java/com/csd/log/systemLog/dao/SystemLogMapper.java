package com.csd.log.systemLog.dao;

import com.csd.log.systemLog.po.SystemLog;

public interface SystemLogMapper {
    
    int deleteByPrimaryKey(String logId);

    
    int insert(SystemLog record);

    
    int insertSelective(SystemLog record);

    
    SystemLog selectByPrimaryKey(String logId);

    
    int updateByPrimaryKeySelective(SystemLog record);

    
    int updateByPrimaryKeyWithBLOBs(SystemLog record);

    
    int updateByPrimaryKey(SystemLog record);
}