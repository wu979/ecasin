package com.csd.busines.ptJob.dao;

import com.csd.busines.ptJob.po.PtJob;

public interface PtJobMapper {
    
    int deleteByPrimaryKey(String ptId);

    
    int insert(PtJob record);

    
    int insertSelective(PtJob record);

    
    PtJob selectByPrimaryKey(String ptId);

    
    int updateByPrimaryKeySelective(PtJob record);

    
    int updateByPrimaryKey(PtJob record);
}