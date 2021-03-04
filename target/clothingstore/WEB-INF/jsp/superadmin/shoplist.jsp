<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="icon" type="image/x-icon" href="/upload/home/tlogo.ico">

        <title>超级管理员后台</title>

        <link rel="stylesheet" href="../../../resources/assets/vendor_components/material-design-iconic-font/css/materialdesignicons.css">
        <%--themfy-icon--%>
        <link rel="stylesheet" href="../../../resources/assets/vendor_components/themify-icons/themify-icons.css">

        <%--font awesome--%>
        <link rel="stylesheet" href="../../../resources/css/font-awesome.min.css">

        <!-- Bootstrap 4.0-->
        <link rel="stylesheet" href="../../../resources/assets/vendor_components/bootstrap/dist/css/bootstrap.min.css">

        <!-- Data Table-->
        <link rel="stylesheet" type="text/css" href="../../../resources/assets/vendor_components/datatable/datatables.min.css"/>

        <!-- Bootstrap extend-->
        <link rel="stylesheet" href="../../../resources/css/bootstrap-extend.css">

        <!-- Theme style -->
        <link rel="stylesheet" href="../../../resources/css/master_style.css">

        <!-- Fab Admin skins -->
        <link rel="stylesheet" href="../../../resources/css/skins/_all-skins.css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body class="hold-transition skin-blue-light sidebar-mini">
    <!-- Site wrapper -->
    <div class="wrapper">

        <%@include file="superadminhead.jsp"%>

        <!-- Left side column. contains the sidebar -->
        <%@include file="superadminsidebar.jsp"%>

        <div class="content-wrapper" >
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <h1>
                    Shops Order
                </h1>
            </div>

            <!-- Main content -->
            <div class="content">

                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <!-- <div class="box-body">
                               <div class="table-responsive">-->
                            <table id="productorder" class="table table-hover no-wrap product-order" data-page-size="10">
                                <thead>
                                <tr>
                                    <th>商店名称</th>
                                    <th>拥有者</th>
                                    <th>状态</th>
                                    <th>Action</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${shopList}" var="s">
                                    <tr class="ordertr">
                                        <td>${s.shopName}</td>
                                        <td>${s.owner.name}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${s.enableStatus==1}">
                                                    <span class="label label-success">正常</span>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="label label-danger">锁定</span>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                            <c:when test="${s.enableStatus==1}">
                                                <a href="#" class="lock" data-id="${s.shopId}"><span class="label label-danger">锁定</span></a>
                                            </c:when>
                                            <c:otherwise>
                                            <a href="#" class="unlock" data-id="${s.shopId}"><span class="label label-success">解锁</span>
                                                </c:otherwise>
                                                </c:choose>

                                        </td>


                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <!--</div>
                          </div>-->
                        </div>
                    </div>

                </div>



            </div>
            <!-- /.content -->
        </div>


        <%--<div class="content">
            <div class="content-block">
                <p>你好,<span id="user-name"></span></p>
                <div class="row row-shop">
                    <div class="col-40">商店名称</div>
                    <div class="col-40">状态</div>
                    <div class="col-20">操作</div>
                </div>
                <div class="shop-wrap">
                    <c:forEach items="${shopList}" var="s">
                        <div class="row row-shop"><div class="col-40">${s.shopName}</div>
                            <c:choose>
                                <c:when test="${s.enableStatus==1}">
                                    <div class="col-40">正常</div><div class="col-20"><a href="/shopadmin/getshopmanagementinfo?shopId=${s.shopId}">进入</a>
                                </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-40">锁定</div><div class="col-20"></div>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="content-block">
                <div class="row">
                    <div class="col-50">
                        <a href="/local/logout" id="log-out"
                           class="button button-big button-fill button-danger" usertype="2">退出系统</a>
                    </div>
                    <div class="col-50">
                        <a href="/shopadmin/getshopinitinfo" class="button button-big button-fill button-success">注册新店铺</a>
                    </div>
                </div>
            </div>
        </div>--%>
        <%@include file="superadminfooter.jsp"%>    <!-- Control Sidebar -->
        <aside class="control-sidebar control-sidebar-light">
            <!-- Create the tabs -->

            <div class="tab-content">
                <a href=""><i class="fa fa-reply"></i>登出</a>
            </div>
        </aside>
        <!-- /.control-sidebar -->

        <!-- Add the sidebar's background. This div must be placed immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->


    <!-- jQuery 3 -->
    <script src="../../../resources/assets/vendor_components/jquery/dist/jquery.min.js"></script>

    <!-- popper -->
    <script src="../../../resources/assets/vendor_components/popper/dist/popper.min.js"></script>

    <!-- Bootstrap 4.0-->
    <script src="../../../resources/assets/vendor_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- SlimScroll -->
    <script src="../../../resources/assets/vendor_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>

    <!-- FastClick -->
    <script src="../../../resources/assets/vendor_components/fastclick/lib/fastclick.js"></script>

    <!-- This is data table -->
    <script src="../../../resources/assets/vendor_components/datatable/datatables.min.js"></script>

    <!-- Fab Admin App -->
    <script src="../../../resources/js/template.js"></script>

    <!-- Fab Admin for demo purposes -->
    <script src="../../../resources/js/demo.js"></script>

    <!-- Data Table -->
    <script src="../../../resources/js/pages/data-table.js"></script>

    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

    <script type="text/javascript" src="../../../resources/js/common/common.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../resources/js/superadmin/shoplist.js" charset="utf-8"></script>

</body>
</html>
