<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>登录</title>
    <link href="${ctx}/static/ico/favicon.ico" type="image/x-icon" rel="icon"/>
    <link href="${ctx}/static/css/index/login.css" rel="stylesheet"/>
    <link href="${ctx}/static/css/index/animation.css" rel="stylesheet">
</head>
<body>
<div class="login-warp">
    <div class="login-bgc"></div>
    <input type="checkbox" id="password-select">
    <div class="login-box">
        <div class="flipInX animaiton-div">
            <form action="${ctx}/userLogin" method="post">
                <div class="login-cartoon"></div>
                <div class="input-group" data-type="text">
                    <input type="text" placeholder="请输入手机号"  name="username">
                </div>
                <div class="input-group" data-type="password">
                    <input id="password" type="password" placeholder="请输入密码" name="password">
                </div>
                <div class="input-group" data-type="code">
                    <input id="code" type="text" placeholder="请输入验证码" name="validCode">
                    <img id="imgCode" src="" class="code-image">
                </div>
                <div>
                    <span id="loginError" class="errorSpan">${loginError}</span>
                </div>
                <hr class="hr">
                <dl class="login-button">
                    <dt><a class="forget" id="forget">忘记密码</a></dt>
                    <dd><button type="submit" class="sign-in" id="login-bnt">登录</button></dd>
                    <dd><a class="sign-up" id="sign">激活</a></dd>
                </dl>
            </form>
        </div>
    </div>
</div>
<div>
    <%@ include file="/WEB-INF/common/commonJs.jsp"%>
    <script src="${ctx}/static/js/index/login.js"></script>
    <script>
        $(document).keyup(function(event){
            if(event.keyCode ==13){
                $("#index-bnt").trigger("click");
            }
        });

        <%--$(function () {--%>
            <%--var loginError = $("#loginError").attr('value');--%>
            <%--if(loginError != null && loginError != ''){--%>
                <%--layer.msg(loginError);--%>
                <%--setTimeout(function () {--%>
                    <%--location.href = '${ctx}/login';--%>
                <%--},1000)--%>
            <%--}--%>
        <%--})--%>
    </script>
</div>
</body>
</html>
