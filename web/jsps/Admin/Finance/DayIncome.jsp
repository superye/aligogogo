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
                <li class="dropdown"><a href="#ad-carousel">课程管理</a></li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">座位管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#feature-tab" data-tab="tab-chrome">查看座位资源</a></li>
                        <li><a href="#feature-tab" data-tab="tab-firefox">维护座位资源</a></li>
                    </ul>
                </li>
                <li class="active">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">财务管理 <span class="caret"></span></a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="admin_GetPALInfo.action" data-tab="tab-chrome">查看每月收支</a></li>
                        <li><a href="admin_GetDayIncome.action" data-tab="tab-firefox">每日收支管理</a></li>
                        <li><a href="admin_GetSalary.action">薪资管理</a></li>
                        <li><a href="admin_GetClassConsume.action" data-tab="tab-chrome">课消及提成管理</a></li>
                        <li><a href="admin_Payment.action" data-tab="tab-firefox">课程收费标准管理</a></li>
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
        <li><a href="admin_GetPayInfo.action">查看每月支出</a></li>
        <li class="active"><a href="admin_GetDayIncome.action">每日收支管理</a></li>
        <li><a href="admin_GetSalary.action">薪资管理</a></li>
        <li><a href="admin_GetClassConsume.action">课消及提成管理</a></li>
        <li><a href="admin_Payment.action">课程收费标准管理</a></li>
    </ul>
</div>

<div class="tab-content">
    <div class="tab-pane active" id="A">
        <div id="third">
            <ul class="nav nav-pills">
                <li role="presentation" class="active"><a href="admin_GetDayIncome.action">每日收入管理</a></li>
                <li role="presentation"><a href="admin_GetDayOutput.action">每日支出管理</a></li>
                <div  style="text-align: right;">
                    <button type="submit" class="btn btn-default"><a href="jsps/Admin/Finance/AddDayInput.jsp">新增</a></button>
                </div>
            </ul>
        </div>
    </div>
</div>


<div id="table1" class="table-responsive">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>时间</th>
            <th>站点</th>
            <th>类别</th>
            <th>品名</th>
            <th>缴费金额</th>
            <th>手续费</th>
            <th>实际收入</th>
            <th>余额</th>
            <th>交易类型</th>
            <th>经手人</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${dayincome}">
            <tr>
                <td>${list.getTime()}</td>
                <td>${list.getStation_name()}</td>
                <td>${list.getType()}</td>
                <td>${list.getPname()}</td>
                <td>${list.getPay_money()}</td>
                <td>${list.getCounter_Fee()}</td>
                <td>${list.getReal_input()}</td>
                <td>${list.getBalance()}</td>
                <td>${list.getTransaction_type()}</td>
                <td>${list.getPerson_in_charge()}</td>
            </tr>
        </c:forEach>
        </tbody>
        <!--
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>

        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        <tr>
            <td>2015-11-02</td>
            <td>好苗苗</td>
            <td>线下学管收入</td>
            <td>小王一对一数学20H（9折）</td>
            <td>1620.00</td>
            <td>0.00%</td>
            <td>1620.00</td>
            <td>1620.00</td>
            <td>现金</td>
            <td>刘萌</td>
        </tr>
        -->
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
</div>
</body>
</html>