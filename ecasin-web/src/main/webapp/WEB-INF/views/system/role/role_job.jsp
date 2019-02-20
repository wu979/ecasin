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
            <!-- 树形 -->
            <!-- xs 最小屏幕  md 中等屏幕  lg 大屏幕 -->
            <%--<div class=" col-sm-3 col-md-3">--%>
                <%--<div class="col-xs-3 col-md-2 col-lg-2 tree-div">--%>
                    <%--<ul id="contentTree" class="ztree">--%>
                    <%--</ul>--%>
                <%--</div>--%>
            <%--</div>--%>



            <div class="col-sm-3 col-md-3 col-lg-3">
                <div class="widget-box">
                    <div class="widget-body tree-div">
                        <div class="widget-main padding-8">
                            <div id="contentTree" class="ztree"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-9 col-md-9 col-lg-9">
                <!-- 职位未选列表 -->
                <div class="col-sm-5 col-md-5 col-lg-5" style="height: 79%">
                    <table id="jqTable-unSelect"></table>
                    <div id="grid-pager-unSelect" style="height: 50px;"></div>
                </div>
                <div class="col-sm-2 col-md-2 col-lg-2" style="padding-top: 105px;">
                    <button class='btn btn-light btn-sm page-button-update'>
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-youjiantou"></use>
                        </svg>
                    </button>
                    <br>
                    <button class='btn btn-light btn-sm page-button-update'>
                        <svg class="icon" aria-hidden="true">
                            <use xlink:href="#icon-zuojiantou"></use>
                        </svg>
                    </button>
                </div>
                <!-- 职位已选列表 -->
                <div class="col-sm-5 col-md-5 col-lg-5" style="height: 75%">
                    <table id="jqTable-select"></table>
                    <div id="grid-pager-select" ></div>
                </div>
            </div>
        </div>



    </div>
</div>
<div>
    <%@ include file="/WEB-INF/common/commonJs.jsp"%>
    <script src="${ctx}/static/js/system/role/role.js"></script>
    <script>
        function selectJob(){

        var roleId = $("#roleId").val();

        jQuery("#jqTable-select").jqGrid({
            url:ctx + "/job/findRoleByJobList",
            postData:{ roleId: roleId },
            datatype:'json',
            pager:'#grid-pager-select',
            mtype:"POST",
            height:"75%",
            caption:"已选职位列表",
            colNames:
                [
                    "id",'',"公司名称","部门名称","角色名称"
                ],
            colModel:
                [
                    {name:"jobId",index:"jobId",width:1,key:true,hidden:true,sortable: false},
                    {name:"action", index: "action", width: 1, hidden: false,sortable: false},
                    {name:"entityOrgName",index:"entityOrgName",width:3,hidden:false,sortable: false},
                    {name:"entityDepName",index:"entityDepName",width:3,hidden:false,sortable: false},
                    {name:"jobName",index:"jobName",width:2,hidden:false,sortable: false},
                ],
            rowNum: 5,
            rowList: [5, 10, 15],
            viewrecords: true,
            rownumbers: true,
            rownumWidth: 10,
            altRows: true,
            autowidth: true,
            multiselect: false,
            multiboxonly: false,
            jsonReader: {
                root: "result",
                total: 'totalPages',
                page: 'page',
                records: 'records'
            },
            loadComplete: function () {
                $('td').css({
                    'text-align': 'center'
                })
                $('th div').css({
                    'text-align': 'center'
                });
                var table = this;
                setTimeout(function () {
                    updatePagerIcons(table);
                }, 0);
                updatePagerIcons(table);
            },
            onSelectRow:function (id){
                // var all = $("#jqTable").jqGrid('getRowData', id);
                // var recordId = all.menuId;
                // var rowData = $("#groupManage-table").jqGrid("getRowData", ids[0]);
                // rowData = all;
            },
            gridComplete:function (){
                var ids = $("#jqTable-select").jqGrid('getDataIDs');
                for (var i = 0; i < ids.length; i++) {
                    var cl = ids[i];
                    checkbox = "<label style=\"padding-left:2px;padding-top:3px\"><input name=\"grid-checkbox\" value=\""
                        + cl + "\"type=\"checkbox\" class=\"ace\"><span class=\"lbl\"></span></label>";
                    $("#jqTable-select").jqGrid('setRowData', ids[i], {action: checkbox});
                }
                /**
                 * 点击菜单边框收缩菜单时，动态变化表格宽度
                 */
                $('#sidebar-collapse').click (function(){
                    var winwidth=$('.main-content .col-xs-12').width(); // 当前窗口中，一行的宽度
                    $("#jqTable-select").setGridWidth(winwidth);
                    $('.ui-jqgrid-bdiv').css ('width',winwidth+1);
                });
            }
        })
    }
    </script>
</div>
