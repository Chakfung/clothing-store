<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<<head>
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
        <!-- =============================================== -->

    <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">
            <!-- Content Header (Page header) -->
            <div class="content-header">
                <h1>
                    Add Headline
                </h1>
            </div>

            <!-- Main content -->
            <div class="content">
                <div class="row">
                    <div class="col-12">
                        <div class="box">
                            <!--<div class="box-header with-border">
                                <h3 class="box-title">商家信息</h3>
                            </div>-->
                            <div class="box-body">
                                <form action="/shopadmin/modifyshop" method="post" enctype="multipart/form-data">
                                    <div class="form-body">
                                        <div class="row mt-50 mb-50">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-info">商铺</label>

                                                    <c:choose>
                                                        <c:when test="${headLine!=null}">
                                                            <span id="headline" data-id="${headLine.lineId}">${headLine.shop.shopName}</span>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <select id="shop" class="form-control">
                                                                <c:forEach items="${shopList}" var="s">
                                                                    <option data-id="${s.shopId}">${s.shopName}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-info">权重</label>
                                                    <input class="form-control" type="text" id="priority" value="${headLine.priority}" placeholder="权重越大显示越前">
                                                </div>
                                            </div>
                                            <!--/span-->
                                        </div>
                                        <!--/row-->
                                        <!--/row-->






                                        <!--/row-->
                                        <div class="row mt-50 mb-50">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-info">头条标语1</label>
                                                    <div class="input-group">
                                                        <input  class="form-control" type="text" id="poster1" value="${headLine.poster1}" placeholder="第一条头条标语">
                                                    </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-info">头条标语2</label>
                                                    <div class="input-group">
                                                        <input  class="form-control" type="text" id="poster2" value="${headLine.poster2}" placeholder="第二条头条标语">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>



                                        <div class="row mt-50 mb-50">
                                            <div class="col-md-12">
                                                <div class="form-group">
                                                    <label class="text-info">略缩图</label>
                                                    <input type="file" id="lineImg" class="upload">
                                                </div>
                                            </div>
                                        </div>
                                        <!--/row-->


                                        <!--/row-->
                                        <div class="row mt-50 mb-50 ">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-info">验证码</label>
                                                    <div class="input-group">

                                                        <input type="text" id="j_kaptcha" class="form-control" placeholder="请输入验证码" value=""> </div>
                                                </div>
                                            </div>
                                            <!--/span-->
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="text-info"></label>
                                                    <img  id="kaptcha_img" alt="点击更换" title="点击更换" onclick="changeVerifyCode(this)" src="../Kaptcha"/>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-actions col-md-12" style="text-align: center">
                                                <button type="button" id="submit" class="btn btn-success mt-50 mb-50"> 提交</button>

                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.content -->
        </div>
        <!-- /.content-wrapper -->

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

<script type='text/javascript'
        src='//g.alicdn.com/sj/lib/zepto/zepto.js' charset='utf-8'></script><script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>
<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../../../resources/js/superadmin/headline.js" charset="utf-8"></script>
</body>
</html>
