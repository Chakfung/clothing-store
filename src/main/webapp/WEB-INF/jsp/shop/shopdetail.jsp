<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
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
                商铺信息
            </h1>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="box">
                        <!--<div class="box-header with-border">
                            <h3 class="box-title">商家信息</h3>
                        </div>-->
                        <div class="box-body">
                            <form action="/shopadmin/modifyshop" method="post" enctype="multipart/form-data">
                                <div class="form-body">

                                    <div class="row">
                                        <div class="col-md-3">

                                            <div class="product-img text-left">

                                                <!--上传后图片位置-->
                                                <img src="" alt="" >

                                                <div class="fileupload btn btn-success">
                                                    <span><i class="ion-upload mr-5"></i>Upload Anonther Image</span>
                                                    <input type="file" class="upload" id="shop-img">
                                                </div>
                                                <!--<button class="btn bg-info">Edit</button>
                                                <button class="btn bg-danger">Delete</button>-->
                                            </div>
                                        </div>
                                    </div>
                                    <!--/row-->
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-info">商铺名</label>
                                            <div class="input-group">
                                            <input type="hidden" id="shop-id" value="${shop.shopId}">
                                            <input type="text" class="form-control" id="shop-name" placeholder="请输入名称" value="${shop.shopName}"> </div>
                                        </div>
                                    </div>
                                    <!--/span-->
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="text-info">入驻时间</label>
                                            <input type="text" class="form-control" placeholder="入驻时间"
                                                   value="<fmt:formatDate value="${shop.createTime}" pattern="yyyy-MM-dd"/>">
                                        </div>
                                    </div>
                                    </div>


                                    <!--/row-->
                                    <div class="row">
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">所属区域</label>
                                                <select id="area">
                                                    <c:forEach var="Area" items="${areaList}">
                                                        <c:choose>
                                                        <c:when test="${shop.area.areaId==Area.areaId}">
                                                            <option data-id="${Area.areaId}" selected="selected">${Area.areaName}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option data-id="${Area.areaId}">${Area.areaName}</option>
                                                        </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">详细电话</label>
                                                <div class="input-group">
                                                    <input type="text" id="shop-phone" class="form-control" placeholder="请输入电话" value="${shop.phone}"> </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">详细地址</label>
                                                <input type="text"  id="shop-addr" class="form-control" placeholder="请输入地址" value="${shop.shopAddr}">
                                            </div>
                                        </div>
                                    </div>




                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="text-info">商家简介</label>
                                                <textarea id="shop-desc" class="form-control" rows="4" placeholder="店铺简介">${shop.shopDesc}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/row-->
                                    <div class="row">
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

                                </div>
                                <div class="form-actions mt-10">
                                    <button type="button" id="submit" class="btn btn-success"><i class="fa fa-check"></i>保存</button>
                                    <button type="button" class="btn btn-danger">取消</button>
                                </div>
                            </form>
                        </div>
                    </div>
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

<c:choose>
    <c:when test="${success}">
        <script>
            alert("修改成功");
        </script>
    </c:when>
    <c:otherwise>
        <c:if test="${errMsg!=null}">
        <script>
            alert("${errMsg}");
        </script>
        </c:if>
    </c:otherwise>
</c:choose>


<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/shop/modifyshop.js" charset="utf-8"></script>

</body>
</html>
