<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header class="header-pos">
    <div class="header-area header-middle">
        <div class="container-fluid">
            <div class="row" style="background-color:rgba(255, 204, 68, 0.5);">
                <div class="col-md-2 col-sm-3 col-xs-12 text-center" style="background-color:rgba(255,255,255,0.64);">

                        <a href="/frontend/listmainpageinfo" ><img src="/upload/home/logo.png" height="95px" alt="" /></a>

                </div>
                <div class="col-md-10 col-sm-9 col-xs-12 text-right xs-center" style="background: rgba(255, 204, 68, 0.5)">
                    <div class="main-menu display-inline hidden-sm hidden-xs">
                        <nav>
                            <ul id="headul">
                                <li><a href="/frontend/listmainpageinfo">Home</a>

                                </li>
                                <li><a href="/frontend/search?pageIndex=1&pageSize=12">商品</a>
                                    <div class="mega-menu">
                                        <c:forEach items="${productParentCategoryList}" var="ppc">
                                            <ul>
                                                <li class="mega-title"><a href="#" class="ppca" data-id="${ppc.productCategoryId}">${ppc.productCategoryName}</a></li>
                                                <c:forEach items="${productChildCategoryList}" var="pcc">
                                                    <c:if test="${pcc.parent.productCategoryId==ppc.productCategoryId}">
                                                        <li><a href="#" class="pcca" data-id="${pcc.productCategoryId}">${pcc.productCategoryName}</a></li>
                                                    </c:if>
                                                </c:forEach>
                                            </ul>
                                        </c:forEach>
                                    </div>
                                </li>

                                <li><a href="#">品牌</a>
                                    <ul class="submenu">
                                        <c:forEach items="${productBrandList}" var="pb">
                                            <li><a href="/frontend/search?pbid=${pb.productBrandId}&pageIndex=1">${pb.productBrandName}</a></li>
                                        </c:forEach>
                                    </ul>
                                </li>


                            </ul>
                        </nav>
                    </div>

                    <div class="search-block-top display-inline">
                        <!--<div class="icon-search"></div>
                        <div class="toogle-content">-->

                            <input type="text" id="pn" placeholder="Search" />
                            <button class="button-search"></button>

                        <!--</div> -->
                    </div>

                    <div class="shopping-cart ml-20 display-inline">
                        <a href="/local/getcartlist"><b>shopping cart</b></a>

                    </div>


                    <div class="setting-menu display-inline">
                        <div class="icon-nav current"></div>
                        <ul class="content-nav toogle-content">
                            <li class="currencies-block-top">
                                <div class="current"><b>My Account</b></div>
                                <ul>
                                    <li><a href="#">My account</a></li>
                                    <li><a href="#">My wishlist</a></li>
                                    <li><a href="/local/getorderlist">Checkout</a></li>
                                    <li><a href="/local/to_login">Log in</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>

</header>
