package com.csd.web.controller.system.role;

import com.csd.busines.job.service.JobService;
import com.csd.common.page.PageVo;
import com.csd.exception.application.ApplicationException;
import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import com.csd.exception.status.BaseStatus;
import com.csd.log.annotation.SystemControllerLog;
import com.csd.system.role.po.Role;
import com.csd.system.role.request.JobRequest;
import com.csd.system.role.request.RoleRequest;
import com.csd.system.role.service.RoleService;
import com.csd.utils.ConstantUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

/**
 * @desc:角色
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/2/14 14:03.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    @Autowired
    private RoleService roleService;

    @Autowired
    private JobService jobService;


    /**
     * 角色首页
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(){
        return "system/role/role";
    }


    /**
     * 保存页面
     * @return
     */
    @RequestMapping(value = "/savePage" , method = RequestMethod.GET)
    public String savePage(){
        return "system/role/role_save";
    }


    /**
     * 修改页面
     * @return
     */
    @RequestMapping(value = "/updatePage" , method = RequestMethod.GET)
    public String updatePage(){
        return "system/role/role_update";
    }


    /**
     * 菜单授权页面
     * @return
     */
    @RequestMapping(value = "/menuPage" , method = RequestMethod.GET)
    public String menuPage(){
        return "system/role/role_menu";
    }


    /**
     * 职位授权页面
     * @return
     */
    @RequestMapping(value = "/jobPage" , method = RequestMethod.GET)
    public String jobPage(){
        return "system/role/role_job";
    }


    /**
     * 授权页面-判断类型
     * @param roleType  角色类型
     * @param type  1menuPage 2jobPage
     * @return
     */
    @RequestMapping(value = "/checkRoleType" , method = RequestMethod.POST)
    @ResponseBody
    public Result checkRoleType(String roleType,String type,String roleCode){
        roleService.checkRoleType(roleType,type,roleCode);
        return ResultUtil.success();
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
        PageVo<Role> byPage = roleService.findByPage(page, request);
        return byPage;
    }


    /**
     * 保存
     * @param role
     * @return
     */
    @RequestMapping(value = "/save" , method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(descrption = "新增角色" , actionType = "1")
    public Result save(@Valid Role role, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }else {
            roleService.save(role);
        }
        return ResultUtil.success();
    }


    /**
     * 修改
     * @param role
     * @return
     */
    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(descrption = "修改角色" , actionType = "2")
    public Result update(@Valid Role role, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }else {
            roleService.update(role);
        }
        return ResultUtil.success();
    }


    /**
     * 删除
     * @param ids
     * @return
     */
    @RequestMapping(value = "/delete" , method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(descrption = "删除角色" , actionType = "3")
    public Result delete(String[] ids) throws Exception {
        String rsult = roleService.commonDeleteEntity(ids);
        return ResultUtil.success(rsult);
    }


    /**
     * 授权添加职位
     * @return
     */
    @RequestMapping(value = "/addJob" , method = RequestMethod.POST)
    @ResponseBody
    public Result addJob(@Valid JobRequest request, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }
        roleService.createJob(request, ConstantUtil.CODE_ONE);
        return ResultUtil.success();
    }


    /**
     * 授权删除职位
     * @return
     */
    @RequestMapping(value = "/deleteJob" , method = RequestMethod.POST)
    @ResponseBody
    public Result deleteJob(@Valid JobRequest request,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }
        roleService.createJob(request,ConstantUtil.CODE_TWO);
        return ResultUtil.success();
    }


    /**
     * 授权添加菜单
     * @return
     */
    @RequestMapping(value = "/addMenu" , method = RequestMethod.POST)
    @ResponseBody
    public Result addMenu(@Valid RoleRequest request,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }
        roleService.createMenu(request,ConstantUtil.CODE_ONE);
        return ResultUtil.success();
    }


    /**
     * 授权删除菜单
     * @return
     */
    @RequestMapping(value = "/deleteMenu" , method = RequestMethod.POST)
    @ResponseBody
    public Result deleteMenu(@Valid RoleRequest request,BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }
        roleService.createMenu(request,ConstantUtil.CODE_TWO);
        return ResultUtil.success();
    }
}
