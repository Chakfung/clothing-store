<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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


</head>

<body class="body-bg  bg-pic">
<!--[if lt IE 8]>
<![endif]-->
<!-- header start -->
<!-- header end -->
<div class="space-custom"></div>
<!-- breadcrumb start -->
<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="/frontend/listmainpageinfo"><i class="fa fa-home"></i></a></li>
            <li class="active">Login</li>
        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- login-area start -->
<!-- Content   ================================================== -->
<div  class="user-login pb-60">
    <div class="container content-bg-blue">
        <div class="row">
            <div class="centered-title text-center">
                <h2>Login</h2>
                <div class="clear"></div>
                <em>Clothing Store welcome you to login in！</em>
            </div>

            <div class="clear"></div>

            <div class="elements-tab-area col-md-6 col-md-offset-5 ptb-0">
                <ul class="tab-list">
                    <li class="active" id="customer"><a href="" data-toggle="tab">顾客</a></li>
                    <li id="mannager"><a href="" data-toggle="tab">管理人员</a></li>
                </ul>
            </div>
            <div class="col-md-6 col-sm-6 col-md-offset-3 col-sm-offset-3">
                <div class="row">
                    <form action="/local/login" method="post" class="login-form">
                        <p class="form-row pd-right">

                        </p>
                        <p class="form-row pd-right">
                            <label for="username">Username<span class="required">*</span></label>
                            <input type="text" name="username" id="username" class="form-controller">
                        </p>
                        <p class="form-row pd-left">
                            <label for="password">Password<span class="required">*</span></label>
                            <input type="password" name="password" id="password" class="form-controller">
                        </p>
                        <p class="form-row ">
                            <input type="submit" value="Login" name="login" class="theme-button marL0">
                            <label class="inline" for="rememberme">
                                <input type="checkbox" value="forever" id="rememberme" name="rememberme"> Remember me
                            </label>
                        </p>
                        <p class="lost_password">
                            <a href="/local/to_regist">还没注册?立即注册</a>
                        </p>
                    </form>
                </div>
            </div>
            <!-- /.col-md-6 -->
            <div class="col-md-6 ptb-20"></div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->
</div>
<!-- #content -->
<!-- login-area end -->






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
<script src="../resouces/js/main.js"></script>
</body>

</html>