package com.csd.system.userRole;

import com.csd.system.userRole.dao.UserRoleMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/21 16:56.
 */
@Service
public class UserRoleService {


    @Resource
    private UserRoleMapper userRoleMapper;


    public void insertJob(Map<String,Object> map){
        userRoleMapper.insertJob(map);
    }


    public int deleteJob(Map<String,Object> map){
        return userRoleMapper.deleteJob(map);
    }

}
