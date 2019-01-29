package com.csd.system.role.dao;

import com.csd.system.role.po.Role;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import java.util.List;
import java.util.Map;

public interface RoleMapper {
    
    int deleteByPrimaryKey(String roleId);

    
    int insert(Role record);

    
    int insertSelective(Role record);

    
    Role selectByPrimaryKey(String roleId);

    
    int updateByPrimaryKeySelective(Role record);

    
    int updateByPrimaryKey(Role record);


    List<Role> getRoleListByJobId(String jobId);


    PageList<Role> findByPage(Map<String,Object> map, PageBounds pageBounds);
}