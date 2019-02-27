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
    <input type="hidden" class="col-xs-12 col-sm-8" readonly id="roleType"/>
    <div class="modal-body">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <div class="col-sm-7 col-md-7 col-lg-7">
                <!-- 树形 -->
                <div class="col-sm-3 col-md-3 col-lg-3">
                    <div class="widget-box">
                        <div class="widget-body tree-div">
                            <div class="widget-main padding-8">
                                <div id="contentTree" class="ztree"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 职位未选列表 -->
                <div class="col-sm-8 col-md-8 col-lg-8" style="height: 70%">
                    <table id="jqTable-unSelect" class="jqTable modal-jqTable"></table>
                    <div id="grid-pager-unSelect" style="height: 50px;"></div>
                </div>
                <!-- 图标 -->
                <div class="col-sm-1 col-md-1 col-lg-1">
                    <div style="padding-top: 105px;">
                        <button class='btn btn-light btn-sm page-button-save' title="添加" id="page-button-save">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-youjiantou"></use>
                            </svg>
                        </button>
                        <br>
                        <button class='btn btn-light btn-sm page-button-delete' title="移除" id="page-button-delete">
                            <svg class="icon" aria-hidden="true">
                                <use xlink:href="#icon-zuojiantou"></use>
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
            <!-- 职位已选列表 -->
            <div class="col-sm-5 col-md-5 col-lg-5" style="height: 70%">
                <table id="jqTable-select" class="jqTable modal-jqTable"></table>
                <div id="grid-pager-select" style="height: 50px;"></div>
            </div>
        </div>
    </div>
</div>
<div>
    <%@ include file="/WEB-INF/common/commonJs.jsp"%>
    <script src="${ctx}/static/js/system/role/role.js"></script>
</div>
