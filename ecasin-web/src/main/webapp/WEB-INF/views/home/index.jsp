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
<!DOCTYPE html>
<html>
<head>
    <title>首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta charset="utf-8" />
    <meta name="description" content="overview &amp; stats" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />
    <meta http-equiv="expires" content="0">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <%@ include file="/WEB-INF/common/commonCss.jsp"%>
</head>
<body>
<!-- 主页头部 -->
<div class="navbar navbar-default" id="navbar">
    <div class="navbar-container" id="navbar-container">

        <!-- 左上角 -->
        <div class="navbar-header pull-left">
            <a href="javascript:;" class="navbar-brand">
                <small>
                    <i class="icon-leaf"></i>
                    吴大头系统之家
                </small>
            </a>
        </div>

        <!-- 右上角 -->
        <div class="navbar-header pull-right" role="navigation">
            <ul class="nav ace-nav">
                <!--<li class="grey">-->
                <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#">-->
                <!--<i class="icon-tasks"></i>-->
                <!--<span class="badge badge-grey">4</span>-->
                <!--</a>-->

                <!--<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">-->
                <!--<li class="dropdown-header">-->
                <!--<i class="icon-ok"></i>-->
                <!--还有4个任务完成-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<div class="clearfix">-->
                <!--<span class="pull-left">软件更新</span>-->
                <!--<span class="pull-right">65%</span>-->
                <!--</div>-->

                <!--<div class="progress progress-mini ">-->
                <!--<div style="width:65%" class="progress-bar "></div>-->
                <!--</div>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<div class="clearfix">-->
                <!--<span class="pull-left">硬件更新</span>-->
                <!--<span class="pull-right">35%</span>-->
                <!--</div>-->

                <!--<div class="progress progress-mini ">-->
                <!--<div style="width:35%" class="progress-bar progress-bar-danger"></div>-->
                <!--</div>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<div class="clearfix">-->
                <!--<span class="pull-left">单元测试</span>-->
                <!--<span class="pull-right">15%</span>-->
                <!--</div>-->

                <!--<div class="progress progress-mini ">-->
                <!--<div style="width:15%" class="progress-bar progress-bar-warning"></div>-->
                <!--</div>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<div class="clearfix">-->
                <!--<span class="pull-left">错误修复</span>-->
                <!--<span class="pull-right">90%</span>-->
                <!--</div>-->

                <!--<div class="progress progress-mini progress-striped active">-->
                <!--<div style="width:90%" class="progress-bar progress-bar-success"></div>-->
                <!--</div>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--查看任务详情-->
                <!--<i class="icon-arrow-right"></i>-->
                <!--</a>-->
                <!--</li>-->
                <!--</ul>-->
                <!--</li>-->

                <!--<li class="purple">-->
                <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#">-->
                <!--<i class="icon-bell-alt icon-animated-bell"></i>-->
                <!--<span class="badge badge-important">8</span>-->
                <!--</a>-->

                <!--<ul class="pull-right dropdown-navbar navbar-pink dropdown-menu dropdown-caret dropdown-close">-->
                <!--<li class="dropdown-header">-->
                <!--<i class="icon-warning-sign"></i>-->
                <!--8条通知-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<div class="clearfix">-->
                <!--<span class="pull-left">-->
                <!--<i class="btn btn-xs no-hover btn-pink icon-comment"></i>-->
                <!--新闻评论-->
                <!--</span>-->
                <!--<span class="pull-right badge badge-info">+12</span>-->
                <!--</div>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<i class="btn btn-xs btn-primary icon-user"></i>-->
                <!--切换为编辑登录..-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<div class="clearfix">-->
                <!--<span class="pull-left">-->
                <!--<i class="btn btn-xs no-hover btn-success icon-shopping-cart"></i>-->
                <!--新订单-->
                <!--</span>-->
                <!--<span class="pull-right badge badge-success">+8</span>-->
                <!--</div>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--<div class="clearfix">-->
                <!--<span class="pull-left">-->
                <!--<i class="btn btn-xs no-hover btn-info icon-twitter"></i>-->
                <!--粉丝-->
                <!--</span>-->
                <!--<span class="pull-right badge badge-info">+11</span>-->
                <!--</div>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--查看所有通知-->
                <!--<i class="icon-arrow-right"></i>-->
                <!--</a>-->
                <!--</li>-->
                <!--</ul>-->
                <!--</li>-->

                <!--<li class="green">-->
                <!--<a data-toggle="dropdown" class="dropdown-toggle" href="#">-->
                <!--<i class="icon-envelope icon-animated-vertical"></i>-->
                <!--<span class="badge badge-success">5</span>-->
                <!--</a>-->

                <!--<ul class="pull-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close">-->
                <!--<li class="dropdown-header">-->
                <!--<i class="icon-envelope-alt"></i>-->
                <!--5条消息-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--&lt;!&ndash;<img src="assets/avatars/avatar.png" class="msg-photo" alt="Alex's Avatar"/>&ndash;&gt;-->
                <!--<span class="msg-body">-->
                <!--<span class="msg-title">-->
                <!--<span class="blue">Alex:</span>-->
                <!--不知道写啥 ...-->
                <!--</span>-->

                <!--<span class="msg-time">-->
                <!--<i class="icon-time"></i>-->
                <!--<span>1分钟以前</span>-->
                <!--</span>-->
                <!--</span>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--&lt;!&ndash;<img src="assets/avatars/avatar3.png" class="msg-photo" alt="Susan's Avatar"/>&ndash;&gt;-->
                <!--<span class="msg-body">-->
                <!--<span class="msg-title">-->
                <!--<span class="blue">Susan:</span>-->
                <!--不知道翻译...-->
                <!--</span>-->

                <!--<span class="msg-time">-->
                <!--<i class="icon-time"></i>-->
                <!--<span>20分钟以前</span>-->
                <!--</span>-->
                <!--</span>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="#">-->
                <!--&lt;!&ndash;<img src="assets/avatars/avatar4.png" class="msg-photo" alt="Bob's Avatar"/>&ndash;&gt;-->
                <!--<span class="msg-body">-->
                <!--<span class="msg-title">-->
                <!--<span class="blue">Bob:</span>-->
                <!--到底是不是英文 ...-->
                <!--</span>-->

                <!--<span class="msg-time">-->
                <!--<i class="icon-time"></i>-->
                <!--<span>下午3:15</span>-->
                <!--</span>-->
                <!--</span>-->
                <!--</a>-->
                <!--</li>-->

                <!--<li>-->
                <!--<a href="inbox.html">-->
                <!--查看所有消息-->
                <!--<i class="icon-arrow-right"></i>-->
                <!--</a>-->
                <!--</li>-->
                <!--</ul>-->
                <!--</li>-->

                <li class="light-blue" id="login-li">
                    <a data-toggle="dropdown" href="#" class="dropdown-toggle" id="login-a">
                        <svg class="icon" aria-hidden="true" id="login-svg">
                            <use xlink:href="#icon-ai-user"></use>
                        </svg>
                        <span class="user-info">
							<span id="login-user-name">${userName}</span>&nbsp;：你好，欢迎登录本系统&nbsp;！
                        </span>
                        <i class="icon-caret-down" id="login-i"></i>
                    </a>

                    <ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
                        <li>
                            <a href="#">
                                <i class="icon-cog"></i>
                                设置
                            </a>
                        </li>

                        <li>
                            <a href="#">
                                <i class="icon-user"></i>
                                个人资料
                            </a>
                        </li>

                        <li class="divider"></li>

                        <li>
                            <a href="${ctx}/logout" onclick="logout()">
                                <i class="icon-off"></i>
                                退出
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
<div class="main-container" id="main-container">

    <div class="main-container-inner">
        <a class="menu-toggler" id="menu-toggler" href="#">
            <span class="menu-text"></span>
        </a>

        <!-- 左边菜单 -->
        <div class="sidebar" id="sidebar">
            <!--  上面4个按钮  -->
            <div class="sidebar-shortcuts" id="sidebar-shortcuts">
                <div class="sidebar-shortcuts-large" id="sidebar-shortcuts-large">
                    <button class="btn btn-success">
                        <i class="icon-signal"></i>
                    </button>

                    <button class="btn btn-info">
                        <i class="icon-pencil"></i>
                    </button>

                    <button class="btn btn-warning">
                        <i class="icon-group"></i>
                    </button>

                    <button class="btn btn-danger">
                        <i class="icon-cogs"></i>
                    </button>
                </div>

                <div class="sidebar-shortcuts-mini" id="sidebar-shortcuts-mini">
                    <span class="btn btn-success"></span>

                    <span class="btn btn-info"></span>

                    <span class="btn btn-warning"></span>

                    <span class="btn btn-danger"></span>
                </div>
            </div>
            <!--  菜单导航  -->
            <ul class="nav nav-list" id="navMenu"></ul>
            <!-- 点击隐藏  -->
            <div class="sidebar-collapse" id="sidebar-collapse">
                <i class="icon-double-angle-left" data-icon1="icon-double-angle-left"
                   data-icon2="icon-double-angle-right"></i>
            </div>
        </div>

        <div class="main-content">
            <!--  头部 URL 显示  -->
            <div class="breadcrumbs" id="breadcrumbs">
                <ul class="breadcrumb" id="topMenu">

                </ul>

                <!-- 右上角搜索框 -->
                <div class="nav-search" id="nav-search">
                    <form class="form-search">
								<span class="input-icon">
									<input type="text" placeholder="Search ..." class="nav-search-input"
                                           id="nav-search-input" autocomplete="off"/>
									<i class="icon-search nav-search-icon"></i>
								</span>
                    </form>
                </div>
            </div>
            <!--  中部  -->
            <div class="page-content" id="content-page"></div>
        </div>

        <!-- 右上角设置按钮 -->
        <div class="ace-settings-container" id="ace-settings-container">
            <div class="btn btn-app btn-xs btn-warning ace-settings-btn" id="ace-settings-btn">
                <i class="icon-cog bigger-150"></i>
            </div>

            <div class="ace-settings-box" id="ace-settings-box">
                <div>
                    <div class="pull-left">
                        <select id="skin-colorpicker" class="hide">
                            <option data-skin="default" value="#438EB9">#438EB9</option>
                            <option data-skin="skin-1" value="#222A2D">#222A2D</option>
                            <option data-skin="skin-2" value="#C6487E">#C6487E</option>
                            <option data-skin="skin-3" value="#D0D0D0">#D0D0D0</option>
                        </select>
                    </div>
                    <span>&nbsp; 选择皮肤</span>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-navbar"/>
                    <label class="lbl" for="ace-settings-navbar"> 固定导航条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-sidebar"/>
                    <label class="lbl" for="ace-settings-sidebar"> 固定滑动条</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-breadcrumbs"/>
                    <label class="lbl" for="ace-settings-breadcrumbs">固定面包屑</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-rtl"/>
                    <label class="lbl" for="ace-settings-rtl">切换到左边</label>
                </div>

                <div>
                    <input type="checkbox" class="ace ace-checkbox-2" id="ace-settings-add-container"/>
                    <label class="lbl" for="ace-settings-add-container">
                        切换窄屏
                        <b></b>
                    </label>
                </div>
            </div>
        </div>
    </div>

    <a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
        <i class="icon-double-angle-up icon-only bigger-110"></i>
    </a>
</div>
<div>
    <%@ include file="/WEB-INF/common/commonJs.jsp"%>
    <div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</div>
</body>
</html>
