package com.csd.system.menu.po;

import java.util.ArrayList;
import java.util.List;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 16:53.
 */
public class Tree {

    /** 节点ID*/
    private String id;

    /** 上级节点ID*/
    private String parentId;

    /** 节点名称*/
    private String title;

    /** 菜单标识码 **/
    private String code;

    /** 层级*/
    private Integer level;

    /** 是否最后一级节点*/
    private Integer isLast;

    /** 自定义图标class*/
    private String iconClass;

    /** 排序 */
    private Integer order;

    /** 菜单路径 */
    private String url;

    /** 表示用户自定义需要存储在树节点中的数据*/
    private Object basicData;

    /** 子节点集合*/
    private List<Tree> children = new ArrayList<Tree>();


    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Integer getIsLast() {
        return isLast;
    }

    public void setIsLast(Integer isLast) {
        this.isLast = isLast;
    }

    public String getIconClass() {
        return iconClass;
    }

    public void setIconClass(String iconClass) {
        this.iconClass = iconClass;
    }

    public Integer getOrder() {
        return order;
    }

    public void setOrder(Integer order) {
        this.order = order;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public Object getBasicData() {
        return basicData;
    }

    public void setBasicData(Object basicData) {
        this.basicData = basicData;
    }

    public List<Tree> getChildren() {
        return children;
    }

    public void setChildren(List<Tree> children) {
        this.children = children;
    }

}
