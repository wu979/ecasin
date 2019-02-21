package com.csd.web.controller.system.menu;

import com.csd.exception.application.ApplicationException;
import com.csd.exception.result.Result;
import com.csd.exception.result.ResultUtil;
import com.csd.exception.status.BaseStatus;
import com.csd.log.annotation.SystemControllerLog;
import com.csd.system.menu.po.Menu;
import com.csd.system.menu.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;
import java.util.List;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/30 16:55.
 */
@Controller
@RequestMapping("/menu")
public class MenuController {

    @Autowired
    private MenuService menuService;


    /**
     * 菜单主页
     * @return
     */
    @RequestMapping(value = "/index" , method = RequestMethod.GET)
    public String index(){
        return "system/menu/menu";
    }


    /**
     * 保存页面
     * @return
     */
    @RequestMapping(value = "/savePage" , method = RequestMethod.GET)
    public String savePage(){
        return "system/menu/menu_save";
    }


    /**
     * 修改页面
     * @return
     */
    @RequestMapping(value = "/updatePage" , method = RequestMethod.GET)
    public String updatePage(){
        return "system/menu/menu_update";
    }


    /**
     * 修改页面,查询父级名称
     * @return
     */
    @RequestMapping(value = "/findParentNameById" , method = RequestMethod.POST)
    @ResponseBody
    public Result findParentNameById(String recordId){
        Menu menu = menuService.findParentNameById(recordId);
        return ResultUtil.success(menu);
    }


    /**
     * 菜单列表
     * @return
     */
    @RequestMapping(value =  "/findByPage" ,method = RequestMethod.POST)
    @ResponseBody
    public List<Menu> findByPage(){
        return menuService.findByPage();
    }


    /**
     * 保存
     * @param menu
     * @return
     */
    @RequestMapping(value = "/save" , method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(descrption = "新增菜单" , actionType = "1")
    public Result save(@Valid Menu menu, BindingResult bindingResult)  throws ApplicationException {
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }else {
            menuService.save(menu);
        }
        return ResultUtil.success();
    }


    /**
     * 修改
     * @param menu
     * @return
     */
    @RequestMapping(value = "/update" , method = RequestMethod.POST)
    @ResponseBody
    @SystemControllerLog(descrption = "修改菜单" , actionType = "2")
    public Result update(@Valid Menu menu, BindingResult bindingResult)  throws ApplicationException {
        if(bindingResult.hasErrors()){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),bindingResult.getFieldError().getDefaultMessage());
        }else {
            menuService.update(menu);
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
    @SystemControllerLog(descrption = "删除菜单" , actionType = "3")
    public Result delete(String[] ids) throws Exception {
        String rsult = menuService.commonDeleteEntity(ids);
        return ResultUtil.success(rsult);
    }


    /**
     * 角色授权--菜单列表
     * @return
     */
    @RequestMapping(value =  "/findRoleByMenuList" ,method = RequestMethod.POST)
    @ResponseBody
    public List<Menu> findRoleByMenuList(String roleId){
        List<Menu> roleByMenuList = menuService.findRoleByMenuList(roleId);
        System.out.println(roleByMenuList.size());
        return roleByMenuList;
    }


}
