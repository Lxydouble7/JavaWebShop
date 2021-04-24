<%--
  Created by IntelliJ IDEA.
  User: 86438
  Date: 2020/11/2
  Time: 16:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%--<%@ include file="header.jsp" %>--%>
<head>
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
          <li class="nav-item active">
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

  <!-- Slideshow 4 -->
  <div class="slider text-center">
    <div class="callbacks_container">
      <ul class="rslides" id="slider4">
        <li>
          <div class="slider-img one-img">
            <div class="container">
              <div class="slider-info ">
                <h5>选择你心仪的商品<br>iPhone</h5>

                <div class="outs_more-buttn">
                  <a href="${pageContext.request.contextPath}/product?method=ViewAllProduct">买买买</a>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="slider-img two-img">
            <div class="container">
              <div class="slider-info ">
                <h5>选择你心仪的商品<br>HUAWEI</h5>

                <div class="outs_more-buttn">
                  <a href="${pageContext.request.contextPath}/product?method=ViewAllProduct">买买买</a>
                </div>
              </div>
            </div>
          </div>
        </li>
        <li>
          <div class="slider-img three-img">
            <div class="container">
              <div class="slider-info">
<%--                <h5><br> For Kids</h5>--%>

                <div class="outs_more-buttn">
                  <a href="${pageContext.request.contextPath}/product?method=ViewAllProduct">买买买</a>
                </div>
              </div>
            </div>
          </div>
        </li>
      </ul>
    </div>
    <!-- This is here just to demonstrate the callbacks -->
    <!-- <ul class="events">
       <li>Example 4 callback events</li>
       </ul>-->
    <div class="clearfix"></div>
  </div>
</div>
<!-- //banner -->
<!-- about -->

<!-- //about -->
<!--new Arrivals -->



<script src='js/jquery-2.2.3.min.js'></script>
<!--//js working-->
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
<!--responsiveslides banner-->
<script src="js/responsiveslides.min.js"></script>
<script>
  // You can also use "$(window).load(function() {"
  $(function () {
    // Slideshow 4
    $("#slider4").responsiveSlides({
      auto: true,
      pager:false,
      nav:true ,
      speed: 900,
      namespace: "callbacks",
      before: function () {
        $('.events').append("<li>before event fired.</li>");
      },
      after: function () {
        $('.events').append("<li>after event fired.</li>");
      }
    });

  });
</script>
<!--// responsiveslides banner-->
<!--slider flexisel -->
<script src="js/jquery.flexisel.js"></script>
<script>
  $(window).load(function() {
    $("#flexiselDemo1").flexisel({
      visibleItems: 3,
      animationSpeed: 3000,
      autoPlay:true,
      autoPlaySpeed: 2000,
      pauseOnHover: true,
      enableResponsiveBreakpoints: true,
      responsiveBreakpoints: {
        portrait: {
          changePoint:480,
          visibleItems: 1
        },
        landscape: {
          changePoint:640,
          visibleItems:2
        },
        tablet: {
          changePoint:768,
          visibleItems: 2
        }
      }
    });

  });
</script>
<!-- //slider flexisel -->
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
<!-- //bootstrap working-->
</body>
</html>
