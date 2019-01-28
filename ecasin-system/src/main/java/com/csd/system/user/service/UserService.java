package com.csd.system.user.service;

import com.csd.system.user.dao.UserMapper;
import com.csd.system.user.po.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/28 16:09.
 */
@Service
public class UserService {


    @Resource
    private UserMapper userMapper;

    public User selectByPrimaryKey(String userId){
        return userMapper.selectByPrimaryKey(userId);
    }

}
