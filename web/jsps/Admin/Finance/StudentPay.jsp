<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Aligo-Admin-财务管理/学生收费管理</title>
    <link href="<%=basePath%>resource/css/bootstrap.min.css" rel="stylesheet">
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <script src="<%=basePath%>resource/js/bootstrap.min.js"></script>
    <script src="<%=basePath%>resource/js/myjs.js"></script>
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
                <li>
                    <a class="active" href="#" class="dropdown-toggle" data-toggle="dropdown">财务管理 <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="admin_GetPALInfo.action" data-tab="">查看每月收支</a></li>
                        <li><a href="admin_GetDayIncome.action" data-tab="">每日收支管理</a></li>
                        <li><a href="admin_GetSalary.action">薪资管理</a></li>
                        <li><a href="admin_GetClassConsume.action" data-tab="">课消管理</a></li>
                        <li><a href="admin_Payment.action" data-tab="">学生收费管理</a></li>
                    </ul>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">教务管理员：Admin<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">消息</a></li>
                        <li><a href="#">设置</a></li>
                        <li><a href="#">查看更多</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="#">退出</a></li>
                    </ul>
                </li>
            </ul>

        </div>
    </div>
</div>


<div id="second">
    <ul class="nav nav-tabs" role="tablist">
        <li><a href="admin_GetPALInfo.action">查看每月盈亏</a></li>
        <li><a href="admin_GetDayIncome.action">每日收支管理</a></li>
        <li><a href="admin_GetSalary.action">薪资管理</a></li>
        <li><a href="admin_GetClassConsume.action">课消管理</a></li>
        <li  class="active"><a href="admin_Payment.action">学生收费管理</a></li>
    </ul>
</div>

<div class="tab-pane" id="D">


    <div id="table1" class="table-responsive">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>订单id</th>
                <th>课程编号</th>
                <th>课程名字</th>
                <th>Coach编号</th>
                <th>学生编号</th>
                <th>课次</th>
                <th>星期</th>
                <th>站点</th>
                <th>授课方式</th>
                <th>是否支付</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${NopayOrder}" var="list">
                    <tr id="tr${list.getId()}">
                        <td>${list.getId()}</td>
                        <td>${list.getCou_id()}</td>
                        <td>${list.getCou_name()}</td>
                        <td>${list.getCoa_id()}</td>
                        <td>${list.getStu_id()}</td>
                        <td>${list.getClazz()}</td>
                        <td>${list.getWeekday()}</td>
                        <td>${list.getStation()}</td>
                        <td>${list.getType()}</td>
                        <td><a href="javascript: void(0)" onclick="changepayment(${list.getId()})">已支付</a> / <a href="javascript: void(0)" onclick="deleteorder(${list.getId()})">删除</a></td>
                    </tr>
                </c:forEach>
            </tbody>

        </table>
    </div>


    <div id="table2" class="table-responsive">
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
                            <label for="exampleInputName2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp站点编号：</label>
                            <input type="text" class="form-control" id="exampleInputName2" placeholder="站点编号">
                        </div>
                        <br><br><br>

                        <div class="form-group">
                            <label for="exampleInputEmail2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp站点：</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="站点">
                        </div>
                        <br><br><br>

                        <div class="form-group">
                            <label for="exampleInputEmail2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp教室：</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="教室">
                        </div>
                        <br><br><br>

                        <div class="form-group">
                            <label for="exampleInputEmail2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp日期：</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="日期">
                        </div>
                        <br><br><br>

                        <div class="form-group">
                            <label for="exampleInputEmail2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp时间：</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="时间">
                        </div>
                        <br><br><br>

                        <div class="form-group">
                            <label for="exampleInputEmail2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp空闲座位：</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="空闲座位">
                        </div>
                        <br><br><br>

                        <div class="form-group">
                            <label for="exampleInputEmail2">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp总的座位：</label>
                            <input type="email" class="form-control" id="exampleInputEmail2" placeholder="总的座位">
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