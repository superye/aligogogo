<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-24
  Time: 下午4:47
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
  <style type="text/css">
    body {
      font-family: "Microsoft YaHei";
    }

    #second {
      margin: 40px auto;
      width: 76%;
      text-align: center;
    }

    #second2 {
      margin: -20px auto 10px;
      width: 76%;
      text-align: right;
    }

    #table1 {
      margin: 0 auto;
      width: 76%;
      text-align: center;
    }

    th {
      text-align: center;
    }

    #table2 {
      margin: -30px auto 0;
      width: 76%;
      text-align: right;
    }

    .coach-num {
      width: 100px;
    }

    #last {
      margin: 0 auto;
      width: 76%;

    }

    #third {
      margin: -20px auto 10px;
      width: 76%;
      text-align: center;
    }

  </style>


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
        <li class=""><a href="http://121.42.28.35/edumis/UserServlet?act=login&account=aaaa&password=123">在线教学</a></li>
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


<div id="second">
  <ul class="nav nav-tabs" role="tablist">
    <li><a href="student_GetStudentCourse.action">我的课程</a></li>
    <li class="active"><a href="#B" role="tab" data-toggle="tab">购买课程</a></li>
  </ul>
</div>

<div class="tab-pane" id="E">
  <div id="second2">
    <form class="form-inline">
      <div class="form-group">
        <label for="coa_name">Coach</label>
        <input type="text" class="form-control" id="coa_name" name="coa_name" placeholder="Coach">
      </div>
      <div class="form-group">
        <label for="cou_name">所授课程</label>
        <input type="text" class="form-control" id="cou_name" name="cou_name" placeholder="所授课程">
      </div>
      <div class="form-group">
        <label for="station">站点</label>
        <input type="text" class="form-control" id="station" name="station" placeholder="站点">
      </div>

      <button type="submit" class="btn btn-default">搜索</button>
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
            <a href="student_LoadIdleInfo.action?coa_id=${list.getCoa_id()}&cou_id=${list.getCou_id()}&type=${list.getType()}">购买</a>
          </td>
        </tr>
      </c:forEach>
      </tbody>

    </table>
  </div>


 <!-- <div id="table2">
    <nav>
      <ul class="pagination">
        <li>
          <a aria-label="Previous">
            <span aria-hidden="true">上一页</span>
          </a>
        </li>
        <li><a>1</a></li>
        <li><a>2</a></li>
        <li><a>3</a></li>
        <li><a>4</a></li>
        <li><a>5</a></li>
        <li><a>6</a></li>
        <li><a>7</a></li>
        <li><a>8</a></li>
        <li><a>9</a></li>
        <li><a>10</a></li>
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
</div>
</body>
</html>
