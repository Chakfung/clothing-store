<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar">

        <!-- sidebar menu-->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="user-profile treeview">
                <a href="index.html">
                    <img src="/upload/home/protrait.jpg" alt="user">
                    <span>Marical</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-right pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="javascript:void(0)"><i class="fa fa-user mr-5"></i>My Profile </a></li>
                    <li><a href="javascript:void(0)"><i class="fa fa-money mr-5"></i>My Balance</a></li>
                    <li><a href="javascript:void(0)"><i class="fa fa-envelope-open mr-5"></i>Inbox</a></li>
                    <li><a href="javascript:void(0)"><i class="fa fa-cog mr-5"></i>Account Setting</a></li>
                    <li><a href="javascript:void(0)"><i class="fa fa-power-off mr-5"></i>Logout</a></li>
                </ul>
            </li>
            <li class="header nav-small-cap">PERSONAL</li>
            <li>
                <a href="/shopadmin/getshopbyid?shopId=${currentShop.shopId}" id="shopInfo">
                    <i class="fa fa-credit-card"></i> <span>商铺信息</span>

                </a>
            </li>
            <li class="treeview ">
                <a href="#">
                    <i class="fa fa-shopping-cart"></i>
                    <span>商品管理</span>
                    <span class="pull-right-container">

                            <i class="fa fa-angle-right pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/shopadmin/to_addproductbrand"><i class="fa fa-circle-thin"></i>添加品牌</a></li>
                    <li><a href="/shopadmin/getproductBrandlist"><i class="fa fa-circle-thin"></i>品牌管理</a> </li>
                    <li><a href="/shopadmin/to_addproduct"><i class="fa fa-circle-thin"></i>添加商品</a></li>
                    <li><a href="/shopadmin/getproductlistbyshop?pageIndex=1&pageSize=100"><i class="fa fa-circle-thin"></i>商品列表</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-file"></i>
                    <span>订单管理</span>
                    <span class="pull-right-container">
                         <i class="fa fa-angle-right pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/shopadmin/getorderlist?status=1&pageIndex=1&pageSize=100"><i class="fa fa-circle-thin"></i>未发货</a></li>
                    <li><a href="/shopadmin/getorderlist?status=2&pageIndex=1&pageSize=100"><i class="fa fa-circle-thin"></i>已发货</a></li>
                </ul>

            </li>
            <li class="treeview">
                <a herf="#">
                    <i class="fa fa-area-chart"></i>
                    <span>报表</span>
                    <span class="pull-right-container"><i class="fa fa-angle-right pull-right"></i></span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/shopadmin/to_hotproduct"><i class="fa fa-circle-thin"></i>热销商品</a></li>
                    <li><a href="/shopadmin/to_turnover"><i class="fa fa-circle-thin"></i>营业额</a></li>
            </li>
        </ul>
    </section>
</aside>