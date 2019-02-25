package com.csd.system.roleMenu.service;

import com.csd.system.roleMenu.dao.RoleMenuMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/25 15:48.
 */
@Service
public class RoleMenuService {


    @Resource
    private RoleMenuMapper roleMenuMapper;


    public void insertListByRoleId(Map<String,Object> map){
        roleMenuMapper.insertListByRoleId(map);
    }


    public void deleteListByRoleId(Map<String,Object> map){
        roleMenuMapper.deleteListByRoleId(map);
    }
}
