package com.csd.exception.status;

/**
 * @desc:
 * @author: wsw
 * @email: 18683789594@163.com
 * @date: 2019/1/29 13:20.
 */
public enum BaseStatus {


    EXCAPTION(-1,"未知错误"),
    SUCCESS(0,"成功"),
    ERROR(1,"失败"),
    PARAMETER(2,"参数错误"),
    DELETE_NULL(3,"删除失败,请选择至少一条数据"),
    SIGN_PHONE_EXIST(1000,"手机号已激活或正在等待确认,请勿重复操作"),
    PASSWORD_NOT_LIKE(1001,"两次密码不一致,请重新输入"),
    CODE_NOT_EXIST(1002,"验证码不存在,请确认手机号"),
    CODE_IS_ERROR(1003,"验证码错误,请重新输入"),
    CODE_IS_OVERDUE(1004,"验证码已过期,请重新获取"),
    USER_IS_NOT_EXIST(1005,"用户不存在,请联系管理员"),
    PHONE_NOT_EXIST(1006,"请输入手机号"),
    CODE_SEND_ERROR(1007,"验证码发送失败"),
    PHONE_WAIT_CONFIRM(1008,"正在等待激活确认,请稍后在试"),
    MENU_NAME_EXIST(1008,"菜案名称已存在,请重新输入"),
    MENU_DELETE_HASCHILD(1009,"如需操作该菜单,请先删除子菜单"),
    ROLE_ADMIN_NOT_DELETE(1010,"超级管理员不能进行操作")
    ;

    private int code;

    private String message;

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    BaseStatus(int code, String message){
        this.code = code;
        this.message = message;
    }


}
