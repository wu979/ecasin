package com.csd.common.constant.dao;

import com.csd.common.constant.po.Constant;

import java.util.List;
import java.util.Map;

public interface ConstantMapper {
    
    int deleteByPrimaryKey(String constantId);

    
    int insert(Constant record);

    
    int insertSelective(Constant record);

    
    Constant selectByPrimaryKey(String constantId);

    
    int updateByPrimaryKeySelective(Constant record);

    
    int updateByPrimaryKey(Constant record);


    List<Constant> findByList(Map<String,Object> map);


    Constant findByConstant(Map<String,Object> map);


    String findValueById(String constantId);
}