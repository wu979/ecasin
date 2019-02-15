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
<!-- 头部 -->
<div class="page-content" style="overflow: hidden;">
    <div class="row">
        <!-- 第一层绿色 -->
        <div class="col-xs-12 form-bnt">
            <button class="btn btn-light btn-sm save" type="button">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-tianjia"></use>
                </svg>
                &nbsp;&nbsp;新增
            </button>
            <button class="btn btn-light btn-sm update" type="button">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-xiugaimima"></use>
                </svg>
                &nbsp;&nbsp;修改
            </button>
            <button class="btn btn-light btn-sm delete" type="button">
                <svg class="icon" aria-hidden="true">
                    <use xlink:href="#icon-shanchuqunchengyuan"></use>
                </svg>
                &nbsp;&nbsp;删除
            </button>
            <div style="margin: 20px 0"></div>

            <table id="jqTable"></table>
            <div id="grid-pager" style="height: 50px;"></div>
        </div>
    </div>
</div>
<script src="${ctx}/static/js/system/role/role.js" type="text/javascript"></script>
