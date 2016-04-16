<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <meta name="viewpo<%@ page contentType="text/html;charset=UTF-8" language="java" %>rt" content="width=device-width, initial-scale=1">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Aligo-Admin-座位管理/查看座位明细</title>
    <link href="<%=basePath%>resource/css/bootstrap.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="<%=basePath%>resource/js/bootstrap.min.js"></script>
    <link href="<%=basePath%>resource/css/style.css" rel="stylesheet">
    <link href="<%=basePath%>resource/css/theme.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->


</head>
<body>

<div class="navbar  navbar-inverse " role="navigation" id="menu-nav">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">Aligo&nbsp;&nbsp;&nbsp;阿里学习加油站&nbsp;&nbsp;</a>
        </div>
        <div class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">课程管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="admin_LoadCoachCourse.action">师资安排</a></li>
                        <li><a href="admin_GetStudentSchedule.action">查看学生课表</a></li>
                        <li><a href="admin_GetCoachSchedule.action">查看Coach课表</a></li>
                        <li><a href="admin_GetFeedback.action">查看反馈</a></li>
                    </ul>
                </li>
                <li class="active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">座位管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="admin_GetSeatInfo.action" data-tab="tab-chrome">查看座位资源</a></li>
                    </ul>
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">财务管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="admin_GetPALInfo.action" data-tab="tab-chrome">查看每月盈亏</a></li>
                        <li><a href="admin_GetDayIncome.action" data-tab="tab-firefox">每日收支管理</a></li>
                        <li><a href="admin_GetSalary.action">薪资管理</a></li>
                        <li><a href="admin_GetClassConsume.action" data-tab="tab-chrome">课消管理</a></li>
                        <li><a href="admin_Payment.action" data-tab="tab-firefox">课程收费标准管理</a></li>
                    </ul>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">教务管理员：Admin<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">消息</a></li>
                        <li><a href="#">设置</a></li>
                        <li><a href="#">查看更多</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
</div>


<div id="second">
    <ul class="nav nav-tabs" role="tablist">
        <li class="active"><a href="#A" role="tab" data-toggle="tab">查看座位资源</a></li>
    </ul>
</div>

<div class="tab-pane">
    <div id="table1" class="table-responsive clearfix">
        <table class="table table-bordered ">
            <thead>
            <tr>
                <th class="time-sort"></th>
                <th class="week">星期一/Mon</th>
                <th class="week">星期二/Tue</th>
                <th class="week">星期三/Wed</th>
                <th class="week">星期四/Thu</th>
                <th class="week">星期五/Fri</th>
                <th class="week">星期六/Sat</th>
                <th class="week">星期日/Sun</th>
            </tr>
            </thead>
            <c:set var="time" value="8"></c:set>
            <c:set var="flag" value="0"></c:set>
            <tbody>
            <c:forEach items="${state}" var="state" >
                <tr>
                    <td>${time}:<c:if test="${flag==0}">00-${time}:30</c:if>
                        <c:if test="${flag==1}">30-${time + 1}:00
                            <c:set var="time" value="${time + 1}"></c:set>
                        </c:if>
                    </td>
                    <c:set var="flag" value="${(flag + 1) % 2}"></c:set>
                    <c:forEach begin="0" end="6" var="i">
                        <td><c:if test= "${state[i] != 0}">${state[i]}</c:if></td>
                    </c:forEach>
                </tr>
            </c:forEach>
            </tbody>

        </table>
    </div>


    <div id="table2">
        <nav>
            <ul class="pagination">
                <li>
                    <a aria-label="Previous">
                        <span aria-hidden="true">上一页</span>
                    </a>
                </li>
                <li><a>1</a></li>
                <li><a>2</a></li>
                <li>
                    <a aria-label="Next">
                        <span aria-hidden="true">下一页</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>


    <div id="last">
        <hr class="dicider">
        <footer>
            <p class="pull-right">© 2013 educubeglobal.com All rights reserved. 闽ICP备11025855号-1.</p>

            <p>学立方全球服务网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp学立方素质教育网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp学立方卓越网</p>
        </footer>
    </div>




</div>
</body>
</html>