<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-18
  Time: 上午11:16
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
  <title>Aligo-Coach-课程管理/课程列表</title>
  <link href="<%=basePath%>resource/css/bootstrap.min.css" rel="stylesheet">
  <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
  <script src="<%=basePath%>resource/js/bootstrap.min.js"></script>
  <link href="<%=basePath%>resource/css/style.css" rel="stylesheet">
  <link href="<%=basePath%>resource/css/theme.css" rel="stylesheet">
  <!--[if lt IE 9]>
  <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
  <![endif]-->
  <script type="text/javascript">
    $(function(){
      $("input[name=IsNonarrival]").click(function(){
        NoArrival();
      });
    });
    function checkForm() {
      var lateTime = $("#lateTime").val();
      if (lateTime >= 45 || lateTime < 0) {
        $("#error1").html("迟到时间超过45分钟请选择旷课！");
        return false;
      }
      return true;
    }
    function NoArrival() {
      document.getElementById("lateTime").value = 0;
      $("input[name=IsLate]").eq(1).click();
    }
  </script>

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
        <li class=""><a href="http://121.42.28.35/edumis/UserServlet?act=login&account=ffff&password=123">在线教学</a></li>
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

<div class>
  <div id="second">
    <ul class="nav nav-tabs" role="tablist">
      <li><a href="coach_GetCoachCourse.action">课程列表</a></li>
      <li><a href="coach_GetIdleInfo.action">设定空闲时间</a></li>
      <li class="active"><a href="#A" role="tab" data-toggle="tab">反馈</a></li>
    </ul>
  </div>
  <form action="coach_InsertFeedbackInfo.action" method="get" class="formstyle" onsubmit="return checkForm()">
    选择课次
    <select class="form-control" name="cou_id">
      <c:forEach items="${List}" var="list">
        <option value="${list.getCou_id()}">
          ${list.getCou_name()} ${list.getStu_name()} 教室${list.getClassroom()}
        </option>
      </c:forEach>
    </select>

    <div class="radio">
      是否旷课
      <br>
      <label>
        <input type="radio" name="IsNonarrival" value="1" onchange="NoArrival">是
      </label>
      <label>
        <input type="radio" name="IsNonarrival" value="0" checked>否
      </label>
      <br>
      是否迟到
      <br>
      <label>
        <input type="radio" name="IsLate" value="1">是
      </label>
      <label>
        <input type="radio" name="IsLate" value="0" checked>否
      </label>
    </div>
    迟到时间<input type="text" class="form-control" name="lateTime" id="lateTime" placeholder="迟到时间/分钟">
    <br>
    <button class="btn btn-default">提交</button>
    <font id="error1" style="font-size: 10px;" color="red">${error1}</font>
    <font id="error" style="font-size: 10px;" color="#32cd32">${IsSubmit}</font>
  </form>
</div>
<div class="tab-pane" id="E">
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
