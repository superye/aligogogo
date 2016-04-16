<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-18
  Time: 上午11:14
  To change this template use File | Settings | File Templates.
--%>
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
        <li class=""><a href="http://120.25.249.29/8t2s_9stalk/userAction!login.action?username=${LoginId}&password=${LoginPassword}">在线教学</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
             aria-expanded="false">Coach：${LoginName}<span class="caret"></span></a>
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
    <li class="active"><a href="#A" role="tab" data-toggle="tab">课程列表</a></li>
    <li><a href="coach_GetIdleInfo.action">设定空闲时间</a></li>
    <li><a href="coach_GetCoachCourseForFeedback.action">反馈</a></li>
  </ul>
</div>

<div class="tab-pane" id="E">
  <div id="second2">
    <form class="form-inline" action="coach_GetCoachCourse" >
      <div class="form-group">
        <label for="Course">课程</label>
        <input name="cou_name" type="text" class="form-control" id="Course" placeholder="课程">
      </div>
      <div class="form-group">
        <label for="Student">学员</label>
        <input name="stu_name" type="text" class="form-control" id="Student" placeholder="学员">
      </div>
      <div class="form-group">
        <label for="Date">日期</label>
        <input name="end_day" type="date" class="form-control" id="Date" placeholder="年/月/日">
      </div>
      <div class="form-group">
        <label for="Station">站点</label>
        <input name="station" type="text" class="form-control" id="Station" placeholder="年/月/日">
      </div>

      <input type="submit" class="btn btn-default" value="搜索"></input>
    </form>
  </div>
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
      <tbody>
        <c:forEach var="i" begin="1" end="25">
          <tr>
            <td class="time">${TimeList.getTime()[i]}</td>
            <c:forEach var="j" begin="1" end="7">
              <td>
                 <a class="tishi">${List[j][i].getCou_name()}
                   <span>
                     <div>学生: ${List[j][i].getStu_name()}</div>
                     <div>教室: ${List[j][i].getClassroom()}</div>
                     <div>小站: ${List[j][i].getStation()}</div>
                     <div>类型: ${List[j][i].getType()}</div>
                   </span>
                 </a>
              </td>
            </c:forEach>
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
