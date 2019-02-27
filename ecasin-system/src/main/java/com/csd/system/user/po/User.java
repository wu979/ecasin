package com.csd.system.user.po;

import com.csd.common.service.EntityService;
import com.csd.system.role.po.Role;

import java.util.List;

public class User {
    /**用户主键*/
    private String userId;

    /**公司ID*/
    private String userOrgId;

    /**部门ID*/
    private String userDepId;

    /**用户姓名*/
    private String userName;

    /**用户登录号*/
    private String userPhone;

    /**用户密码*/
    private String userPassword;

    /**用户性别*/
    private String userSex;

    /**用户地址*/
    private String userAddress;

    /**是否生效*/
    private String userIsValid;

    /**账户激活(1待激活，2已激活，3冻结)*/
    private String userIsActive;

    /**员工工号*/
    private Integer userNumber;

    /**籍贯*/
    private String userNativePlace;

    /**身份证*/
    private String userIdNumber;

    /**人员状态(1在职人员，2离职人员，3休假人员，4停职人员）*/
    private String userState;

    /**人员类型（0超级管理员，1平台管理员，2公司管理员, 3普通员工*/
    private String userType;

    /**备注*/
    private String userNotice;

    /**头像路径*/
    private String userHeadUrl;

    /**创建时间*/
    private String userCreateTime;

    /**修改时间*/
    private String userUpdateTime;

    /**创建人ID*/
    private String userCreateUserId;

    /**创建人名称*/
    private String userCreateUserName;

    /**修改人ID*/
    private String userUpdateUserId;

    /**修改人名称*/
    private String userUpdateUserName;

    /**联查用户主职位*/
    private String ptJobId;

    /**赋值用户角色*/
    private List<Role> roleList = null;

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserOrgId() {
        return userOrgId;
    }

    public void setUserOrgId(String userOrgId) {
        this.userOrgId = userOrgId;
    }

    public String getUserDepId() {
        return userDepId;
    }

    public void setUserDepId(String userDepId) {
        this.userDepId = userDepId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserIsValid() {
        return userIsValid;
    }

    public void setUserIsValid(String userIsValid) {
        this.userIsValid = userIsValid;
    }

    public String getUserIsActive() {
        return userIsActive;
    }

    public void setUserIsActive(String userIsActive) {
        this.userIsActive = userIsActive;
    }

    public Integer getUserNumber() {
        return userNumber;
    }

    public void setUserNumber(Integer userNumber) {
        this.userNumber = userNumber;
    }

    public String getUserNativePlace() {
        return userNativePlace;
    }

    public void setUserNativePlace(String userNativePlace) {
        this.userNativePlace = userNativePlace;
    }

    public String getUserIdNumber() {
        return userIdNumber;
    }

    public void setUserIdNumber(String userIdNumber) {
        this.userIdNumber = userIdNumber;
    }

    public String getUserState() {
        return userState;
    }

    public void setUserState(String userState) {
        this.userState = userState;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }

    public String getUserNotice() {
        return userNotice;
    }

    public void setUserNotice(String userNotice) {
        this.userNotice = userNotice;
    }

    public String getUserHeadUrl() {
        return userHeadUrl;
    }

    public void setUserHeadUrl(String userHeadUrl) {
        this.userHeadUrl = userHeadUrl;
    }

    public String getUserCreateTime() {
        return userCreateTime;
    }

    public void setUserCreateTime(String userCreateTime) {
        this.userCreateTime = userCreateTime;
    }

    public String getUserUpdateTime() {
        return userUpdateTime;
    }

    public void setUserUpdateTime(String userUpdateTime) {
        this.userUpdateTime = userUpdateTime;
    }

    public String getUserCreateUserId() {
        return userCreateUserId;
    }

    public void setUserCreateUserId(String userCreateUserId) {
        this.userCreateUserId = userCreateUserId;
    }

    public String getUserCreateUserName() {
        return userCreateUserName;
    }

    public void setUserCreateUserName(String userCreateUserName) {
        this.userCreateUserName = userCreateUserName;
    }

    public String getUserUpdateUserId() {
        return userUpdateUserId;
    }

    public void setUserUpdateUserId(String userUpdateUserId) {
        this.userUpdateUserId = userUpdateUserId;
    }

    public String getUserUpdateUserName() {
        return userUpdateUserName;
    }

    public void setUserUpdateUserName(String userUpdateUserName) {
        this.userUpdateUserName = userUpdateUserName;
    }

    public String getPtJobId() {
        return ptJobId;
    }

    public void setPtJobId(String ptJobId) {
        this.ptJobId = ptJobId;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }
}