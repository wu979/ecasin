package com.csd.system.role.service;

import com.csd.common.constant.dao.ConstantMapper;
import com.csd.common.constant.po.Constant;
import com.csd.common.loginUser.LoginUser;
import com.csd.common.page.PageVo;
import com.csd.common.service.DeleteService;
import com.csd.common.service.MapParaService;
import com.csd.exception.application.ApplicationException;
import com.csd.exception.status.BaseStatus;
import com.csd.log.annotation.SystemServiceLog;
import com.csd.security.securityEntity.User;
import com.csd.system.menu.po.Menu;
import com.csd.system.menu.service.MenuService;
import com.csd.system.role.dao.RoleMapper;
import com.csd.system.role.po.Role;
import com.csd.system.role.request.RoleRequest;
import com.csd.system.roleMenu.service.RoleMenuService;
import com.csd.system.user.dao.UserMapper;
import com.csd.system.userRole.UserRoleService;
import com.csd.utils.ConstantUtil;
import com.csd.utils.DateUtil;
import com.csd.utils.StringUtil;
import com.csd.utils.UUIDUtil;
import com.github.miemiedev.mybatis.paginator.domain.PageBounds;
import com.github.miemiedev.mybatis.paginator.domain.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 17:22.
 */
@Service
public class RoleService extends DeleteService<Role> {

    @Resource
    private RoleMapper roleMapper;

    @Resource
    private ConstantMapper constantMapper;

    @Autowired
    private UserRoleService userRoleService;

    @Autowired
    private MenuService menuService;

    @Resource
    private UserMapper userMapper;


    @Autowired
    private RoleMenuService roleMenuService;


    public PageVo<Role> findByPage(PageVo<Role> page, RoleRequest request){
        User user = LoginUser.getLoginUser();
        PageBounds pageBounds = page.pageToPageBounds(page);
        Map<String, Object> parameter = MapParaService.getParameter(request);
        if(!StringUtil.isEmpty(request.getOrgId())){
            parameter.put("orgId", request.getOrgId());
        }else {
            if(!StringUtil.isEmpty(user.getUserOrgId())){
                parameter.put("orgId",user.getUserOrgId());
            }else {
                parameter.put("orgId",null);
            }
        }
        PageList<Role> rolePage = roleMapper.findByPage(parameter, pageBounds);
        page.listToPage(page,rolePage);
        return page;
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    @SystemServiceLog(descrption = "新增角色")
    public void save(Role role){
        Map<String,Object> map = new HashMap<>();
        User user = LoginUser.getLoginUser();
        if(!user.getUserType().equals(ConstantUtil.CODE_ZERO) && !user.getUserType().equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.EXCAPTION.getCode(),BaseStatus.EXCAPTION.getMessage());
        }
        String days = DateUtil.getDays();
        String date = DateUtil.timeStamp();
        role.setRoleId(UUIDUtil.getUUID());
        role.setRoleOrgId(user.getUserOrgId());
        role.setRoleCreateUserId(user.getUserId());
        role.setRoleCreateTime(DateUtil.getTime());
        role.setRoleIsValid(ConstantUtil.CODE_ONE);
        role.setRoleCode("ROLE_"+days+date);
        Constant byConstant = null;
        map.put("constantType","roleType");
        switch (user.getUserType()){
            case ConstantUtil.CODE_ZERO:
                map.put("constantValue",ConstantUtil.CODE_TWO);
                break;
            default:
                map.put("constantValue",ConstantUtil.CODE_THREE);
                break;
        }
        byConstant = constantMapper.findByConstant(map);
        role.setRoleType(byConstant.getConstantId());
        roleMapper.insertSelective(role);
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    @SystemServiceLog(descrption = "修改角色")
    public void update(Role role){
        User user = LoginUser.getLoginUser();
        if(!user.getUserType().equals(ConstantUtil.CODE_ZERO) && !user.getUserType().equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.EXCAPTION.getCode(),BaseStatus.EXCAPTION.getMessage());
        }
        role.setRoleUpdateUserId(user.getUserId());
        role.setRoleUpdateTime(DateUtil.getTime());

        roleMapper.updateByPrimaryKeySelective(role);
    }


    public Role selectByPrimaryKey(String roleId){
        return roleMapper.selectByPrimaryKey(roleId);
    }


    @Override
    @SystemServiceLog(descrption = "删除角色")
    public Integer deleteEntity(Role role) throws Exception {
        int result;
        String constantValue = constantMapper.findValueById(role.getRoleType());
        if(constantValue.equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_DELETE.getCode(),BaseStatus.ROLE_ADMIN_NOT_DELETE.getMessage());
        }else if(constantValue.equals(ConstantUtil.CODE_TWO)){
            if(role.getRoleCode().equals("ROLE_PING")){
                throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_CREATE.getCode(),BaseStatus.ROLE_ADMIN_NOT_CREATE.getMessage());
            }
        }
        role.setRoleUpdateUserId(LoginUser.getLoginUserId());
        role.setRoleUpdateTime(DateUtil.getTime());
        role.setRoleIsValid(ConstantUtil.CODE_ZERO);
        result = roleMapper.updateByPrimaryKeySelective(role);
        return result;
    }


    public void checkRoleType(String roleType,String type){
        if(roleType.equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_DELETE.getCode(),BaseStatus.ROLE_ADMIN_NOT_DELETE.getMessage());
        }else {
            if(roleType.equals(ConstantUtil.CODE_TWO)){
                if(type.equals(ConstantUtil.CODE_TWO)){
                    throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_CREATE.getCode(),BaseStatus.ROLE_ADMIN_NOT_CREATE.getMessage());
                }
                if(type.equals(ConstantUtil.CODE_THREE)){
                    throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_CREATE.getCode(),BaseStatus.ROLE_ADMIN_NOT_CREATE.getMessage());
                }
            }
        }
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    public void createJob(RoleRequest request,String type){
        Map<String,Object> map = new HashMap<>();
        Role role = roleMapper.selectByPrimaryKey(request.getRoleId());
        Constant constant = constantMapper.selectByPrimaryKey(request.getRoleType());
        if(constant.getConstantValue().equals(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_DELETE.getCode(),BaseStatus.ROLE_ADMIN_NOT_DELETE.getMessage());
        }
        if(constant.getConstantValue().equals(ConstantUtil.CODE_ONE)){
            if(role.getRoleCode().equals("ROLE_PING")){
                throw new ApplicationException(BaseStatus.ROLE_ADMIN_NOT_CREATE.getCode(),BaseStatus.ROLE_ADMIN_NOT_CREATE.getMessage());
            }
        }
        if(request.getJobIds().length < Integer.valueOf(ConstantUtil.CODE_ONE)){
            throw new ApplicationException(BaseStatus.PARAMETER.getCode(),BaseStatus.PARAMETER.getMessage());
        }
        map.put("roleId",request.getRoleId());
        map.put("jobIds",request.getJobIds());
        map.put("isValid",ConstantUtil.CODE_ONE);
        if(type.equals(ConstantUtil.CODE_ONE)){
            userRoleService.insertJob(map);
        }else {
            userRoleService.deleteJob(map);
        }
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    public void createMenu(RoleRequest request,String type){
        List<String> menuIdList = new ArrayList<>();
        List<String> menuRecursionList = new ArrayList<>();
        List<Menu> menuAll = this.getAllList(request);
        if(request.getMenuId().equals("root_parent")){
            if(type.equals(ConstantUtil.CODE_ONE)){
                for(Menu menu : menuAll){
                    if(menu.getMenuIsNull() == null){
                        menuIdList.add(menu.getMenuId());
                    }
                }
            }else {
                for(Menu menu : menuAll){
                    menuIdList.add(menu.getMenuId());
                }
            }
        }else {
            if(type.equals(ConstantUtil.CODE_ONE)){
                menuRecursionList = this.addMenu(request,menuAll,menuRecursionList);
            }else {
                menuRecursionList = this.deleteMenu(request,menuAll,menuRecursionList);
            }
            menuIdList.addAll(menuRecursionList);
        }
        Map<String,Object> map = new HashMap<>();
        map.put("roleId",request.getRoleId());
        map.put("menuIdList",menuIdList);
        if(type.equals(ConstantUtil.CODE_ONE)){
            map.put("isValid",ConstantUtil.CODE_ONE);
            roleMenuService.insertListByRoleId(map);
        }else {
            map.put("isValid",ConstantUtil.CODE_ZERO);
            roleMenuService.deleteListByRoleId(map);
        }
    }


    public List<String> addMenu(RoleRequest request,List<Menu> menuAll,List<String> menuRecursionList){
        //根据父级ID 找到未被标记的父级,递归查询
        menuRecursionList = this.addMenuParentByRecursion(menuAll,request.getMenuPid(),menuRecursionList);
        //根据菜单ID 找到未被标记的子级,递归查询
        for(Menu menu : menuAll){
            if(menu.getMenuId().equals(request.getMenuId())){
                menuRecursionList.add(menu.getMenuId());
                if(menu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)){
                    menuRecursionList = this.addMenuSunByRecursion(menuAll,menu.getMenuId(),menuRecursionList);
                }
            }
        }
        return menuRecursionList;
    }


    public List<String> addMenuParentByRecursion(List<Menu> menuAll,String menuPid,List<String> menuRecursionList){
        for(Menu menu : menuAll){
            if(menu.getMenuId().equals(menuPid)){
                if(StringUtil.isEmpty(menu.getMenuIsNull())){
                    menuRecursionList.add(menu.getMenuId());
                    if(!StringUtil.isEmpty(menu.getMenuPid())){
                        menuRecursionList = addMenuParentByRecursion(menuAll,menu.getMenuPid(),menuRecursionList);
                    }
                }
            }
        }
        return menuRecursionList;
    }


    public List<String> addMenuSunByRecursion(List<Menu> menuAll,String menuId,List<String> menuRecursionList){
        for(Menu menu : menuAll){
            if(!StringUtil.isEmpty(menu.getMenuPid())) {
                if (menu.getMenuPid().equals(menuId)) {
                    menuRecursionList.add(menu.getMenuId());
                    if (menu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)) {
                        menuRecursionList = addMenuSunByRecursion(menuAll, menu.getMenuId(), menuRecursionList);
                    }
                }
            }
        }
        return menuRecursionList;
    }


    public List<String> deleteMenu(RoleRequest request,List<Menu> menuAll,List<String> menuRecursionList){
        //根据父级ID 找到所有父级,如果都未被标记则删除父级,递归查询
        for(Menu parentMenu : menuAll){
            if(parentMenu.getMenuId().equals(request.getMenuPid())){
                menuRecursionList = this.deleteMenuParentByRecursion(menuAll,parentMenu,menuRecursionList,request.getMenuId());
            }
        }
        //根据菜单ID 找到所有子级,递归查询
        for(Menu menu : menuAll){
            if(menu.getMenuId().equals(request.getMenuId())){
                menuRecursionList.add(menu.getMenuId());
                if(menu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)){
                    menuRecursionList = this.deleteMenuSunByRecursion(menuAll,menu.getMenuId(),menuRecursionList);
                }
            }
        }
        return menuRecursionList;
    }


    public List<String> deleteMenuParentByRecursion(List<Menu> menuAll,Menu parentMenu,List<String> menuRecursionList,String menuId){
        int count = 0;
        for(Menu menu : menuAll){
            if(!StringUtil.isEmpty(menu.getMenuPid())){
                if(menu.getMenuPid().equals(parentMenu.getMenuId())){
                    if(!menu.getMenuId().equals(menuId)){
                        if(!StringUtil.isEmpty(menu.getMenuIsNull())){
                            count ++;
                        }
                    }
                }
            }
        }
        if(count == 0){
            menuRecursionList.add(parentMenu.getMenuId());
            if(!StringUtil.isEmpty(parentMenu.getMenuPid())){
                for(Menu parentRecursionMenu : menuAll){
                    if(parentRecursionMenu.getMenuId().equals(parentMenu.getMenuPid())){
                        menuRecursionList = deleteMenuParentByRecursion(menuAll,parentRecursionMenu,menuRecursionList,parentMenu.getMenuId());
                    }
                }
            }
        }
        return menuRecursionList;
    }


    public List<String> deleteMenuSunByRecursion(List<Menu> menuAll,String menuId,List<String> menuRecursionList){
        for(Menu menu : menuAll){
            if(!StringUtil.isEmpty(menu.getMenuPid())) {
                if (menu.getMenuPid().equals(menuId)) {
                    menuRecursionList.add(menu.getMenuId());
                    if (menu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)) {
                        menuRecursionList = deleteMenuSunByRecursion(menuAll, menu.getMenuId(), menuRecursionList);
                    }
                }
            }
        }
        return menuRecursionList;
    }


    public List<Menu> getAllList(RoleRequest request){
        com.csd.system.user.po.User user = userMapper.findUserByUserId(LoginUser.getLoginUserId());
        Map<String,Object> map = new HashMap<>();
        if(!StringUtil.isEmpty(user.getPtJobId())){
            map.put("jobId",user.getPtJobId());
        }
        if(!StringUtil.isEmpty(request.getRoleId())){
            map.put("roleId",request.getRoleId());
        }
        return menuService.findRoleByAllList(map);
    }
}
