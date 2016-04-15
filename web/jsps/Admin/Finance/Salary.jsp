<<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        <li><a href="admin_GetPALInfo.action">查看每月支出</a></li>
        <li><a href="admin_GetDayIncome.action">每日收支管理</a></li>
        <li class="active"><a href="admin_GetSalary.action">薪资管理</a></li>
        <li><a href="admin_GetClassConsume.action">课消及提成管理</a></li>
        <li><a href="admin_Payment.action">课程收费标准管理</a></li>
    </ul>
</div>

<div class="tab-content">
    <div class="tab-pane active" id="A">
        <div id="third">
            <ul class="nav nav-pills">
                <li role="presentation" class="active"><a href="#">员工薪资管理</a></li>
                <li role="presentation"><a href="#">Coach薪资管理</a></li>
                <li role="presentation"><a href="#">员工薪资标准管理</a></li>
                <li role="presentation"><a href="#">Coach薪资标准管理</a></li>
            </ul>
        </div>
    </div>
</div>


<div id="table1" class="table-responsive">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>月份</th>
            <th>员工编号</th>
            <th>员工姓名</th>
            <th>类别</th>
            <th>工作类型</th>
            <th>身份证号</th>
            <th>农行卡号</th>
            <th>建行卡号</th>
            <th>起聘时间</th>
            <th>A1-基本薪资</th>
            <th>A2-专业津贴</th>
            <th>A3-绩效津贴</th>
            <th>A4-干部管理</th>
            <th>A5-其他津贴/兼任/重负/调整额度</th>
            <th>A6-险金福利个人承担</th>
            <th>薪资合计</th>
            <th>B1-险金福利公司承担</th>
            <th>险金所得（B1+A6）</th>
            <th>C1-满勤/项目津贴</th>
            <th>C2-业绩提成/其他津贴</th>
            <th>C3-月份薪资/调整薪资</th>
            <th>D-每个月个人薪资福利总额（A+B1+C）</th>
            <th>E1-半个月工资/预支扣薪</th>
            <th>缺勤天数</th>
            <th>E2-缺勤扣薪</th>
            <th>险金所得（B1+A6）</th>
            <th>F-实领薪资（D-E-B）</th>
            <th>公司付</th>
            <th>学校付</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach var="list" items="${salary}">
            <tr>
                <td>${list.getYuefen()}</td>
                <td>${list.getYuangongbianhao()}</td>
                <td>${list.getYuangongxingming()}</td>
                <td>${list.getLeibie()}</td>
                <td>${list.getGongzuoleixing()}</td>
                <td>${list.getShenfenzhonghao()}</td>
                <td>${list.getNonghangkahao()}</td>
                <td>${list.getJianhangkahao()}</td>
                <td>${list.getQipinshijian()}</td>
                <td>${list.getA1_jibenxinzi()}</td>
                <td>${list.getA2_zhuanyejintie()}</td>
                <td>${list.getA3_xiaojijintie()}</td>
                <td>${list.getA4_ganbuguanli()}</td>
                <td>${list.getA5_qitqjintie()}</td>
                <td>${list.getA6_xianjinfuli()}</td>
                <td>${list.getXinziheji()}</td>
                <td>${list.getB1_xianjinfuli()}</td>
                <td>${list.getXianjinsuode()}}</td>
                <td>${list.getC1_manqin()}</td>
                <td>${list.getC2_yejiticheng()}</td>
                <td>${list.getC3_yuefenxinzi()}</td>
                <td>${list.getD_fulizonge()}</td>
                <td>${list.getE1_banyuegongzi()}</td>
                <td>${list.getQueqintianshu()}</td>
                <td>${list.getE2_queqinkouxin()}</td>
                <td>${list.getXianjindaijiao()}</td>
                <td>${list.getF_shilingxinzi()}</td>
                <td>${list.getXuexiaofu()}</td>
                <td>${list.getGongsifu()}</td>

            </tr>
        </c:forEach>
        <!--
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>

        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>

        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        <tr>
            <td>2015-11</td>
            <td>001</td>
            <td>刘萌</td>
            <td>总务</td>
            <td>实习</td>
            <td>3501821990xxxxxxxx</td>
            <td>6217xxxxxxxxx</td>
            <td>3100xxxxxxxx</td>
            <td>2014-12-21</td>
            <td>2000</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>0</td>
            <td>2000</td>
            <td>0</td>
        </tr>
        -->
        </tbody>

    </table>
</div>


<div id="table2">
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
</body>
</body>
</html>