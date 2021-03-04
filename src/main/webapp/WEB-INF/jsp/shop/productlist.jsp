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

    <title>商家管理后台</title>

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

<%@include file="shopmainhead.jsp"%>
    <!-- Left side column. contains the sidebar -->
<%@include file="shopmainsidebar.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <h1>
                Product Orders
            </h1>
        </div>

        <!-- Main content -->
        <div class="content">

            <div class="row">
                <div class="col-12">
                    <div class="box">
                        <table id="productorder" class="table table-hover no-wrap product-order" data-page-size="10">
                            <thead>
                            <tr>
                                <th>商品名</th>
                                <th>商品类型</th>
                                <th>商品品牌</th>
                                <th>缩略图</th>
                                <th>商品描述</th>
                                <th>原价</th>
                                <th>现价</th>
                                <th>状态</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${productList}" var="p">
                            <tr>
                                <td>${p.productName}</td>
                                <td>${p.productCategory.productCategoryName}</td>
                                <td>${p.productBrand.productBrandName}</td>
                                <td><img src="${p.imgAddr}" alt="product" width="80"></td>
                                <td>${p.productDesc}</td>
                                <td>${p.normalPrice}</td>
                                <td>${p.promotionPrice}</td>
                                <!--在售-->
                                    <c:choose>
                                        <c:when test="${p.enableStatus==1}">
                                <td><span class="label label-success">在售</span></td>
                                        </c:when>
                                        <c:otherwise><td><span class="label label-warning">下架</span></td>
                                        </c:otherwise>
                                    </c:choose>
                               <!-- <td><span class="label label-warning">草稿</span></td>
                                <td><span class="label label-danger">售罄</span></td>-->

                                <td class="product-a"><a href="#" data-id="${p.productId}" class="text-info pr-10" data-toggle="tooltip" data-original-title="编辑"><i class="ti-marker-alt"></i></a>
                                    <c:choose>
                                    <c:when test="${p.enableStatus==1}">
                                    <a href="#" class="text-danger" data-id="${p.productId}" data-status="0" data-original-title="下架" data-toggle="tooltip"><i class="ti-arrow-down"></i></a>
                                    </c:when>
                                    <c:otherwise>
                                    <a href="#" class="text-danger" data-id="${p.productId}" data-status="1" data-original-title="上架" data-toggle="tooltip"><i class="ti-arrow-up"></i></a>
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
    <!-- /.content-wrapper -->

<%@include file="shopmainfooter.jsp"%>    <!-- Control Sidebar -->
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
<script src="../../../resources/assets/vendor_components/datatable/datatables.js"></script>

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

<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/product/productlist.js" charset="utf-8"></script>

</body>
</html>
