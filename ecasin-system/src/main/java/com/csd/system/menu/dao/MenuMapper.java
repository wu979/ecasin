package com.csd.system.menu.dao;

import com.csd.system.menu.po.Menu;

import java.util.List;
import java.util.Map;

public interface MenuMapper {
    
    int deleteByPrimaryKey(String menuId);

    
    int insert(Menu record);

    
    int insertSelective(Menu record);

    
    Menu selectByPrimaryKey(String menuId);

    
    int updateByPrimaryKeySelective(Menu record);

    
    int updateByPrimaryKey(Menu record);


    Menu findParentNameById(String recordId);


    List<Menu> findParentListByParentId(String parentId);


    List<Menu> getMenuListByRoleList(List<String> list);


    List<Map<String,String>> getAllMenuAndRole();


    List<Menu> getAllMenu();


    List<Menu> getMenuByUserId(String userId);


    List<Menu> getAllMenuByParentId(String parentId);


    List<Menu> getMenuParentByUserId(String userId);


    List<Menu> getMenuSunByUserId(String userId);


    List<Menu> findParentMenuByAdmin();


    List<Menu> findSunMenuByAdmin();


    Menu findMenuByParentId(String parentId);


    Menu findMenuByName(String menuName);


    int updateParentById(Map<String,Object> map);


    List<Menu> findRoleByParentList(Map<String,Object> map);


    List<Menu> findRoleBySunList(Map<String,Object> map);

}