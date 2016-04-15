<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-18
  Time: 上午11:02
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
  <title>Aligo-Coach-课程管理/设置空闲时间</title>
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
    function addIdle(coa_id, weekday, clazz, the) {
      the.text = '〇';
      the.onclick = function() {deleteIdle(coa_id, weekday, clazz, the)};
      var idA = "A"+weekday+"#"+clazz;
      $("td[id="+idA+"]").css("background-color", "#CCFFFF");

      var urlA = "http://localhost:8080/coach_InsertIdletime.action";
      var dataA = "coa_id=" + coa_id + "&weekday=" + weekday + "&clazz=" + clazz;
      $("td[id="+idA+"]").attr("id", "D" + weekday + "#" + clazz);
      $.ajax({
        type:"GET",
        url:urlA,
        data: dataA,
        success: function(Msg) {
        }
      });
    }

    function deleteIdle(coa_id, weekday, clazz, the) {
      the.text = '×';
      the.onclick = function() {addIdle(coa_id, weekday, clazz, the);};

      var idD = "D"+weekday+"#"+clazz;
      $("td[id="+idD+"]").css("background-color", "#CCCCCC");


      var urlD = "http://localhost:8080/coach_DeleteIdletime.action";
      var dataD = "coa_id=" + coa_id + "&weekday=" + weekday + "&clazz=" + clazz;
      $("td[id="+idD+"]").attr("id", "A" + weekday + "#" + clazz);
      $.ajax({
        type:"GET",
        url:urlD,
        data: dataD,
        success: function(Msg) {
        }
      });
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
             aria-expanded="false">Coach: ${LoginName}<span class="caret"></span></a>
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
    <li><a href="coach_GetCoachCourse.action">课程列表</a></li>
    <li class="active"><a href="#B" role="tab" data-toggle="tab">设定空闲时间</a></li>
    <li><a href="coach_GetCoachCourseForFeedback.action">反馈</a></li>
  </ul>
</div>

<div class="tab-pane" id="E">
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
            <c:if test="${CourseList[j][i] != null}">
              <td bgcolor="#CCFF99">
                <a class="tishi">${CourseList[j][i].getCou_name()}
                   <span>
                     <div>学生: ${CourseList[j][i].getStu_name()}</div>
                     <div>教室: ${CourseList[j][i].getClassroom()}</div>
                     <div>小站: ${CourseList[j][i].getStation()}</div>
                     <div>类型: ${CourseList[j][i].getType()}</div>
                   </span>
                </a>
              </td>
            </c:if>
            <c:if test="${CourseList[j][i] == null}">
              <c:if test="${IdleList[j][i] == null}">
                <td bgcolor="#CCCCCC" id="A${j}#${i}">
                  <div style="text-align: center">
                    <!--
                    <a href="coach_InsertIdletime.action?coa_id=${LoginId}&weekday=${j}&clazz=${i}">×</a>
                    -->
                    <a onclick="addIdle('${LoginId}', '${j}', '${i}', this)">×</a>
                  </div>
                </td>
              </c:if>
              <c:if test="${IdleList[j][i] != null}">
                <td bgcolor="#CCFFFF" id="D${j}#${i}">
                  <div style="text-align: center">
                    <!--
                    <a href="coach_DeleteIdletime.action?coa_id=${LoginId}&weekday=${j}&clazz=${i}">〇</a>
                    -->
                    <a onclick="deleteIdle('${LoginId}', '${j}', '${i}', this)">〇</a>
                  </div>
                </td>
              </c:if>
            </c:if>
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
