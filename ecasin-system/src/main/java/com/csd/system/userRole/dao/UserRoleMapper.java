package com.csd.system.userRole.dao;

import com.csd.system.userRole.po.UserRole;

import java.util.Map;

public interface UserRoleMapper {
    
    int insert(UserRole record);

    
    int insertSelective(UserRole record);


    void insertJob(Map<String,Object> map);


    int deleteJob(Map<String,Object> map);

}