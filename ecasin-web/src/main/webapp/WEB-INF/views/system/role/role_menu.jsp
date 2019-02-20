<%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2019/1/30
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<%@ include file="/WEB-INF/common/commonCss.jsp"%>
<!-- 头部 -->
<div class="page-content" style="overflow: hidden;">
    <input type="hidden" class="col-xs-12 col-sm-8" readonly id="roleId"/>
    <div class="modal-body">
        <div class="form-group">
            <!-- xs 最小屏幕  md 中等屏幕  lg 大屏幕 -->
            <div class="col-xs-3 col-md-2 col-lg-2 tree-div">
                <ul id="contentTree" class="ztree">
                </ul>
            </div>
        </div>
    </div>
</div>
<div>
    <%@ include file="/WEB-INF/common/commonJs.jsp"%>
    <script src="${ctx}/static/js/system/role/role.js"></script>
</div>
