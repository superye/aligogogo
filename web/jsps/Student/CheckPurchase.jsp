<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-24
  Time: 下午8:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
  <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <meta name="viewpo<%@ page contentType="text/html;charset=UTF-8" language="java" %>rt" content="width=device-width, initial-scale=1">
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Aligo-Admin-课程管理/购买课程</title>
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
  <script type="text/javascript">
    function checkForm(){
      var arr=document.getElementsByName("choosen");
      for(var i=0;i<arr.length;i++) {
        if(arr[i].checked) {
          return true;
        }
      }
      $("#error").html("请选择时段！");
      return false;
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
        <li class=""><a href="http://121.42.28.35/edumis(new)/UserServlet?act=login&account=aaaa&password=123">在线教学</a></li>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
             aria-expanded="false">学员：${LoginName}<span class="caret"></span></a>
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

<form action="student_ConfirmPurchase.action" onsubmit="return checkForm()">

  <div id="table1" class="table-responsive clearfix">
    <br/>
    <div style="align-content: center">
      <input type="submit" value="确认购买">
      &nbsp; &nbsp;
      <button><a href="student_LoadCoachCourse.action">返回</a></button>
      &nbsp; &nbsp;
      <font id="error" style="font-size: 10px;" color="red">${error}</font>
    </div>
    <br/>
    <br/>
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
      <c:forEach var="i" begin="1" end="${NumOfClass}">
        <tr>
          <td class="time">${TimeList[i]}</td>
          <c:forEach var="j" begin="1" end="7">
            <td>
              <c:if test="${IdleList[j][i] != null}">
                <div style="text-align: center">
                  <input type="radio" name="choosen" value="${cou_id}#${coa_id}#${type}#${i}#${j}">可选
                </div>
              </c:if>
            </td>
          </c:forEach>
        </tr>
      </c:forEach>
      </tbody>

    </table>
  </div>
</form>

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
