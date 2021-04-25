<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/10
  Time: 19:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
    <link href="css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
    <link rel="stylesheet" href="css/shop.css" type="text/css" />
    <link rel="stylesheet" type="text/css" href="css/jquery-ui1.css">
    <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" href="css/flexslider.css" type="text/css" media="screen" />
    <link href="css/style.css" rel='stylesheet' type='text/css' media="all">
</head>
<body>
<!--headder-->
<div class="header-outs" id="home">
    <div class="header-bar">
        <%@include file="top.jsp"%>
        <nav class="navbar navbar-expand-lg navbar-light">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="navbarSupportedContent">
                <ul class="navbar-nav ">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/user?method=GetBack">返回 <span class="sr-only">(current)</span></a>
                    </li>

                </ul>
            </div>
        </nav>
    </div>
</div>

<div class="inner_page-banner one-img">
</div>

    <a href="${pageContext.request.contextPath}/user?method=GetBack" class="btn btn-primary"  style=" position:fixed;left:50px;top:400px;">
        返回
    </a>

<section class="banner-bottom py-lg-5 py-3">
    <div class="container">
        <div class="inner-sec-shop pt-lg-4 pt-3">
            <div class="row">
                <div class="col-lg-4 single-right-left ">
                    <div class="grid images_3_of_2">
                        <div class="flexslider1">
                            <ul class="slides">
                                <li data-thumb="${product.image}">
                                    <div class="thumb-image"> <img src="${product.image}" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                                </li>
                                <li data-thumb="${product.image1}">
                                    <div class="thumb-image"> <img src="${product.image1}" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                                </li>
                                <li data-thumb="${product.image2}">
                                    <div class="${product.image2}"> <img src="${product.image2}" data-imagezoom="true" class="img-fluid" alt=" "> </div>
                                </li>
                            </ul>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 single-right-left simpleCart_shelfItem">
                    <h3>${product.pname}</h3>
                    <p><span class="item_price">￥ ${product.price}</span>
                    </p>

                    <div class="occasional">
                        <h5>描述 :</h5>
                        <h5>${product.intro}</h5>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="occasion-cart">
                        <div class="toys single-item singlepage">
                            <form action="${pageContext.request.contextPath}/cart?method=AddCart" method="post">
                              <input type="hidden" name="pid" value="${product.pid}">
                                <h5>数量 :</h5>
                                <input type="number" step="1" min="1" max="100" value="1" name="number"/>
                                <input type="hidden" name="total_price" value="${product.price}">
                                <input type="hidden" name="type" value="${product.type}">
                                <input type="hidden" name="merchant" value="${product.merchant}">
                                <button type="submit" class="toys-cart ptoys-cart add">
                                    加入购物车
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="clearfix"> </div>
                <!--/tabs-->
                <div class="responsive_tabs">
                    <div id="horizontalTab">
                        <ul class="resp-tabs-list">
                            <li>详情</li>
                        </ul>
                        <div class="resp-tabs-container">
                            <!--/tab_one-->
                            <div class="tab1">
                                <div class="single_page">
                                    <h6>详情</h6>
                                    <p>
                                        <% for (int i = 0;i<10;i++){%>
                                        ${product.description}
                                        <%}%>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--//tabs-->
            </div>
        </div>
    </div>
</section>

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
<!--jQuery-->
<script src="js/jquery-2.2.3.min.js"></script>
<!-- newsletter modal -->
<!-- cart-js -->
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
<!-- single -->
<script src="js/imagezoom.js"></script>
<!-- single -->
<!-- script for responsive tabs -->
<script src="js/easy-responsive-tabs.js"></script>
<script>
    $(document).ready(function () {
        $('#horizontalTab').easyResponsiveTabs({
            type: 'default', //Types: default, vertical, accordion
            width: 'auto', //auto or any width like 600px
            fit: true, // 100% fit in a container
            closed: 'accordion', // Start closed if in accordion view
            activate: function (event) { // Callback function if tab is switched
                var $tab = $(this);
                var $info = $('#tabInfo');
                var $name = $('span', $info);
                $name.text($tab.text());
                $info.show();
            }
        });
        $('#verticalTab').easyResponsiveTabs({
            type: 'vertical',
            width: 'auto',
            fit: true
        });
    });
</script>
<!-- FlexSlider -->
<script src="js/jquery.flexslider.js"></script>
<script>
    // Can also be used with $(document).ready()
    $(window).load(function () {
        $('.flexslider1').flexslider({
            animation: "slide",
            controlNav: "thumbnails"
        });
    });
</script>
<!-- //FlexSlider-->
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
<!-- //smooth-scrolling-of-move-up -->
<!--bootstrap working-->
<script src="js/bootstrap.min.js"></script>
<!-- //bootstrap working-->
</body>
</html>