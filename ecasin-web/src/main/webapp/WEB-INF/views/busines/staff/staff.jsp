<%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2019/2/27
  Time: 16:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!-- 头部 -->
<div class="page-content" style="overflow: hidden;">
    <div class="col-sm-12 col-md-12 col-lg-12">
        <!-- 组织架构 -->
        <div class="col-sm-2 col-md-2 col-lg-2">
            <div class="widget-box">
                <div class="widget-body tree-div">
                    <div class="widget-main padding-8">
                        <div id="contentTree" class="ztree"></div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 档案列表 -->
        <div class="col-sm-10 col-md-10 col-lg-10">
            <div>
                <form>
                    <div class="row">
                        <div class="col-sm-7 col-md-7 col-lg-3">
                            <div class="input-group">
                                <div class="col-sm-4 col-md-4 col-lg-4" style="padding-left: unset">
                                    <input type="text" class="form-control" id="busName" placeholder="名称模糊查询">
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <select class="select-option form-control" id="active">
                                        <option value="0">全部</option>
                                    </select>
                                </div>
                                <div class="col-sm-4 col-md-4 col-lg-4">
                                    <select class="select-option form-control" id="state">
                                        <option value="0">全部</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-5 col-md-5 col-lg-9 form-select">
                            <button type="button" id="select" class="btn btn-light btn-sm">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-sousuo"></use>
                                </svg>
                                &nbsp;&nbsp;查询
                            </button>
                            <button type="button" id="selectAll" class="btn btn-light btn-sm">
                                <svg class="icon" aria-hidden="true">
                                    <use xlink:href="#icon-shuaxin"></use>
                                </svg>
                                &nbsp;&nbsp;显示全部
                            </button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="hr hr10 hr-dotted" style="margin: 20px 0"></div>
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
                    <button class="btn btn-light btn-sm menu-authority" type="button" style="width: 105px;">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-caidan"></use>
                        </svg>
                        &nbsp;&nbsp;菜单授权
                    </button>
                    <button class="btn btn-light btn-sm job-authority" type="button" style="width: 105px;">
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-jiaoseshouquan"></use>
                        </svg>
                        &nbsp;&nbsp;职位授权
                    </button>
                    <div style="margin: 20px 0"></div>

                    <table id="jqTable" class="jqTable"></table>
                    <div id="grid-pager" style="height: 50px;"></div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="${ctx}/static/js/busines/staff/staff.js" type="text/javascript"></script>
<script src="${ctx}/static/js/index/date.js" type="text/javascript"></script>


