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


<!--轮播模块-->
<!-- slider-container start -->
<div class="slider-container">
    <!-- Slider Image -->
    <div id="mainSlider" class="nivoSlider slider-image">
        <c:forEach items="${headLineList}" var="hl" varStatus="index">
        <img src="${hl.lineImg}" alt="" title="#htmlcaption${index.count}"/>
        </c:forEach>
    </div>
    <!-- Slider Caption 1 -->
    <c:forEach items="${headLineList}" var="hl" varStatus="index">
    <div id="htmlcaption${index.count}" class="nivo-html-caption slider-caption-${index.count}">
        <div class="container">
            <div class="slide1-text">
                <div class="middle-text">
                    <div class="cap-dec cap-1 wow bounceInRight " data-wow-duration="0.9s" data-wow-delay="0s">
                        <h2 class="slide1-text-yellow">${hl.shop.shopName}</h2>
                    </div>
                    <div class="cap-dec cap-2 wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.2s">
                        <h2 class="slide1-text-yellow">${hl.poster1}</h2>
                    </div>
                    <div class="cap-text wow bounceInRight" data-wow-duration="1.2s" data-wow-delay="0.3s">
                        <h3 class="slide1-text-yellow">${hl.poster2}</h3>
                    </div>
                    <div class="cap-readmore wow bounceInUp" data-wow-duration="1.3s" data-wow-delay=".5s">
                        <a href="${hl.lineLink}&pageIndex=1&pageSize=9">Shopping</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </c:forEach>
</div>
<!-- slider-container end -->
<!-- banner-area start -->
<div class="banner-area pt-70">
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-sm-6">
                <div class="single-banner">
                    <a href="#"><img src="/upload/home/baner1.jpg"  alt="" /></a>
                </div>
            </div>
            <div class="col-md-6 col-sm-6">
                <div class="single-banner">
                    <a href="#"><img src="/upload/home/baner2.jpg" alt="" /></a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- banner-area end -->

<!--新品上市！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
<div class="new-arrival-area pt-100 pb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center mb-20">
                <h2>new arrivals</h2>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div class="product-tab">
                    <!-- Nav tabs -->
                    <ul class="custom-tab text-center mb-40">
                        <li class="active"><a href="#caps" data-toggle="tab">帽子</a></li>
                        <li><a href="#clothes" data-toggle="tab"> 衣服</a></li>
                        <li><a href="#pants" data-toggle="tab"> 裤子</a></li>
                        <li><a href="#shoes" data-toggle="tab"> 鞋子</a></li>

                    </ul>
                    <!-- Tab panes -->
                    <div class="row">
                        <div class="tab-content">


                            <!--帽子！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                            <div class="tab-pane active" id="caps">
                                <div class="product-carousel">



                                    <!--第一个麦子商品！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                                    <c:forEach items="${capList}" var="cap">
                                    <div class="col-md-12">
                                        <div class="product-wrapper mb-40 mrg-nn-xs">
                                            <div class="product-img">
                                                <a href="#"><img src="${cap.imgAddr}" alt=""/></a>
                                                <span class="new-label">New</span>
                                                <div class="product-action">
                                                    <a href="#" class="carta" data-id="${cap.productId}"><i class="pe-7s-cart"></i></a>
                                                    <a href="#"><i class="pe-7s-folder"></i></a>
                                                    <a href="#" class="detail" data-id="${cap.productId}" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">${cap.productName}</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">${cap.promotionPrice}</span>
                                                        <span class="old-price product-price">${cap.normalPrice}</span>
                                                    </div>
                                                    <div class="pro-rating">
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <!--第一个帽子商品！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->



                                </div>
                            </div>
                            <!--帽子！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->

                            <!--衣服！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                            <div class="tab-pane" id="clothes">
                                <div class="product-carousel">


                                    <!--第一个衣服-->
                                    <c:forEach items="${upList}" var="up">
                                    <div class="col-md-12">
                                        <div class="product-wrapper mb-40 mrg-nn-xs">
                                            <div class="product-img">
                                                <a href="#"><img src="${up.imgAddr}" alt=""/></a>
                                                <span class="new-label">New</span>
                                                <div class="product-action">
                                                    <a href="#" class="carta" data-id="${up.productId}"><i class="pe-7s-cart"></i></a>
                                                    <a href="#"><i class="pe-7s-folder"></i></a>
                                                    <a href="#" class="detail" data-id="${up.productId}" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">${up.productName}</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">${up.promotionPrice}</span>
                                                        <span class="old-price product-price">${up.normalPrice}</span>
                                                    </div>
                                                    <div class="pro-rating">
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <!--第一个衣服！！！！！！！！！！！！！！！！！！-->


                                </div>
                            </div>
                            <!--衣服！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->


                            <!--裤子！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                            <div class="tab-pane" id="pants">
                                <div class="product-carousel">

                                    <!--第一个裤子！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                                    <c:forEach items="${downList}" var="down">
                                    <div class="col-md-12">
                                        <div class="product-wrapper mb-40 mrg-nn-xs">
                                            <div class="product-img">
                                                <a href="#"><img src="${down.imgAddr}" alt=""/></a>
                                                <span class="new-label">New</span>
                                                <div class="product-action">
                                                    <a href="#" class="carta" data-id="${down.productId}"><i class="pe-7s-cart"></i></a>
                                                    <a href="#"><i class="pe-7s-folder"></i></a>
                                                    <a href="#" class="detail" data-id="${down.productId}" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">${down.productName}</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">${down.promotionPrice}</span>
                                                        <span class="old-price product-price">${down.normalPrice}</span>
                                                    </div>
                                                    <div class="pro-rating">
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <!--第一个裤子！！！！！！！！！！！！！！！！！！-->



                                </div>
                            </div>
                            <!--裤子！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->


                            <!--鞋子！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->
                            <div class="tab-pane" id="shoes">
                                <div class="product-carousel">

                                    <!--第一个鞋子-->
                                    <c:forEach items="${shoeList}" var="shoe">
                                    <div class="col-md-12">
                                        <div class="product-wrapper mb-40 mrg-nn-xs">
                                            <div class="product-img">
                                                <a href="#"><img src="${shoe.imgAddr}" alt=""/></a>
                                                <span class="new-label">New</span>
                                                <div class="product-action">
                                                    <a href="#" class="carta" data-id="${shoe.productId}"><i class="pe-7s-cart"></i></a>
                                                    <a href="#"><i class="pe-7s-folder"></i></a>
                                                    <a href="#" class="detail" data-id="${shoe.productId}" data-toggle="modal" data-target="#productModal"><i class="pe-7s-look"></i></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">${shoe.productName}</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">${shoe.promotionPrice}</span>
                                                        <span class="old-price product-price">${shoe.normalPrice}</span>
                                                    </div>
                                                    <div class="pro-rating">
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                        <a href="#"><i class="fa fa-star-o"></i></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </c:forEach>
                                    <!--第一个鞋子！！！！！！！！！！！！！！！！！！-->


                                </div>
                            </div>
                            <!--鞋子！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！！-->



                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- new-arrival-area end -->



<!-- newsletter-area start -->
<div class="newsletter-area bg-1 ptb-180 col-md-12" style="background:url(/upload/home/subscribe.jpg);">
    <div class="container">
        <div id="newsletter_block_left">
            <h4><span>立即注册,疯狂购物吧！</span> </h4>
            <p>Get a FC count to shop around crazily！</p>
        </div>
        <div class="row">
            <a class="button large button-yellow mb-20" href="/local/to_regist"><span>立即注册！ </span><i class="fa fa-hand-o-right"></i></a>
        </div>
    </div>
</div>
<!-- newsletter-area end -->


<!-- latest-blog-area start -->
<div class="latest-blog-area ptb-60">
    <div class="container">
        <div class="row">
            <div class="section-title text-center mb-50">
                <h2>latest blog</h2>
            </div>
        </div>
        <div class="row">
            <div class="blog-active">
                <div class="col-lg-12">
                    <div class="blog-wrapper mb-40">
                        <div class="blog-img">
                            <a href="#"><img src="/upload/home/blog1.jpg" alt="" /></a>
                        </div>
                        <div class="blog-info">
                            <h3><a href="#">生活是什么?每个人都有着不同的看法....</a></h3>
                            <div class="blog-meta">
                                <span class="f-left">2019-04-20 21:50:35</span>
                                <span class="f-right"><a href="#">Read More </a></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="blog-wrapper mb-40">
                        <div class="blog-img">
                            <a href="#"><img src="/upload/home/blog2.jpg" alt="" /></a>
                        </div>
                        <div class="blog-info">
                            <h3><a href="#">分享我的生活我的！</a></h3>
                            <div class="blog-meta">
                                <span class="f-left">2019-04-20 21:50:35</span>
                                <span class="f-right"><a href="#">Read More </a></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="blog-wrapper mb-40">
                        <div class="blog-img">
                            <a href="#"><img src="/upload/home/blog2.jpg" alt="" /></a>
                        </div>
                        <div class="blog-info">
                            <h3><a href="#">Answers to your Questions about...</a></h3>
                            <div class="blog-meta">
                                <span class="f-left">2016-04-20 21:50:35</span>
                                <span class="f-right"><a href="#">Read More </a></span>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="blog-wrapper mb-40">
                        <div class="blog-img">
                            <a href="#"><img src="/upload/home/blog1.jpg" alt="" /></a>
                        </div>
                        <div class="blog-info">
                            <h3><a href="#">Share the Love for PrestaShop 1.6</a></h3>
                            <div class="blog-meta">
                                <span class="f-left">2016-04-20 21:50:35</span>
                                <span class="f-right"><a href="#">Read More </a></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- latest-blog-area end -->
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
<script type="text/javascript" src="../resources/js/frontend/search.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/frontend/shop.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/local/cart.js" charset="utf-8"></script>
</body>

</html>