package com.csd.system.userRole.dao;

import com.csd.system.userRole.po.UserRole;

public interface UserRoleMapper {
    
    int insert(UserRole record);

    
    int insertSelective(UserRole record);
}