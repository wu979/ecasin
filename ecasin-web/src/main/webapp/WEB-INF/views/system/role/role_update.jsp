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
    <div class="modal-body">
        <form id="form_update">
            <input type="hidden" class="col-xs-12 col-sm-8" readonly id="roleId" name="roleId"/>
            <div class="form-group">
                <div class="col-xs-4 col-sm-3">
                    <label class="col-sm-12 control-label no-padding-right">原始名称</label>
                </div>
                <div class="col-xs-8 col-sm-9">
                    <input type="text" class="col-xs-12 col-sm-8" readonly id="roleName"/>
                </div>
            </div>
            <div class="form-group">
                <div class="col-xs-4 col-sm-3">
                    <label class="col-sm-12 control-label no-padding-right">角色名称</label>
                </div>
                <div class="col-xs-8 col-sm-9">
                    <input type="text" class="col-xs-12 col-sm-8" name="roleName"/>
                </div>
            </div>
        </form>
    </div>
</div>
<div>
    <%@ include file="/WEB-INF/common/commonJs.jsp"%>
    <script src="${ctx}/static/js/system/role/role.js"></script>
</div>