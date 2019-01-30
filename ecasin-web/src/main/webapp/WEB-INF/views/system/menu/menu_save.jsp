<%--
  Created by IntelliJ IDEA.
  User: admins
  Date: 2019/1/30
  Time: 17:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <!-- 头部 -->
    <div class="page-content" style="overflow: hidden;">
        <div class="modal-body">
            <form id="form_save">
                <input type="hidden" class="col-xs-12 col-sm-8" readonly="readonly" id="menuPid" name="menuPid"/>
                <div class="form-group">
                    <div class="col-xs-4 col-sm-3">
                        <label class="col-sm-12 control-label no-padding-right" >父级菜单</label>
                    </div>
                    <div class="col-xs-8 col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-8" readonly="readonly" id="parentName" name="parentName"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-4 col-sm-3">
                        <label class="col-sm-12 control-label no-padding-right">菜单名称</label>
                    </div>
                    <div class="col-xs-8 col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-8" name="menuName"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-4 col-sm-3">
                        <label class="col-sm-12 control-label no-padding-right" >菜单标识码</label>
                    </div>
                    <div class="col-xs-8 col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-8" name="menuCode"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-4 col-sm-3">
                        <label class="col-sm-12 control-label no-padding-right" >菜单路径</label>
                    </div>
                    <div class="col-xs-8 col-sm-9">
                        <input type="text" class="col-xs-12 col-sm-8" name="menuUrl"/>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-xs-4 col-sm-3">
                        <label class="col-sm-12 control-label no-padding-right" >菜单排序</label>
                    </div>
                    <div class="col-xs-8 col-sm-9">
                        <input type="number" class="col-xs-12 col-sm-8" name="menuOrder"/>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div>
        <%@ include file="/WEB-INF/common/commonJs.jsp"%>
        <script src="${ctx}/static/js/system/menu/menu.js"></script>
        <script src="${ctx}/static/js/index/date.js"></script>
    </div>


