package com.csd.system.menu.service;

import com.csd.common.loginUser.LoginUser;
import com.csd.common.service.DeleteService;
import com.csd.exception.application.ApplicationException;
import com.csd.exception.status.BaseStatus;
import com.csd.log.annotation.SystemServiceLog;
import com.csd.security.securityEntity.User;
import com.csd.system.menu.dao.MenuMapper;
import com.csd.system.menu.po.Menu;
import com.csd.system.menu.po.Tree;
import com.csd.system.roleMenu.dao.RoleMenuMapper;
import com.csd.system.user.dao.UserMapper;
import com.csd.utils.*;
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
 * @date: 2019/1/29 16:43.
 */
@Service
public class MenuService  extends DeleteService<Menu> {

    @Resource
    private MenuMapper menuMapper;


    @Resource
    private UserMapper userMapper;


    @Resource
    private RoleMenuMapper roleMenuMapper;


    /**
     * sql 无限次查询
     *
     * @return
     */
    public List<Tree> getTreeList() {
        User user = LoginUser.getLoginUser();

        List<Menu> menuList = menuMapper.getMenuByUserId(user.getUserId());

        List<Tree> treeList = new ArrayList<>();

        for (Menu menu : menuList) {
            Tree tree = BeanCopyUtil.copy(menu, Tree.class);
            tree.setBasicData(null);
            tree.setChildren(getAllByParentId(menu.getMenuId()));
            treeList.add(tree);
        }
        return treeList;
    }


    public List<Tree> getAllByParentId(String menuPid) {

        List<Tree> treeList = new ArrayList<>();

        List<Menu> menuList = menuMapper.getAllMenuByParentId(menuPid);

        for (Menu menu : menuList) {
            Tree tree = BeanCopyUtil.copy(menu, Tree.class);
            tree.setBasicData(null);
            if (menu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)) {
                tree.setChildren(getAllByParentId(menu.getMenuId()));
            } else {
                tree.setChildren(null);
            }
            treeList.add(tree);
        }
        return treeList;
    }


    /**
     * 查询出所有一级菜单, 查询出所有子菜单
     *
     * @return
     */
    public List<Tree> getMenuParentByUserId() {

        User user = LoginUser.getLoginUser();

        List<Menu> parentList = menuMapper.getMenuParentByUserId(user.getUserId());

        List<Menu> sunList = menuMapper.getMenuSunByUserId(user.getUserId());

        List<Tree> treeList = new ArrayList<>();

        for (Menu menu : parentList) {
            Tree tree = BeanCopyUtil.copy(menu, Tree.class);
            tree.setBasicData(null);
            tree.setChildren(getMenuSunByUserId(menu.getMenuId(), sunList));
            treeList.add(tree);
        }
        return treeList;
    }


    public List<Tree> getMenuSunByUserId(String menuPid, List<Menu> sunList) {
        List<Tree> childList = new ArrayList<>();
        for (Menu menu : sunList) {
            if (menuPid.equals(menu.getMenuPid())) {
                Tree tree = BeanCopyUtil.copy(menu, Tree.class);
                tree.setBasicData(null);
                tree.setChildren(getMenuSunByUserId(menu.getMenuId(), sunList));
                childList.add(tree);
            }
        }
        return childList;
    }


    /**
     * 菜单页面列表
     *
     * @return
     */
    public List findByPage() {
        List<Menu> resultList = new ArrayList<>();

        List<Menu> parentMenuList = menuMapper.findParentMenuByAdmin();
        List<Menu> sunMenuList = menuMapper.findSunMenuByAdmin();

        List<Menu> newParentMenuList = new ArrayList(){{
            add(new Menu("root_parent","所有菜单","","false",0,"1"));
        }};
        for (Menu menu : parentMenuList) {
            if (!menu.getMenuName().equals("首页")) {
                menu.setMenuPid("root_parent");
                menu.setHasChild(menu.getMenuHasChild() == 0 ? "true" : "false");
                newParentMenuList.add(menu);
            }
        }

        for (Menu parentManu : newParentMenuList) {
            resultList.add(parentManu);
            for (Menu sunMenu : sunMenuList) {
                if (parentManu.getMenuId().equals(sunMenu.getMenuPid())) {
                    sunMenu.setHasChild(sunMenu.getMenuHasChild() == 0 ? "true" : "false");
                    resultList.add(sunMenu);
                    if (sunMenu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)) {
                        resultList = findSunMenuByAdmin(resultList, sunMenu.getMenuId(), sunMenuList);
                    }
                }

            }
        }

        return resultList;
    }


    public List<Menu> findSunMenuByAdmin(List<Menu> resultList, String pid, List<Menu> sunMenuList) {
        for (Menu menu : sunMenuList) {
            if (pid.equals(menu.getMenuPid())) {
                menu.setHasChild(menu.getMenuHasChild() == 0 ? "true" : "false");
                resultList.add(menu);
                if (menu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)) {
                    resultList = findSunMenuByAdmin(resultList, menu.getMenuId(), sunMenuList);
                }
            }
        }
        return resultList;
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    @SystemServiceLog(descrption = "新增菜单")
    public void save(Menu menu) throws ApplicationException {
        Menu menuByName = menuMapper.findMenuByName(menu.getMenuName());
        if(!StringUtil.isObjectEmpty(menuByName)){
            throw new ApplicationException(BaseStatus.MENU_NAME_EXIST.getCode(),BaseStatus.MENU_NAME_EXIST.getMessage());
        }
        Integer level;
        if(menu.getMenuPid().equals("root_parent")){
            level = 1;
            menu.setMenuPid(null);
        }else {
            Menu parentMenu = menuMapper.findMenuByParentId(menu.getMenuPid());
            level = parentMenu.getMenuLevel() + Integer.valueOf(ConstantUtil.CODE_ONE);
        }
        menu.setMenuId(UUIDUtil.getUUID());
        menu.setMenuHasChild(Integer.valueOf(ConstantUtil.CODE_ZERO));
        menu.setMenuLevel(level);
        menu.setMenuCreateUserId(LoginUser.getLoginUserId());
        menu.setMenuCreateTime(DateUtil.getTime());
        menu.setMenuIsValid(ConstantUtil.CODE_ONE);
        int count = menuMapper.insertSelective(menu);
        if(count > 0){
            if(!menu.getMenuLevel().equals(ConstantUtil.CODE_ONE)){
                Map<String,Object> map = new HashMap<>();
                map.put("recordId",menu.getMenuPid());
                map.put("userId",LoginUser.getLoginUserId());
                map.put("time",DateUtil.getTime());
                map.put("hasChild",ConstantUtil.CODE_ONE);
                menuMapper.updateParentById(map);
            }
        }
    }


    @Transactional( propagation = Propagation.REQUIRED , rollbackFor = {Exception.class, ApplicationException.class} )
    @SystemServiceLog(descrption = "修改菜单")
    public void update(Menu menu) throws ApplicationException {
        Menu menuByName = menuMapper.findMenuByName(menu.getMenuName());
        if(!StringUtil.isObjectEmpty(menuByName)){
            if(!menu.getMenuId().equals(menuByName.getMenuId())){
                throw new ApplicationException(BaseStatus.MENU_NAME_EXIST.getCode(),BaseStatus.MENU_NAME_EXIST.getMessage());
            }
        }
        menu.setMenuUpdateUserId(LoginUser.getLoginUserId());
        menu.setMenuUpdateTime(DateUtil.getTime());
        menuMapper.updateByPrimaryKeySelective(menu);
    }


    @Override
    @SystemServiceLog(descrption = "删除菜单")
    public Integer deleteEntity(Menu menu) {
        int result;
        result = menuMapper.deleteByPrimaryKey(menu.getMenuId());
        if(result > 0){
            if(!menu.getMenuLevel().equals(ConstantUtil.CODE_ONE)){
                String pId = menu.getMenuPid();
                List<Menu> parentList = menuMapper.findParentListByParentId(pId);
                if(parentList.isEmpty()){
                    Map<String,Object> map = new HashMap<>();
                    map.put("recordId",pId);
                    map.put("userId", LoginUser.getLoginUserId());
                    map.put("time",DateUtil.getTime());
                    map.put("hasChild",ConstantUtil.CODE_ZERO);
                    menuMapper.updateParentById(map);
                }
            }
        }
        return result;
    }


    @Override
    public Menu selectByPrimaryKey(String recordId) {
        Menu menu = menuMapper.selectByPrimaryKey(recordId);
        if(menu.getMenuHasChild() == 1){
            throw new ApplicationException(BaseStatus.MENU_DELETE_HASCHILD.getCode(),BaseStatus.MENU_DELETE_HASCHILD.getMessage());
        }
        return menu;
    }


    public Menu findParentNameById(String recordId){
        return menuMapper.findParentNameById(recordId);
    }


    public List<Menu> findRoleByMenuList(String roleId){
        List<Menu> resultList = new ArrayList<>();
        com.csd.system.user.po.User user = userMapper.findUserByUserId(LoginUser.getLoginUserId());
        Map<String,Object> map = new HashMap<>();
        if(!StringUtil.isEmpty(user.getPtJobId())){
            map.put("jobId",user.getPtJobId());
        }
        if(!StringUtil.isEmpty(roleId)){
            map.put("roleId",roleId);
        }
        List<Menu> parentMenuList = menuMapper.findRoleByParentList(map);

        List<Menu> sunMenuList = menuMapper.findRoleBySunList(map);

        int checkMenu = roleMenuMapper.findCheckMenu(map);

        String  str = null;
        if(checkMenu > 0){
            str = "root_parent";
        }
        List<Menu> newParentMenuList = new ArrayList(){};
        newParentMenuList.add(new Menu("root_parent","所有菜单","","false",0,"1",str));

        for (Menu menu : parentMenuList) {
            menu.setMenuPid("root_parent");
            menu.setHasChild(menu.getMenuHasChild() == 0 ? "true" : "false");
            newParentMenuList.add(menu);
        }

        for (Menu parentManu : newParentMenuList) {
            resultList.add(parentManu);
            for (Menu sunMenu : sunMenuList) {
                if (parentManu.getMenuId().equals(sunMenu.getMenuPid())) {
                    sunMenu.setHasChild(sunMenu.getMenuHasChild() == 0 ? "true" : "false");
                    resultList.add(sunMenu);
                    if (sunMenu.getMenuHasChild() == Integer.valueOf(ConstantUtil.CODE_ONE)) {
                        resultList = findSunMenuByAdmin(resultList, sunMenu.getMenuId(), sunMenuList);
                    }
                }

            }
        }
        return resultList;
    }
}
