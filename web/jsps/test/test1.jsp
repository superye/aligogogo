<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-2-11
  Time: 下午10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
  <%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <base href="<%=basePath%>">
  <title>查看课消</title>
  <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/stu_financial.css">
  <link rel="stylesheet" type="text/css" href="<%=basePath%>resource/css/stu_lessoncost.css">
</head>
<body>
<div id="head">
  <span id="p1">ALiGo</span>
  <span id="p2">| 阿里学习加油站</span>
  <img src="">
  <span id="p3"><img id="pic" src="<%=basePath%>resource/images/head_portrait.png">学员：student | <a href="<%=basePath%>index.jsp">退出</a></span>
  <p id="p4"><a id="one" href="stu_schedule.html">课程管理</a> <a id="two" href="stu_financial.html">财务管理</a></p>
</div>

<div id="main">
  <ul id="point">
    <li><a id="stu_lessondel" href="">查看课消</a></li>
    <li><a id="stu_lessoncost" href="">查看课程收费标准</a></li>
  </ul>

  <table id="stu_financial" border="1">

    <td>1</td>
    <c:forEach items="${list}" var="list">
      <tr>
        <td>${list.getCoa_id()}</td>
        <td>${list.getWeekday()}</td>
        <td>${list.getClazz()}</td>
      </tr>
    </c:forEach>
  </table>

</div>


</body>
</html>
