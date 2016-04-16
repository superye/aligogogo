
<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-26
  Time: 上午9:16
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

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Aligo-Admin-课程管理/师资安排</title>
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
        <li class="dropdown">
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
<br><br><br><br><br>
<div class="tab-pane" style="align-content: center">
  <form class="form-inline" action="admin_InsertCoachCourse.action">
    <div class="form-group">
      <label for="coa_id">&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCoach：</label>
      <select class="form-control" id="coa_id" name="coa_id">
        <c:forEach items="${CoachList}" var="list">
          <option value="${list.getUsername()}">
              ${list.getUsername()} ${list.getName()}
          </option>
        </c:forEach>
      </select>
    </div>
    <br><br><br>

    <div class="form-group">
      <label for="cou_id">&nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp教授课程：</label>
      <select class="form-control" id="cou_id" name="cou_id">
        <c:forEach items="${CourseList}" var="list">
          <option value="${list.getCou_id()}">
              ${list.getCou_name()}(${list.getType()})
          </option>
        </c:forEach>
      </select>
    </div>

    <div class="form-group">
      <label for="price">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp价格：</label>
      <input type="number" id="price" name="price" placeholder="价格">
    </div>
    <div class="form-group">
      <label for="station">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp所在站点：</label>
      <select class="form-control" id="station" name="station">
        <c:forEach items="${StationList}" var="list">
          <option value="${list.getStation_name()}">
              ${list.getStation_name()}
          </option>
        </c:forEach>
      </select>
    </div>
    <br><br><br>
    &nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    <input type="submit" value="添加">
    <button><a href="admin_LoadCoachCourse.action">返回</a></button>
  </form>
</div>


  <div id="last">
    <hr class="dicider">
    <footer>
      <p class="pull-right">© 2013 educubeglobal.com All rights reserved. 闽ICP备11025855号-1.</p>

      <p>学立方全球服务网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp学立方素质教育网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp学立方卓越网</p>
    </footer>
  </div>
</body>
</html>