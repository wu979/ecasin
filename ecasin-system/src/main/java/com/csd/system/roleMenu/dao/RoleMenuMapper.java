package com.csd.system.roleMenu.dao;

import com.csd.system.roleMenu.po.RoleMenu;

public interface RoleMenuMapper {
    
    int insert(RoleMenu record);

    
    int insertSelective(RoleMenu record);
}