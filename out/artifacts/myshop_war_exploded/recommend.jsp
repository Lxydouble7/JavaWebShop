<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/9
  Time: 23:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
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
    <%@ include file="header.jsp" %>
</head>
<body>

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
                    <li class="nav-item active">
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
<section class="contact py-lg-4 py-md-3 py-sm-3 py-3">
    <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
        <h3 class="title text-center mb-lg-5 mb-md-4 mb-sm-4 mb-3">猜你喜欢</h3>
        <div class="row">
            <div class="left-ads-display col-lg-12">
                <div class="row">
                    <c:forEach items="${recommend}" var="product">
                        <div class="col-lg-4 col-md-6 col-sm-6 product-men women_two">
                            <div class="product-toys-info">
                                <div class="men-pro-item">
                                    <div class="men-thumb-item">
                                        <img src="${product.image}" class="img-thumbnail img-fluid" alt="">
                                        <div class="men-cart-pro">
                                            <div class="inner-men-cart-pro">
                                                <a href="${pageContext.request.contextPath}/product?method=ViewDetail&pid=${product.pid}" class="link-product-add-cart">查看详情</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="item-info-product">
                                        <div class="info-product-price">
                                            <div class="grid_meta">
                                                <div class="product_price">
                                                    <h4>
                                                        <a href="${pageContext.request.contextPath}/product?method=ViewDetail&pid=${product.pid}">${product.pname}</a>
                                                    </h4>
                                                    <div class="grid-price mt-2">
                                                        <span class="money ">${product.price}</span>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="toys single-item hvr-outline-out">
                                                <form action="${pageContext.request.contextPath}/cart?method=AddCart" method="post">
                                                    <input type="hidden" name="pid" value="${product.pid}">
                                                    <input type="hidden" name="number" value="1">
                                                    <input type="hidden" name="total_price" value="${product.price}">
<%--                                                    <input type="hidden" name="uid" value="">--%>
                                                    <button type="submit" class="toys-cart ptoys-cart">
                                                        <i class="fas fa-cart-plus"></i>
                                                    </button>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- //show Now-->


<!-- //footer -->
<!-- Modal 1-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="register-form">
                    <form action="#" method="post">
                        <div class="fields-grid">
                            <div class="styled-input">
                                <input type="text" placeholder="Your Name" name="Your Name" required="">
                            </div>
                            <div class="styled-input">
                                <input type="email" placeholder="Your Email" name="Your Email" required="">
                            </div>
                            <div class="styled-input">
                                <input type="password" placeholder="password" name="password" required="">
                            </div>
                            <button type="submit" class="btn subscrib-btnn">Login</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!-- //Modal 1-->
<!--js working-->
<script src='js/jquery-2.2.3.min.js'></script>
<!--//js working-->
<!-- cart-js -->
<script src="js/minicart.js"></script>
<%--<script>--%>
<%--    toys.render();--%>

<%--    toys.cart.on('toys_checkout', function (evt) {--%>
<%--        var items, len, i;--%>

<%--        if (this.subtotal() > 0) {--%>
<%--            items = this.items();--%>

<%--            for (i = 0, len = items.length; i < len; i++) {}--%>
<%--        }--%>
<%--    });--%>
<%--</script>--%>
<!-- //cart-js -->
<!-- price range (top products) -->
<script src="js/jquery-ui.js"></script>
<script>
    //<![CDATA[
    $(window).load(function () {
        $("#slider-range").slider({
            range: true,
            min: 0,
            max: 9000,
            values: [50, 6000],
            slide: function (event, ui) {
                $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            }
        });
        $("#amount").val("$" + $("#slider-range").slider("values", 0) + " - $" + $("#slider-range").slider("values", 1));

    }); //]]>
</script>
<!-- //price range (top products) -->

<!-- start-smoth-scrolling -->
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
</body>
</html>

