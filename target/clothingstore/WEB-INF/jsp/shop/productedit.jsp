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
                Product Add
            </h1>
        </div>

        <!-- Main content -->
        <section class="content">
            <div class="row">
                <div class="col-12">
                    <div class="box">
                        <div class="box-header with-border">
                            <h3 class="box-title">商品信息</h3>
                        </div>
                        <div class="box-body">
                            <form action="#">
                                <div class="form-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">商品名称</label>
                                                <input id="productid" type="hidden" value="${product.productId}">
                                                <input id="product-name" type="text" class="form-control" placeholder="product name" value="${product.productName}">
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">商品权重</label>
                                                <input id="priority" type="text" class="form-control" placeholder="权重越大显示越前" value="${product.priority}">
                                            </div>
                                        </div>
                                        <!--/span-->
                                    </div>
                                    <!--/row-->
                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">商品分类</label>
                                                <select id="category" class="form-control" data-placeholder="Choose a Category" tabindex="1">
                                                    <c:forEach items="${productCategoryList}" var="pc">
                                                        <option data-value="${pc.productCategoryId}">${pc.productCategoryName}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <label class="text-info">商品品牌</label>
                                            <select id="brand" class="form-control" data-placeholder="Choose a Category" tabindex="1">
                                                <c:forEach items="${productBrandList}" var="pb">
                                                    <c:choose>
                                                        <c:when test="${product.productBrand.productBrandId==pb.productBrandId}">
                                                            <option data-value="${pb.productBrandId}" selected="selected">${pb.productBrandName}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option data-value="${pb.productBrandId}">${pb.productBrandName}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <!--/span-->

                                        <!--/span-->
                                    </div>





                                    <!--/row-->
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">原价</label>
                                                <div class="input-group">
                                                    <div class="input-group-addon"><i class="ti-money"></i></div>
                                                    <input id="normal-price" type="text" class="form-control" placeholder="请输入价格" value="${product.normalPrice}"> </div>
                                            </div>
                                        </div>
                                        <!--/span-->
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="text-info">现价</label>
                                                <input id="promotion-price" type="text" class="form-control" placeholder="请输入现价" value="${product.promotionPrice}">
                                            </div>
                                        </div>
                                    </div>



                                    <div class="row">
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label class="text-info">商品简介</label>
                                                <textarea id="product-desc" class="form-control" rows="4" placeholder="本商品源自于......">${product.productDesc}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <!--/row-->
                                    <div class="row">

                                        <!--/span-->
                                        <div class="col-md-3">
                                            <h3 class="box-title mt-20">上传图片</h3>
                                            <div class="product-img text-left">

                                                <!--上传后图片位置-->
                                                <img src="../../../images/product/product-3.png" alt="">

                                                <div class="fileupload btn btn-success">
                                                    <span><i class="ion-upload mr-5"></i>上传缩略图</span>
                                                    <input type="file" class="upload" id="small-img">
                                                </div>
                                                <!--<button class="btn bg-info">Edit</button>
                                                <button class="btn bg-danger">Delete</button>-->
                                            </div>
                                            <div class="detail-img-div ">
                                                <div class="item-input" id="detail-img">
                                                    <span><i class="ion-upload mr-5"></i>上传详情图片</span>
                                                    <input type="file" class="detail-img">
                                                    <!--<input type="file" class="detail-img">
                                                    <input type="file" class="detail-img">-->
                                                </div>
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
                                    <button type="button" id="submit" class="btn btn-success"> <i class="fa fa-check"></i>发布</button>
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

<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/product/productedit.js" charset="utf-8"></script>
</body>
</html>
