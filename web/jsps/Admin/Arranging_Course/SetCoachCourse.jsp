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


<div id="second">
  <ul class="nav nav-tabs" role="tablist">
    <li class="active"><a href="#A" role="tab" data-toggle="tab">师资安排</a></li>
    <li><a href="admin_GetStudentSchedule.action">查看学生课表</a></li>
    <li><a href="admin_GetCoachSchedule.action">查看Coach课表</a></li>
    <li><a href="admin_GetFeedback.action">查看反馈</a></li>
  </ul>
</div>

<div class="tab-pane">
  <div id="second2">
    <form class="form-inline" action="admin_LoadCoachCourse.action">
      <div class="form-group">
        <label for="coa_id">Coach编号</label>
        <input type="text" class="form-control" name="coa_id" id="coa_id" placeholder="Coach编号">
      </div>
      <div class="form-group">
        <label for="coa_name">Coach</label>
        <input type="text" class="form-control" name="coa_name" id="coa_name" placeholder="Coach">
      </div>
      <div class="form-group">
        <label for="cou_name">所授课程</label>
        <input type="text" class="form-control" name="cou_name" id="cou_name" placeholder="所授课程">
      </div>
      <div class="form-group">
        <label for="station">站点</label>
        <input type="text" class="form-control" name="station" id="station" placeholder="站点">
      </div>

      <button type="submit" class="btn btn-default">搜索</button>
      <button type="submit" class="btn btn-default"><a href="admin_GetCoachAndCourse.action">新增</a></button>
    </form>

  </div>


  <div id="table1" class="table-responsive">
    <table class="table table-hover">
      <thead>
      <tr>
        <th class="coach-num">Coach编号</th>
        <th>Coach</th>
        <th>所授课程</th>
        <th>站点</th>
        <th>授课方式</th>
        <th>价格/每节</th>
        <th>操作</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach items="${List}" var="list">
        <tr>
          <td class="td-mid">${list.getCoa_id()}</td>
          <td class="td-mid">${list.getCoa_name()}</td>
          <td class="td-mid">${list.getCou_name()}</td>
          <td class="td-mid">${list.getStation()}</td>
          <td class="td-mid">${list.getType()}</td>
          <td class="td-mid">${list.getPrice()}</td>
          <td class="td-mid">
            <a href="admin_DeleteCoachCourse.action?coa_id=${list.getCoa_id()}&cou_id=${list.getCou_id()}">删除</a>
          </td>
        </tr>
      </c:forEach>
  </tbody>

    </table>
  </div>


<!--  <div id="table2">
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
-->

  <div id="last">
    <hr class="dicider">
    <footer>
      <p class="pull-right">© 2013 educubeglobal.com All rights reserved. 闽ICP备11025855号-1.</p>

      <p>学立方全球服务网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp学立方素质教育网&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp学立方卓越网</p>
    </footer>
  </div>


  <div class="modal fade" id="new" tabindex="-1" role="dialog" aria-labelledby="modal-label"
       aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"><span
                  aria-hidden="true">&times;</span><span class="sr-only">关闭</span></button>
          <h4 class="modal-title" id="modal-label">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp新增</h4>
        </div>
        <div class="modal-body">

          <form class="form-inline">
            <div class="form-group">
              <label for="coa_id2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbspCoach：</label>
              <select class="form-control" id="coa_id2" name="coa_id2">
                <c:forEach items="${CoachList}" var="list">
                  <option value="${list.getCoa_id()}">
                      ${list.getCoa_id()} ${list.getCoa_name()}
                  </option>
                </c:forEach>
              </select>
            </div>
            <br><br><br>

            <div class="form-group">
              <label for="cou_id2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp教授课程：</label>
              <select class="form-control" id="cou_id2" name="cou_id2">
                <c:forEach items="${CourseList}" var="list">
                  <option value="${list.getCou_id()}">
                      ${list.getCou_id()} ${list.getCou_name()}
                  </option>
                </c:forEach>
              </select>
            </div>
            <br><br><br>

            <div class="form-group">
              <label for="exampleInputEmail2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp所在站点：</label>
              <input type="email" class="form-control" id="exampleInputEmail2" placeholder="所在站点">
            </div>
            <br><br><br>


          </form>


        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
