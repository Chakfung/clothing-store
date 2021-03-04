<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Store</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
    ============================================ -->
    <link rel="icon" type="image/x-icon" href="/upload/home/tlogo.ico">

    <!-- All css files are included here. -->

    <!-- Bootstrap framework main css -->
    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="../resources/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="../resources/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="../resources/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="../resources/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="../resources/css/custom.css">

    <!-- Modernizr JS -->
    <script src="../resources/js/vendor/modernizr-2.8.3.min.js"></script>

    <style>
        body{
            background-image: url(/upload/home/bg1.jpg);
            background-size: cover;
        }
    </style>
</head>

<body>
<!--[if lt IE 8]>
<![endif]-->
<!-- header start -->
<%@include file="header.jsp"%>
<!-- header end -->


<div class="space-custom"></div>
<!-- breadcrumb start -->
<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-home"></i></a></li>
            <li><a href="#">Shop</a></li>
            <li class="active">Cart</li>
        </ol>
    </div>
</div>


<div class="cart-main-area">
    <div class="container">

        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <form action="#">
                    <div class="table-content table-responsive">
                        <table>
                            <thead>
                            <tr>
                                <th class="product-thumbnail">图片</th>
                                <th class="product-name">商品名称</th>
                                <th class="product-price">单价</th>
                                <th class="product-quantity">数量</th>
                                <th class="product-subtotalth">总价</th>
                                <th class="product-remove">操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                            <c:when test="${success}">
                            <c:forEach items="${cartList}" var="c">
                            <!--商品！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                            <tr class="cart-row">
                                <td class="product-thumbnail"><a href="#" class="productid" data-id="${c.product.productId}"><img src="${c.product.imgAddr}" alt="" /></a></td>
                                <td class="product-name"><a href="#">${c.product.productName}</a></td>
                                <td class="product-price"><span class="amount">${c.product.promotionPrice}</span></td>
                                <td class="product-quantity"><input type="number" class="count" value="${c.num}" /></td>
                                <td class="product-subtotal">${c.num*c.product.normalPrice}</td>
                                <td class="product-remove"><a href="#" data-id="${c.cartId}" class="removecart"><i class="fa fa-times"></i></a></td>
                            </tr>
                            <!--商品！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                            </c:forEach>
                            </c:when>
                            <c:otherwise>
                            购物车为空
                            </c:otherwise>
                            </c:choose>

                        </table>
                    </div>
                    <div class="row">
                        <div class="col-md-8 col-sm-7 col-xs-12">
                            <div class="buttons-cart">
                                <a href="/frontend/search?pageIndex=1&pageSize=12">继续购物</a>
                            </div>

                        </div>
                        <div class="col-md-4 col-sm-5 col-xs-12">
                            <div class="cart_totals">
                                <h2>Cart Totals</h2>
                                <table>
                                    <tbody>

                                    <tr class="order-total">
                                        <th>Total</th>
                                        <td>
                                            <strong><span id="total" class="amount"></span></strong>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="wc-proceed-to-checkout">
                                    <a href="#" class="tocheckout">购买</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>
<!-- brand-area start -->
<%@include file="foot.jsp"%>
<!-- Modal end -->



<!-- jquery latest version -->
<script src="../resources/js/vendor/jquery-1.12.0.min.js"></script>
<!-- Bootstrap framework js -->
<script src="../resources/js/bootstrap.min.js"></script>
<!-- ajax-mail js -->
<script src="../resources/js/ajax-mail.js"></script>
<!-- owl.carousel js -->
<script src="../resources/js/owl.carousel.min.js"></script>
<!-- jquery.nivo.slider js -->
<script src="../resources/js/jquery.nivo.slider.pack.js"></script>
<!-- All js plugins included in this file. -->
<script src="../resources/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="../resources/js/main.js"></script>

<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/frontend/cartlist.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/local/cart.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/local/orderoperation.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/frontend/search.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/frontend/shop.js" charset="utf-8"></script>
</body>
</body>

</html>