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
<html>
<head>
    <title>403</title>
    <link href="${ctx}/static/css/index/login.css" rel="stylesheet"/>
</head>
<body>
<div>
    <div>

    </div>
    <div id="successDiv" style="width: 100%;height: 100%;background-color: #ebebeb;">
        <div id="successDiv2" style="position: fixed;width: 100%;height: 50%;background-color: #008ead;">
            <img id="successImg" src="${ctx}/static/images/error403.jpg">
            <span>${notAuth}<a href="${ctx}/login">返回登录页面</a></span>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/common/commonJs.jsp"%>
<script type="text/javascript" src="${ctx}/static/js/index/login.js"></script>
</body>
</html>
