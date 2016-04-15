<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-26
  Time: 下午8:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <meta name="viewpo<%@ page contentType="text/html;charset=UTF-8" language="java" %>rt" content="width=device-width, initial-scale=1">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <title>Aligo-Coach-课程管理/课程列表</title>
  <link href="<%=basePath%>resource/css/bootstrap.min.css" rel="stylesheet">
  <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  <script src="<%=basePath%>resource/js/bootstrap.min.js"></script>
  <link href="<%=basePath%>resource/css/style.css" rel="stylesheet">
  <link href="<%=basePath%>resource/css/theme.css" rel="stylesheet">
  <link href="<%=basePath%>resource/css/pointOut.css" rel="stylesheet">
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
        <li class="active"><a href="#ad-carousel">课程管理</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">座位管理 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="admin_GetSeatInfo.action"" data-tab="tab-chrome">查看座位资源</a></li>
            <li><a href="#feature-tab" data-tab="tab-firefox">维护座位资源</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown">财务管理 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="admin_GetPALInfo.action" data-tab="tab-chrome">查看每月收支</a></li>
            <li><a href="#feature-tab" data-tab="tab-firefox">每日收支管理</a></li>
            <li><a href="#feature-tab" data-tab="tab-firefox">薪资管理</a></li>
            <li><a href="#feature-tab" data-tab="tab-chrome">课消及提成管理</a></li>
            <li><a href="#feature-tab" data-tab="tab-firefox">课程收费标准管理</a></li>
          </ul>
        </li>

      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
             aria-expanded="false">教务管理员：${LoginName}<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">消息</a></li>
            <li><a href="#">设置</a></li>
            <li><a href="#">查看更多</a></li>
            <li role="separator" class="divider"></li>
            <li><a href="logout.action">退出</a></li>
          </ul>
        </li>
      </ul>

    </div>
  </div>
</div>


<div id="second">
  <ul class="nav nav-tabs" role="tablist">
    <li><a href="admin_LoadCoachCourse.action">师资安排</a></li>
    <li><a href="admin_GetStudentSchedule.action">查看学生课表</a></li>
    <li><a href="admin_GetCoachSchedule.action">查看Coach课表</a></li>
    <li class="active"><a href="#A" role="tab" data-toggle="tab">查看反馈</a></li>
  </ul>
</div>

<div class="tab-pane">


  <div id="table1" class="table-responsive">
    <table class="table table-hover">
      <thead>
      <tr>
        <th>日 期</th>
        <th>节 次</th>
        <th>科 目</th>
        <th>Coach编号</th>
        <th>Coach姓名</th>
        <th>出勤情况</th>
      </tr>
      </thead>
      <tbody>
        <c:forEach items="${List}" var="list">
          <tr>
            <td class="td-mid">${list.getDate()}</td>
            <td class="td-mid">2</td>
            <td class="td-mid">${list.getCou_name()}</td>
            <td class="td-mid">${list.getFid()}</td>
            <td class="td-mid">${list.getCoa_name()}</td>
            <c:if test="${list.getIsNonarrival().equals('1')}">
              <td class="td-mid" bgcolor="#dc143c">旷课</td>
            </c:if>
            <c:if test="${list.getIsNonarrival().equals('0')}">
              <c:if test="${list.getIsLate().equals('0')}">
                <td class="td-mid" bgcolor="#7fffd4">正常</td>
              </c:if>
               <c:if test="${list.getIsLate().equals('1')}">
                <td class="td-mid" bgcolor="aqua">迟到${list.getLateTime()}分钟</td>
              </c:if>
            </c:if>
          </tr>
        </c:forEach>
      </tbody>

    </table>
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
