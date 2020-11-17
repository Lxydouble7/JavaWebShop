<%@ page import="com.unvs.entity.Product" %>
<%@ page import="com.unvs.dao.CartDao" %><%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/14
  Time: 20:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script>
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);

        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
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
                    <li class="nav-item active">
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
<div class="inner_page-banner one-img">
</div>

<section class="checkout py-lg-4 py-md-3 py-sm-3 py-3">
    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
        <div class="shop_inner_inf">
            <div class="privacy about">
                <h3>购物车</h3>
                <div class="checkout-right">
                    <h4>您的购物车总计有: <span>${psum} 件商品</span></h4>
                    <table class="timetable_sub">
                        <thead>
                        <tr>
                            <th>序号</th>
                            <th style="width:350px">产品</th>
                            <th>数量</th>
                            <th>名称</th>
                            <th>价格</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <% int flag =1;%>
                        <c:forEach items="${checkout}" var ="cart">
                        <tr class="rem1">
                            <td class="invert"><%=flag%></td>
                            <%flag++;%>
                            <td class="invert-image"><a href="single.html"><img src="${cart.detail.image}" alt=" " class="img-responsive"></a></td>
                            <td class="invert">
                                <div class="quantity">
                                    <div class="quantity-select">
                                        <a class="button entry value-minus" methods="post" href="${pageContext.request.contextPath}/cart?method=CheckOutUpdateCart&uid=${cart.uid}&pid=${cart.pid}&op=-1&price=${cart.detail.price}&nownumber=${cart.number}">&nbsp;</a>
                                        <a name="newnumber"class="entry value" ><span>${cart.number}</span></a>
                                        <a class="button entry value-plus" methods="post" href="${pageContext.request.contextPath}/cart?method=CheckOutUpdateCart&uid=${cart.uid}&pid=${cart.pid}&op=1&price=${cart.detail.price}&nownumber=${cart.number}">&nbsp;</a>
                                    </div>
                                </div>
                            </td>
                            <td class="invert">${cart.detail.pname}</td>
                            <td class="invert">￥ ${cart.detail.price}</td>
                            <td class="invert">
                                <div class="rem">
                                    <a class="button close1" method = "post"href="${pageContext.request.contextPath}/cart?method=DeleteCart&uid=${cart.uid}&pid=${cart.pid}"></a>
                                </div>
                            </td>
                        </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="checkout-left">
                    <div class="col-md-4 checkout-left-basket">
                        <h4>合计</h4>
                        <ul>
                            <c:forEach  items="${checkout}" var="cart">
                                <li>${cart.detail.pname}<i>-</i> <span>￥ ${cart.total_price} </span></li>
                            </c:forEach>
                            <li>合计 <i>-</i> <span>￥ ${sum}</span></li>
                        </ul>
                    </div>
                    <div class="col-md-8 address_form">
                        <h4>填写收件人信息</h4>
                        <form method="post" action="${pageContext.request.contextPath}/order?method=SubmitOrder" class="creditly-card-form agileinfo_form">
                            <section class="creditly-wrapper wrapper">
                                <div class="information-wrapper">
                                    <div class="first-row form-group">
                                        <div class="controls">
                                            <label class="control-label">姓名: </label>
                                            <input class="billing-address-name form-control" type="text" name="name" placeholder="姓名" required="">
                                        </div>
                                        <div class="card_number_grids">
                                            <div class="card_number_grid_left">
                                                <div class="controls">
                                                    <label class="control-label">电话</label>
                                                    <input class="form-control" type="text" placeholder="电话" required="" name="telephone">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card_number_grids">
                                            <div class="card_number_grid_left">
                                                <div class="controls">
                                                    <label class="control-label">邮箱</label>
                                                    <input class="form-control" type="text" placeholder="邮箱" name="email" required="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="controls">
                                            <label class="control-label">地址: </label>
                                            <input class="form-control" type="text" placeholder="地址" required="" name="address">
                                        </div>
                                        <div class="styled-input ">
                                            <a style="color:#5a5656;font-size:16px">支付方式</a>
                                            <select name="payment" required="">
                                                <option value ="支付宝">支付宝</option>
                                                <option value ="微信支付">微信支付</option>
                                                <option value = "货到付款">货到付款</option>
                                            </select>
                                        </div>

                                    </div>
                                    </div>
                            </section>
                            <button type="submit" class="btn subscrib-btnn checkout-right-basket">提交订单</button>
                        </form>
                    </div>
                    <div class="clearfix"> </div>
                    <div class="clearfix"></div>
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
<script>
    $('.value-plus').on('click', function () {
        var divUpd = $(this).parent().find('.value'),
            newVal = parseInt(divUpd.text(), 10) + 1;
        divUpd.text(newVal);
    });

    $('.value-minus').on('click', function () {
        var divUpd = $(this).parent().find('.value'),
            newVal = parseInt(divUpd.text(), 10) - 1;
        if (newVal >= 1) divUpd.text(newVal);
    });
</script>
<script src="js/move-top.js"></script>
<script src="js/easing.js"></script>
<script>
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 900);
        });
    });
</script>
<!-- start-smoth-scrolling -->
<!-- here stars scrolling icon -->
<script>
    $(document).ready(function () {

        var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
        };
        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //here ends scrolling icon -->
<!--bootstrap working-->
<script src="js/bootstrap.min.js"></script>
<!-- //bootstrap working-->
</body>
</html>