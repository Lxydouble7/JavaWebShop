<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/15
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="css/shop.css" type="text/css" />
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all">

</head>
<body>
<!--headder-->
<div class="header-outs" id="home">
    <div class="header-bar">

        <%@ include file="top.jsp" %>
        <nav class="navbar navbar-expand-lg navbar-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav ">
                    <li class="nav-item ">
                        <a class="nav-link" href="index.jsp">主页 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <%
                            if(session.getAttribute("user")==null){
                        %>
                        <a href="login.jsp" class="nav-link">登录</a>
                        <%
                            }
                            if(session.getAttribute("user")!=null){
                        %>
                        <a href="${pageContext.request.contextPath}/user?method=logout" class="nav-link">注销</a>
                        <%
                            }
                        %>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/product?method=ViewAllProduct" class="nav-link">购物</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/cart?method=CheckOut" class="nav-link">购物车</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/order?method=ShowMyOrder" class="nav-link">订单</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<!--//headder-->
<!-- banner -->
<div class="inner_page-banner one-img">
</div>
<!--//banner -->
<!-- short -->

<!-- //short-->
<!--About -->
<section class="about py-lg-4 py-md-3 py-sm-3 py-3">
    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">订单成功提交</h3>
        <div class="about-innergrid-agile text-center">
            <h4>感谢您的大力支持</h4>
            <p class="mb-3">
                梁夏雨 201830590130 网络工程 网络应用开发
            </p>
            <p class="mb-3">
                <a Style="color:cadetblue"href="https://github.com/Lxydouble7">View My GitHub</a>
            </p>
        </div>
    </div>
</section>

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
