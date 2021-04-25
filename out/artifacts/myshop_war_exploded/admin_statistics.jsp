<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/16
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<head>
    <!--meta tags -->
    <meta charset="UTF-8">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/echarts@5.1.0/dist/echarts.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="css/shop.css" type="text/css" />
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all">

</head>
<body>
<!--headder-->
<div class="header-outs" id="home">
    <div class="header-bar">

        <%@ include file="adminTop.jsp" %>
        <nav class="navbar navbar-expand-lg navbar-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav ">
                    <li class="nav-item ">
                        <a class="nav-link" href="index.jsp">商城主页 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="admin_index.jsp">管理员主页 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%
                            if(session.getAttribute("admin")==null){
                        %>
                        <a href="admin_login.jsp" class="nav-link">登录</a>
                        <%
                            }
                            if(session.getAttribute("admin")!=null){
                        %>
                        <a href="${pageContext.request.contextPath}/admin?method=logout" class="nav-link">注销</a>
                        <%
                            }
                        %>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllUser" class="nav-link">用户信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllMerchant" class="nav-link">商户信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllProduct" class="nav-link">商品信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllOrder" class="nav-link">订单信息</a>
                    </li>
                    <li class="nav-item active">
                        <a href="${pageContext.request.contextPath}/admin?method=Statistics" class="nav-link">统计信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=OperationLog" class="nav-link">日志查询</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=Forecast" class="nav-link">销量走势和预测</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<div class="inner_page-banner one-img">
</div>



<div id="main2" style="width: 1500px;height:450px;margin-top: 20px;">
    <a></a>
</div>
<script type="text/javascript">


    var chartDom = document.getElementById('main2');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
        title: {
            text: '销量走势和预测',
            // subtext: '纯属虚构'
        },
        tooltip: {
            trigger: 'axis',
            axisPointer: {
                type: 'cross'
            }
        },
        toolbox: {
            show: true,
            feature: {
                saveAsImage: {}
            }
        },
        xAxis: {
            type: 'category',
            boundaryGap: false,
            ${data_date}
            // data: ['00:00', '01:15', '02:30', '03:45', '05:00', '06:15', '07:30', '08:45', '10:00', '11:15', '12:30', '13:45', '15:00', '16:15', '17:30', '18:45', '20:00', '21:15', '22:30', '23:45']
        },
        yAxis: {
            type: 'value',
            axisLabel: {
                formatter: '{value} '
            },
            axisPointer: {
                snap: true
            }
        },
        visualMap: {
            show: false,
            dimension: 0,
            pieces: [{
                lte: 13,
                color: 'green'
            }, {
                gt: 13,
                lte: 17,
                color: 'red'
            }, ]
        },
        series: [
            {
                name: '销量',
                type: 'line',
                smooth: true,
                // data: [135, 127, 148, 159, 137, 150, 172, 157, 184, 203, 179, 194, 228, 189, 219, 227, 236],
                ${data_sell}
                markArea: {
                    itemStyle: {
                        color: 'rgba(255, 173, 177, 0.4)'
                    },
                    data: [  [{
                        name: '未来三天',
                        xAxis: '17:30'
                    }, {
                        xAxis: '21:15'
                    }] ]
                }
            }
        ]
    };

    option && myChart.setOption(option);


</script>


<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 1500px;height:450px;">
    <a>商户销售金额</a>
</div>
<script type="text/javascript">

    var chartDom = document.getElementById('main');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
        title: {
            text: '销售金额统计',
            subtext: '商户、种类',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            left: 'center',
            top: 'bottom',
            // data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6', 'rose7', 'rose8']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '商户销售金额',
                type: 'pie',
                radius: [20, 140],
                center: ['25%', '50%'],
                roseType: 'area',
                itemStyle: {
                    borderRadius: 5
                },
                ${merchant_turnover}
            },
            {
                name: '种类销售金额',
                type: 'pie',
                radius: [20, 140],
                center: ['75%', '50%'],
                roseType: 'area',
                itemStyle: {
                    borderRadius: 5
                },
                ${type_turnover}
            }
        ]
    };

    option && myChart.setOption(option);





</script>


<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main1" style="width: 1500px;height:450px;margin-top: 20px;">
    <a>商户销售金额</a>
</div>
<script type="text/javascript">


    var chartDom = document.getElementById('main1');
    var myChart = echarts.init(chartDom);
    var option;

    option = {
        title: {
            text: '销售数量统计',
            subtext: '商户、种类',
            left: 'center'
        },
        tooltip: {
            trigger: 'item',
            formatter: '{a} <br/>{b} : {c} ({d}%)'
        },
        legend: {
            left: 'center',
            top: 'bottom',
            // data: ['rose1', 'rose2', 'rose3', 'rose4', 'rose5', 'rose6', 'rose7', 'rose8']
        },
        toolbox: {
            show: true,
            feature: {
                mark: {show: true},
                dataView: {show: true, readOnly: false},
                restore: {show: true},
                saveAsImage: {show: true}
            }
        },
        series: [
            {
                name: '商户销售数量',
                type: 'pie',
                radius: [20, 140],
                center: ['25%', '50%'],
                roseType: 'area',
                itemStyle: {
                    borderRadius: 5
                },
                ${merchant_num}
            },
            {
                name: '种类销售数量',
                type: 'pie',
                radius: [20, 140],
                center: ['75%', '50%'],
                roseType: 'area',
                itemStyle: {
                    borderRadius: 5
                },
                ${type_num}
            }
        ]
    };

    option && myChart.setOption(option);





</script>

<script src='js/jquery-2.2.3.min.js'></script>
<script src="js/minicart.js"></script>
<script>
    toys.render();

    toys.cart.on('toys_checkout', function (evt) {
        var items, len, i;

        if (this.subtotal() > 0) {
            items = this.items();

            for (i = 0, len = items.length; i < len; i++) {}
        }
    });
</script>

<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>

<script src="js/bootstrap.min.js"></script>
</body>
</html>

