package com.csd.web.controller.system.role;

import com.csd.common.page.PageVo;
import com.csd.system.role.po.Role;
import com.csd.system.role.request.RoleRequest;
import com.csd.system.role.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/14 14:03.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){
        return "system/role/role";
    }



    /**
     * 角色列表
     * @param page
     * @param request
     * @return
     */
    @RequestMapping(value = "/findByPage", method = RequestMethod.POST)
    @ResponseBody
    public PageVo<Role> findByPage(PageVo<Role> page, RoleRequest request){
        return roleService.findByPage(page,request);
    }


    /**
     * 保存页面
     * @return
     */
    @RequestMapping(value = "/savePage" , method = RequestMethod.GET)
    public String savePage(){
        return "system/role/role_save";
    }

}
