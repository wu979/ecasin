package com.csd.system.user.dao;

import com.csd.system.user.po.User;

public interface UserMapper {
    
    int deleteByPrimaryKey(String userId);

    
    int insert(User record);

    
    int insertSelective(User record);

    
    User selectByPrimaryKey(String userId);

    
    int updateByPrimaryKeySelective(User record);

    
    int updateByPrimaryKey(User record);


    User selectByPhone(String userPhone);


    User findByUserName(String userPhone);
}