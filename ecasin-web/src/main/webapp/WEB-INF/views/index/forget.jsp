<%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2019/1/30
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<div class="login-warp">
    <div class="login-bgc"></div>
    <input type="checkbox" id="password-select">
    <div class="login-box">
        <div class="flipInX animaiton-div">
            <form id="formSubmit">
                <input type="hidden" value="2" name="type" id="type"/>
                <div class="login-cartoon"></div>
                <div class="input-group" data-type="text">
                    <input type="text" placeholder="请输入手机号"  name="userPhone" id="phone">
                </div>
                <div class="input-group get-code" data-type="password" data-security="password">
                    <input type="text" placeholder="请输入验证码"  name="code" class="code-input">
                    <input class="code-botton" id="getCode" value="免费获取验证码" type="button"/>
                </div>
                <div class="input-group" data-type="password">
                    <input id="password" type="password" placeholder="请输入新的密码" name="userPassword">
                </div>
                <div class="input-group" data-type="password">
                    <input id="password2" type="password" placeholder="再次输入新的密码" name="repeatPassword">
                </div>
                <hr class="hr">
                <dl class="login-button">
                    <dd><input class="sign-in" id="isActive" value="提交" type="button"/></dd>
                    <dd><a class="forget" id="goLogin">前往登录页</a></dd>
                </dl>
            </form>
        </div>
    </div>
</div>
<div>
    <script src="${ctx}/static/js/index/login.js"></script>
</div>
