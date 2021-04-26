<%--
  Created by IntelliJ IDEA.
  User: UNVS
  Date: 2021/4/19
  Time: 21:47
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
                    <li class="nav-item ">
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
                    <li class="nav-item ">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllUser" class="nav-link">用户信息</a>
                    </li>
                    <li class="nav-item active">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllMerchant" class="nav-link">商户信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllProduct" class="nav-link">商品信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=ShowAllOrder" class="nav-link">订单信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=Statistics" class="nav-link">统计信息</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=OperationLog" class="nav-link">日志查询</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/admin?method=Warning" class="nav-link">警告</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>

<div class="inner_page-banner one-img">
</div>
<section class=" py-lg-4 py-md-3 py-sm-3 ">
    <a href="NewMerchant.jsp" class="btn btn-primary"  data-target="#exampleModal-two" style="margin-left: 250px">
        新增商户
    </a>
</section>
<section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">

        <div class="shop_inner_inf">
            <div class="privacy about">
                <h3>商户信息</h3>
                <div class="checkout-right">
                    <h4>总计有: <span>${merchantsum} 名商户</span></h4>
                    <table class="timetable_sub">
                        <thead>
                        <tr>
                            <th>id</th>
                            <th>登录账号</th>
                            <th>店铺名称</th>
<%--                            <th>修改</th>--%>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${MerchantList}" var ="merchant">
                            <tr class="rem1">
                                <td class="invert">${merchant.mid}</td>
                                <td class="invert">${merchant.merchantname}</td>
                                <td class="invert">${merchant.name}</td>
<%--                                <td class="invert">--%>
<%--                                    <a style="color: mediumslateblue"href="${pageContext.request.contextPath}/admin?method=AlterMerchantByMid&mid=${merchant.mid}">修改</a>--%>
<%--                                </td>--%>
                                <td class="invert">
                                    <a style="color: mediumslateblue"href="${pageContext.request.contextPath}/admin?method=DeleteMerchantByMid&mid=${merchant.mid}">删除</a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
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

