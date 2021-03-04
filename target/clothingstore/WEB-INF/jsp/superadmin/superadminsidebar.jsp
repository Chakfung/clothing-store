<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar-->
    <section class="sidebar">

        <!-- sidebar menu-->
        <ul class="sidebar-menu" data-widget="tree">
            <li class="user-profile treeview">
                <a href="index.html">
                    <img src="/upload/home/protrait.jpg" alt="user">
                    <span>Lili</span>
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
                <a href="/superadmin/getallshop">
                    <i class="fa fa-bank"></i>
                    <span>管理商铺</span>
                </a>
            </li>
            <li>
                <a href="/superadmin/getarealist">
                    <i class="fa fa-flag"></i>
                    <span>区域管理</span>
                </a>
            </li>
            <li>
            <a href="/superadmin/getparentpc">
                <i class="fa fa-credit-card"></i>
                <span>类别管理</span>
            </a>
             </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-fire"></i>
                    <span>头条管理</span>
                    <span class="pull-right-container">

                            <i class="fa fa-angle-right pull-right"></i>
                        </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/superadmin/getheadlinelist"><i class="fa fa-circle-thin"></i>头条列表</a></li>
                    <li><a href="/superadmin/to_addheadline"><i class="fa fa-circle-thin"></i>添加头条</a> </li>

                </ul>
            </li>
        </ul>
    </section>
</aside>