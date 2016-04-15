<%--
  Created by IntelliJ IDEA.
  User: spzn
  Date: 16-1-8
  Time: 下午9:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <%
    String path = request.getContextPath();
    String BasePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  %>
  <base href="<%=BasePath%>">
  <title>学立方知识服务网登陆界面</title>
  <link rel="stylesheet" type="text/css" href="resource/css/login.css">
  <link rel="stylesheet" type="text/css" href="resource/css/buttons.css">
  <link rel="stylesheet" type="text/css" href="resource/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="resource/css/bootstrap-theme.min.css">
  <link rel="stylesheet" type="text/css" href="resource/css/bootstrap.min.css">
  <script src="resource/js/jquery-2.1.1.min.js"></script>
  <script src="resource/js/bootstrap.min.js"></script>

  <script type="text/javascript">
    function checkForm() {
      var account = $("#account").val();
      var password = $("#password").val();
      if(account == "") {
        $("#error").html("账号不能为空！");
        return false;
      }
      if(password == "") {
        $("#error").html("密码不能为空！");
        return false;
      }
      return true;
    }
  </script>

</head>
<body id="wrap">
<div id="header">
  <a>
    <img src="resource/images/aligo.png" width="900px" alt="logo">
  </a>
  <div class="imgbox">
    <img src="resource/images/learn-3d.png" class="img-circle">
    <img src="resource/images/practice.png" class="img-circle">
    <img src="resource/images/earn.png" class="img-circle">
  </div>
</div>

<div id="main">
  <div id="leftbox">
    <div class="slogan">"还没有在线测试账号？马上加入"
      <a class="button button-rounded button-flat-caution" target="_blank" href="register">
        <span>立即注册</span>
      </a>
    </div>

    <div class="ad">
      <img src="resource/images/VOSMaP3.jpg" width="100%" height="100%" alt="VOAMaP图片">
    </div>
  </div>

  <div id="loginbox">
    <div class="login_info">
      <div class="error hide">
        "用户名或者密码错误"
        <br>
      </div>

      <form action="login" onsubmit="return checkForm()">

        <label for="account">
          <a>用户名</a>
        </label>
        <input id="account" name="username" type="text" placeholder="用户名">
        <label for="password">
          <a>请输入密码</a>
        </label>
        <input id="password" name="password" type="password" placeholder="请输入密码">
        <br/>
        <input type="radio" value="1" name="identity" checked>学生</input>
        <input type="radio" value="2" name="identity">coach</input>
        <input type="radio" value="3" name="identity">admin</input>
<span>
<a href="findpw">忘记密码</a>
</span>
        <input id="submit1" class="button button-rounded button-flat-primary" type="submit" value="登 录">
        <div>
          <font id="error" style="font-size: 10px;" color="red">${error }</font>
        </div>
      </form>
<span>
"还没有账号？"
<a href="register">立即注册！</a>
</span>
      <br/>
      <br/>
    </div>

  </div>
</div>

<div id="footer">
  <p>
    Coryright©2012-2017
    <a href="http://educubelobal.com/" alt="学立方全球服务网">Educubelobal.com</a>
    All rights reserved. 闽ICP备11025855号
  </p>
</div>
</body>
</html>
