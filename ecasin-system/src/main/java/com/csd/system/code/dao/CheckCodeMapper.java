package com.csd.system.code.dao;

import com.csd.system.code.po.CheckCode;

import java.util.Map;

public interface CheckCodeMapper {
    
    int deleteByPrimaryKey(String codeId);

    
    int insert(CheckCode record);

    
    int insertSelective(CheckCode record);

    
    CheckCode selectByPrimaryKey(String codeId);

    
    int updateByPrimaryKeySelective(CheckCode record);

    
    int updateByPrimaryKey(CheckCode record);


    CheckCode getCodeByPhone(Map<String,Object> map);
}