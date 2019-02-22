package com.csd.system.roleMenu.dao;

import com.csd.system.roleMenu.po.RoleMenu;

import java.util.Map;

public interface RoleMenuMapper {
    
    int insert(RoleMenu record);

    
    int insertSelective(RoleMenu record);


    int findCheckMenu(Map<String,Object> map);
}