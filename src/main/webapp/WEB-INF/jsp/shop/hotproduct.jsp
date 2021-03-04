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
    <!-- =============================================== -->

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <h1>
                热销商品
            </h1>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-xl-12 col-12">

                    <!-- Doughnut CHART -->
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">商品销量</h3>

                            <ul class="box-controls pull-right">
                                <li><a class="box-btn-close" href="#"></a></li>
                                <li><a class="box-btn-slide" href="#"></a></li>
                                <li><a class="box-btn-fullscreen" href="#"></a></li>
                            </ul>
                        </div>
                        <div class="box-body">
                            <div class="chart">
                                <canvas id="chart_7" height="100"></canvas>
                            </div>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->




                </div>
            </div>
            <!-- /.row -->
        </section>
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
<script src="../../../resources/assets/vendor_components/datatable/datatables.min.js"></script>

<!-- Fab Admin App -->
<script src="../../../resources/js/template.js"></script>

<!-- Fab Admin for demo purposes -->
<script src="../../../resources/js/demo.js"></script>

<!-- Data Table -->
<script src="../../../resources/js/pages/data-table.js"></script>

<script src="../../../resources/assets/vendor_components/chart.js-master/Chart.min.js"></script>

<script src="../../../resources/js/pages/widget-charts2.js"></script>

<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/product/productedit.js" charset="utf-8"></script>
</body>
</html>
