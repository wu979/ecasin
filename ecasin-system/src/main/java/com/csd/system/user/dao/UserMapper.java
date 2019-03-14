package com.csd.system.user.dao;

import com.csd.system.user.po.User;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;

import java.util.Map;

public interface UserMapper {
    
    int deleteByPrimaryKey(String userId);

    
    int insert(User record);

    
    int insertSelective(User record);

    
    User selectByPrimaryKey(String userId);

    
    int updateByPrimaryKeySelective(User record);

    
    int updateByPrimaryKey(User record);


    User selectByPhone(String userPhone);


    User findByUserName(String userPhone);


    User findUserByUserId(String userId);


    PageList<User> findByPage(Map<String,Object> map, PageBounds pageBounds);


    User findBySuperManage();


    int updateActive(Map<String,Object> map);
}