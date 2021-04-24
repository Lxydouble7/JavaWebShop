<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/15
  Time: 22:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zxx">
<head>
    <%@include file="header.jsp"%>

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
                        <a href="${pageContext.request.contextPath}/product?method=Recommend" class="nav-link">猜你喜欢</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/order?method=ShowMyOrder" class="nav-link">订单</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<div class="inner_page-banner one-img">
</div>
<section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">
    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <div class="shop_inner_inf">
            <div class="privacy about">
                <h3>订单</h3>
                <div class="checkout-right">
                    <h4>您总计有: <span>${osum} 份订单</span></h4>
                    <table class="timetable_sub">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th>收件人姓名</th>
                            <th>收件人手机号</th>
                            <th>收件人邮箱</th>
                            <th>收件人地址</th>
                            <th>商品名称</th>
                            <th>数量</th>
                            <th>价格</th>
                            <th>时间</th>
                            <th>付款方式</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% int flag =1;%>
                        <c:forEach items="${OrderList}" var ="order">
                            <tr class="rem1">
                                <td class="invert"><%=flag%></td>
                                <%flag++;%>
                                <td class="invert">${order.uname}</td>
                                <td class="invert">${order.telephone}</td>
                                <td class="invert">${order.email}</td>
                                <td class="invert">${order.address}</td>
                                <td class="invert">${order.pname}</td>
                                <td class="invert">${order.number}</td>
                                <td class="invert">￥ ${order.total_price}</td>
                                <td class="invert">${order.time}</td>
                                <td class="invert">${order.pay}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
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
