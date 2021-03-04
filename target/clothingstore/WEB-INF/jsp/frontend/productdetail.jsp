<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
    <link rel="stylesheet" href="../../../resources/css/bootstrap.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="../../../resources/css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="../../../resources/css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="../../../resources/css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="../../../resources/css/responsive.css">
    <!-- User style -->
    <link rel="stylesheet" href="../../../resources/css/custom.css">

    <!-- Modernizr JS -->
    <script src="../../../resources/js/vendor/modernizr-2.8.3.min.js"></script>

    <style>
        body{
            background-image: url(/upload/home/bg2.jpg);
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
<div class="breadcrumb-area mt-150">
    <div class="container">
        <ol class="breadcrumb" style="background: rgba(255,255,255,0.73)">
            <li><a href="/frontend/listmainpageinfo"><i class="fa fa-home"></i></a></li>
            <li><a href="/frontend/search?pageIndex=1&pageSize=12"> Shop</a></li>
            <li class="active">Product Detail</li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->


<!-- shop-area start！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！ -->
<div class="shop-area">
    <div class="container mt-30" style="background: rgba(255,204,68,0.8)">
        <div class="row mt-20 mb-20">
            <div class="col-xs-12 col-sm-6 col-md-5">

                <div class="product-zoom">
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div class="tab-pane active" id="pic1">
                            <div class="pro-large-img">
                                <img src="${product.imgAddr}"  alt="" />
                                <a class="popup-link" href="${product.imgAddr}">View larger <i class="fa fa-search-plus" aria-hidden="true"></i></a>
                            </div>
                        </div>
                        <c:forEach items="${product.productImgList}" var="img" varStatus="index">
                        <div class="tab-pane" id="pic${index.count+1}">
                            <div class="pro-large-img">
                            <img src="${img.imgAddr}" alt="" />
                            <a class="popup-link" href="${img.imgAddr}">View larger <i class="fa fa-search-plus" aria-hidden="true"></i></a>
                            </div>
                        </div>
                        </c:forEach>
                    </div>
                    <!-- Nav tabs -->
                    <ul class="details-tab">
                        <li class="active"><a href="#pic1" data-toggle="tab"><img src="${product.imgAddr}" alt="" /></a></li>
                        <c:forEach items="${product.productImgList}" var="img" varStatus="index">
                        <li><a href="#pic${index.count+1}" data-toggle="tab"><img src="${img.imgAddr}"  alt="" /></a></li>
                        </c:forEach>
                    </ul>
                </div>

            </div>

            <div class="col-xs-12 col-sm-6 col-md-7">
                <div class="product-details">
                    <h2 class="pro-d-title">${product.productName}</h2>
                    <div class="pro-ref">
                        <p>
                            <label>种类:</label>
                            <span>${product.productBrand.productBrandName}</span>
                        </p>
                        <p>
                            <label>上市日期: </label>
                            <span><fmt:formatDate value="${product.createTime}" pattern="yyyy-MM-dd"/></span>
                        </p>
                    </div>
                    <div class="price-box">
                        <span class="price product-price">${product.promotionPrice}</span>
                        <span class="old-price product-price">${product.normalPrice}</span>
                    </div>
                    <div class="short-desc">
                        <p>${product.productDesc}</p>
                    </div>
                    <div class="box-quantity">
                            <label>数量</label>
                            <input type="number" value="1" />
                            <button id="addcart" pid="${product.productId}">添加到购物车</button>

                    </div>
                    <div class="usefull_link_block">
                        <ul>
                            <li><a href="#"><i class="fa fa-envelope-o"></i>Send to a friend</a></li>
                            <li><a href="#"><i class="fa fa-print"></i>Print</a></li>
                            <li><a href="#"><i class="fa fa-heart-o"></i> Add to wishlist</a></li>
                        </ul>
                    </div>



                    <!--为了美观！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                    <div class="color-list">
                        <a href="#"></a>
                        <a href="#"></a>
                    </div>
                    <!--为了美观！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                    <div class="share-icon">
                        <a class="twitter" href="#"><i class="fa fa-facebook"></i>  facebook</a>
                        <a class="facebook" href="#"><i class="fa fa-twitter"></i>  twitter</a>
                        <a class="google" href="#"><i class="fa fa-google-plus"></i>  linkedin</a>
                        <a class="pinterest" href="#"><i class="fa fa-pinterest"></i>  facebook</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- shop-area end ！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！ -->





<!-- latest-blog-area end -->
<!-- brand-area start -->

<!-- Modal end -->



<!-- jquery latest version -->
<script src="../../../resources/js/vendor/jquery-1.12.0.min.js"></script>
<!-- Bootstrap framework js -->
<script src="../../../resources/js/bootstrap.min.js"></script>
<!-- ajax-mail js -->
<script src="../../../resources/js/ajax-mail.js"></script>
<!-- owl.carousel js -->
<script src="../../../resources/js/owl.carousel.min.js"></script>
<!-- jquery.nivo.slider js -->
<script src="../../../resources/js/jquery.nivo.slider.pack.js"></script>
<!-- All js plugins included in this file. -->
<script src="../../../resources/js/plugins.js"></script>
<!-- Main js file that contents all jQuery plugins activation. -->
<script src="../../../resources/js/main.js"></script>

<script src="../../../resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="../resources/js/local/cart.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/frontend/productdetail.js" charset="utf-8"></script>
</body>

</html>