package com.csd.system.menu.po;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import java.util.List;

public class Menu {
    /**菜单ID*/
    private String menuId;

    /**公司ID*/
    private String menuOrgId;

    /**菜单名称*/
    @NotBlank(message = "菜单名称必须填写")
    private String menuName;

    /**菜单标识码*/
    @NotBlank(message = "菜单标识码必须填写")
    @Pattern(regexp="^[MENU_]+[A-Z]+$",message="菜单标识码必须以MENU_开头")
    private String menuCode;

    /**菜单路径*/
    @NotBlank(message = "菜单路径必须填写")
    private String menuUrl;

    /**父级ID*/
    @NotBlank(message = "父级ID不存在,请重新尝试")
    private String menuPid;

    /**菜单排序*/
    @NotNull(message = "菜单排序必须填写")
    @Min(value = 0 ,message = "排序不能小于0")
    private Integer menuOrder;

    /**是否有子级(0否,1是)*/
    private Integer menuHasChild;

    /**菜单层级*/
    private Integer menuLevel;

    /**创建人ID*/
    private String menuCreateUserId;

    /**创建时间*/
    private String menuCreateTime;

    /**修改时间*/
    private String menuUpdateTime;

    /**修改人ID*/
    private String menuUpdateUserId;

    /**是否生效*/
    private String menuIsValid;

    private boolean expanded = true;

    /**jqgrid*/
    private String hasChild;

    /***/
    private List<Menu> children = null;

    public String getMenuId() {
        return menuId;
    }

    public void setMenuId(String menuId) {
        this.menuId = menuId;
    }

    public String getMenuOrgId() {
        return menuOrgId;
    }

    public void setMenuOrgId(String menuOrgId) {
        this.menuOrgId = menuOrgId;
    }

    public String getMenuName() {
        return menuName;
    }

    public void setMenuName(String menuName) {
        this.menuName = menuName;
    }

    public String getMenuCode() {
        return menuCode;
    }

    public void setMenuCode(String menuCode) {
        this.menuCode = menuCode;
    }

    public String getMenuUrl() {
        return menuUrl;
    }

    public void setMenuUrl(String menuUrl) {
        this.menuUrl = menuUrl;
    }

    public String getMenuPid() {
        return menuPid;
    }

    public void setMenuPid(String menuPid) {
        this.menuPid = menuPid;
    }

    public Integer getMenuOrder() {
        return menuOrder;
    }

    public void setMenuOrder(Integer menuOrder) {
        this.menuOrder = menuOrder;
    }

    public Integer getMenuHasChild() {
        return menuHasChild;
    }

    public void setMenuHasChild(Integer menuHasChild) {
        this.menuHasChild = menuHasChild;
    }

    public Integer getMenuLevel() {
        return menuLevel;
    }

    public void setMenuLevel(Integer menuLevel) {
        this.menuLevel = menuLevel;
    }

    public String getMenuCreateUserId() {
        return menuCreateUserId;
    }

    public void setMenuCreateUserId(String menuCreateUserId) {
        this.menuCreateUserId = menuCreateUserId;
    }

    public String getMenuCreateTime() {
        return menuCreateTime;
    }

    public void setMenuCreateTime(String menuCreateTime) {
        this.menuCreateTime = menuCreateTime;
    }

    public String getMenuUpdateTime() {
        return menuUpdateTime;
    }

    public void setMenuUpdateTime(String menuUpdateTime) {
        this.menuUpdateTime = menuUpdateTime;
    }

    public String getMenuUpdateUserId() {
        return menuUpdateUserId;
    }

    public void setMenuUpdateUserId(String menuUpdateUserId) {
        this.menuUpdateUserId = menuUpdateUserId;
    }

    public String getMenuIsValid() {
        return menuIsValid;
    }

    public void setMenuIsValid(String menuIsValid) {
        this.menuIsValid = menuIsValid;
    }

    public List<Menu> getChildren() {
        return children;
    }

    public void setChildren(List<Menu> children) {
        this.children = children;
    }

    public String getHasChild() {
        return hasChild;
    }

    public void setHasChild(String hasChild) {
        this.hasChild = hasChild;
    }

    public boolean isExpanded() {
        return expanded;
    }

    public void setExpanded(boolean expanded) {
        this.expanded = expanded;
    }

    public Menu(){}

    public Menu(String menuId, String menuName, String menuCode ,String hasChild, Integer menuLevel, String menuIsValid) {
        this.menuId = menuId;
        this.menuName = menuName;
        this.menuCode = menuCode;
        this.hasChild = hasChild;
        this.menuLevel = menuLevel;
        this.menuIsValid = menuIsValid;
    }
}