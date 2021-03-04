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
            <li><a href="/frontend/listmainpageinfo"><i class="fa fa-home"></i></a></li>
            <li><a href="/frontend/search?pageIndex=1&pageSize=12" class="active">Shop</a></li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- shop-area start -->
<div class="shop-area">
    <div class="container">
        <div class="row" style="background-color:rgba(255,255,255,0.84)" >
            <div class="col-md-3 col-sm-4">
                <div class="column">
                    <h2 class="title-block">目录</h2>

                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">种类</h3>
                        <ul class="sidebar-menu" >
                            <li><a href="#">帽子 </a></li>
                            <li><a href="#">衣服 </a></li>
                            <li><a href="#">裤子 </a></li>
                            <li><a href="#">鞋子 </a></li>
                        </ul>
                    </div>

                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">品牌</h3>
                        <ul class="sidebar-menu">
                            <li><a href="#">NIKE </a></li>
                            <li><a href="#">ADIDAS </a></li>
                            <li><a href="#">PUMA </a></li>
                            <li><a href="#">LI-NING </a></li>
                            <li><a href="#">ZARA </a></li>
                        </ul>
                    </div>

                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">价格</h3>
                        <div>

                            <!--<div id="slider-range"></div>-->
                            <div class="col-md-6">Min<input type="text" id="min" class="form-control"></div>
                            <div class="col-md-6">Max<input type="text" id="max" class="form-control"></div>

                            </p>
                        </div>
                    </div>
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">帽子</h3>
                        <ul class="sidebar-menu">
                            <li><a href="#">贝雷帽</a></li>
                            <li><a href="#">牛仔帽</a></li>
                            <li><a href="#">鸭舌帽</a></li>
                            <li><a href="#">礼帽</a></li>
                            <li><a href="#">针织帽</a></li>
                            <li><a href="#">太阳帽</a></li>
                        </ul>
                    </div>
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">衣服</h3>
                        <ul class="sidebar-menu">
                            <li><a href="#">T恤</a></li>
                            <li><a href="#">衬衣</a></li>
                            <li><a href="#">西装</a></li>
                            <li><a href="#">连衣裙</a></li>
                            <li><a href="#">夹克</a></li>
                            <li><a href="#">风衣</a></li>
                        </ul>
                    </div>
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">裤子</h3>
                        <ul class="sidebar-menu">
                            <li><a href="#">牛仔裤</a></li>
                            <li><a href="#">西裤</a></li>
                            <li><a href="#">工装裤</a></li>
                            <li><a href="#">短裤</a></li>
                            <li><a href="#">裙子</a></li>
                            <li><a href="#">运动裤</a></li>
                        </ul>
                    </div>
                    <div class="sidebar-widget">
                        <h3 class="sidebar-title">鞋子</h3>
                        <ul class="sidebar-menu">
                            <li><a href="#">跑鞋</a></li>
                            <li><a href="#">篮球鞋</a></li>
                            <li><a href="#">拖鞋</a></li>
                            <li><a href="#">高跟鞋</a></li>
                            <li><a href="#">皮鞋</a></li>
                            <li><a href="#">休闲鞋</a></li>
                        </ul>
                    </div>

                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <h2 class="page-heading mt-40">
                    <div class="col-md-8">
                        <span class="cat-name">商品列表</span></div>
                    <div class="col-md-4">
                        <form action="#" id="searchbox2">
                            <input type="text" placeholder="Search" />
                            <button class="button-search"></button>
                        </form>
                    </div>

                </h2>
                <div class="shop-page-bar">
                    <div>
                        <div class="shop-bar">
                            <!-- Nav tabs -->
                            <ul class="shop-tab f-left" role="tablist">
                                <li role="presentation" class="active"><a href="#home" data-toggle="tab"><i class="fa fa-th-large" aria-hidden="true"></i></a></li>
                                <li role="presentation"><a href="#profile" data-toggle="tab"><i class="fa fa-th-list" aria-hidden="true"></i></a></li>
                            </ul>
                            <div class="selector-field f-left ml-20 hidden-xs">
                                <form action="#">
                                    <label>筛选</label>
                                    <select name="select">
                                        <option value="">----</option>
                                        <option value="">价格升序</option>
                                        <option value="">价格降序</option>
                                        <option value="">上市时间升序</option>
                                        <option value="">上市时间降序</option>
                                    </select>
                                </form>
                            </div>
                            <div class="selector-field f-left ml-30 hidden-xs">
                                <form action="#">
                                    <label>Show</label>
                                    <input type="hidden" id="pageIndex" value="${pageIndex}">
                                    <input type="hidden" id="psize" value="${pageSize}">
                                    <select name="select" id="pageSize">
                                        <option value="3" class="pageSize">3</option>
                                        <option value="6" class="pageSize">6</option>
                                        <option value="9" class="pageSize">9</option>
                                    </select>
                                </form>
                            </div>

                        </div>
                        <!-- Tab panes -->
                        <div class="tab-content">

                            <!--第一种形式-->
                            <div role="tabpanel" class="tab-pane active" id="home">
                                <div class="row">

                                    <!--商品！！!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
                                    <c:forEach items="${productList}" var="p">
                                    <div class="col-md-4 col-sm-6">
                                        <div class="product-wrapper mb-40">
                                            <div class="product-img">
                                                <a href="#"><img src="${p.imgAddr}" alt=""></a>

                                                <div class="product-action">
                                                    <a href="#" class="carta" data-id="${p.productId}"><i class="pe-7s-cart"></i></a>
                                                    <a href="#"><i class="pe-7s-folder"></i></a>
                                                    <a href="#" class="detail" data-id="${p.productId}"><i class="pe-7s-look"></i></a>
                                                </div>
                                            </div>
                                            <div class="product-content">
                                                <div class="pro-title">
                                                    <h3><a href="product-details.html">${p.productName}</a></h3>
                                                </div>
                                                <div class="price-reviews">
                                                    <div class="price-box">
                                                        <span class="price product-price">${p.promotionPrice}</span>
                                                        <span class="old-price product-price">${p.normalPrice}</span>
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
                                    <!--商品！！!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
                                    </c:forEach>
                                </div>
                            </div>

                            <!--第二种形式-->
                            <div role="tabpanel" class="tab-pane" id="profile">

                                <!--商品！！!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
                                <c:forEach items="${productList}" var="p">
                                <div class="row mb-50">
                                    <div class="col-xs-5 col-sm-5 col-md-4">
                                        <div class="product-wrapper">
                                            <div class="product-img">
                                                <a href="#"><img src="${p.imgAddr}" alt="" /></a>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xs-7 col-sm-7 col-md-8">
                                        <div class="product-content product-list">
                                            <div class="pro-title">
                                                <h3><a href="product-details.html">${p.productName}</a></h3>
                                            </div>
                                            <div class="price-reviews">
                                                <div class="price-box">
                                                    <span class="price product-price">${p.promotionPrice}</span>

                                                    <!--固定 为了好看点-->
                                                    <span class="old-price product-price">${p.normalPrice}</span>

                                                </div>
                                                <div class="pro-rating">
                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                    <a href="#"><i class="fa fa-star"></i></a>
                                                    <a href="#"><i class="fa fa-star-o"></i></a>
                                                    <a href="#"><i class="fa fa-star-o"></i></a>
                                                </div>
                                            </div>
                                            <p>${p.productDesc}</p>

                                            <div class="product-action">
                                                <!--购物车-->
                                                <a href="#" class="carta" data-id="${p.productId}"><i class="pe-7s-cart"></i></a>
                                                <!--收藏夹-->
                                                <a href="#"><i class="pe-7s-folder"></i></a>
                                                <a href="#" class="detail" data-id="${p.productId}"><i class="pe-7s-look"></i></a>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                                </c:forEach>
                            </div>

                            <div class="content-sortpagibar">
                                <div class="product-count display-inline">总共<span id="count">${count}</span>件商品</div>
                                <ul class="shop-pagi display-inline" id="pageul">

                                </ul>

                            </div>
                        </div>
                    </div>
                </div>
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
<script type="text/javascript" src="../resources/js/frontend/search.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/frontend/shop.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/local/cart.js" charset="utf-8"></script>
</body>

</html>