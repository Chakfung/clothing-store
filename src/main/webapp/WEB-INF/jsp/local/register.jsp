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
    <%--themfy-icon--%>
    <link rel="stylesheet" href="../../../resources/assets/vendor_components/themify-icons/themify-icons.css">

    <%--font awesome--%>
    <link rel="stylesheet" href="../../../resources/css/font-awesome.min.css">
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
    <link rel="stylesheet" href="../../css/custom.css">

    <!-- Modernizr JS -->
    <script src="../resources/js/vendor/modernizr-2.8.3.min.js"></script>
    <script>



        window.onload = function(){
            document.getElementById("form").onsubmit = function(){
                return checkUsername() && checkPassword1() && checkPassword2() && checkEmail() &&checkname();
            }
            document.getElementById("name").onblur = checkname;
            document.getElementById("username").onblur = checkUsername;
            document.getElementById("password1").onblur = checkPassword1;
            document.getElementById("password2").onblur = checkPassword2;
            document.getElementById("email").onblur = checkEmail;
        }

        function checkname(){
            var name = document.getElementById("name").value;
            var reg_name = /^[\u4E00-\u9FA5A-Za-z]+$/;
            var flag = reg_name.test(name);
            var s_name = document.getElementById("s_name");

            if(flag){
                s_name.innerHTML = "<i class='fa fa-check' style='color:#93bcff;'></i>";
            }else{
                s_name.innerHTML = "<span style='color: #ff5353; font-weight: bold;'>姓名格式有误</span>";
            }
            return flag;
        }

        function checkUsername(){
            var username = document.getElementById("username").value;
            var reg_username = /^[A-Za-z][A-Za-z0-9]{5,11}$/;
            var flag = reg_username.test(username);
            var s_username = document.getElementById("s_username");

            if(flag){
                s_username.innerHTML = "<i class='fa fa-check' style='color:#93bcff;'></i>";
            }else{
                s_username.innerHTML = "<span style='color: #ff625f;'>用户名格式有误</span>";
            }
            return flag;
        }

        function checkPassword1(){
            var password = document.getElementById("password1").value;
            var reg_password = /^\w{6,12}$/;
            var flag = reg_password.test(password);
            var s_password = document.getElementById("s_password1");

            if(flag){
                s_password1.innerHTML = "<i class='fa fa-check' style='color:#93bcff;'></i>";
            }else{
                s_password1.innerHTML = "<span style='color: #ff625f;'>密码格式有误</span>";
            }
            return flag;
        }

        function checkPassword2(){
            var password1 = document.getElementById("password1").value;
            var password2 = document.getElementById("password2").value;


            var s_password = document.getElementById("s_password2");

            if(password1===password2 && (password2).valueOf()){
                s_password.innerHTML = "<i class='fa fa-check' style='color:#93bcff;'></i>";
            }else if (!(password2).valueOf()) {
                s_password.innerHTML = "<span style='color: #ff625f;'>错误</span>";
            }else{
                s_password.innerHTML = "<span style='color: #ff625f;'>两次输入不一致</span>";
            }
            return flag;
        }

        function checkEmail(){
            var email = document.getElementById("email").value;
            var reg_email = /^\w+@[a-z0-9]+\.[a-z]{2,4}$/;
            var flag = reg_email.test(email);
            var s_email = document.getElementById("s_email");

            if(flag){
                s_email.innerHTML = "<i class='fa fa-check' style='color:#93bcff;'></i>";
            }else{
                s_email.innerHTML ="<span style='color: #ff625f;'>邮箱格式有误</span>";
            }
            return flag;
        }









        $(function () {

            $(":input").focus(function(){
                $(this).addClass("input");
            })
                .blur(function () {
                    $(this).removeClass("input");

                })
        })

    </script>
</head>

<body class="body-bg bg-pic">
<!--[if lt IE 8]>
<![endif]-->

<!-- header start -->

<!-- header end -->

<div class="space-custom"></div>
<!-- breadcrumb start -->
<div class="breadcrumb-area">
    <div class="container">
        <ol class="breadcrumb">
            <li><a href="home.html"><i class="fa fa-home"></i></a></li>
            <li class="active">register</li>

        </ol>
    </div>
</div>
<!-- breadcrumb end -->
<!-- login-area start -->
<div class="login-area">
    <div class="container content-bg content-bg-blue">
        <div class="row">
            <div class="centered-title text-center mb-40">
                <h2>Sign <span class="light-font">Up</span></h2>
                <div class="clear"></div>
                <em>register for clothing store to get around the shopping paradise <br>hurry up to join us</em>
            </div>
            <div class="clear"></div>
            <div class="col-md-8 col-sm-8 col-md-offset-2 col-sm-offset-2">
                <div id="form" class="billing-fields row">
                    <p class="form-row col-sm-12">
                        <label for="username">用户名<abbr title="required" class="required">*</abbr></label>
                        <p>
                            <input type="text" name="username" id="username" class="form-controller col-sm-10">
                            <span id="s_username" class="error col-sm-2"></span>
                        </p>
                    </p>
                    <p class="form-row col-sm-12">
                        <label for="name">姓名<abbr title="required" class="required">*</abbr></label>
                        <p>
                            <input type="text" name="name" id="name" class="form-controller col-sm-10">
                             <span id="s_name" class="error col-sm-2"></span>
                        </p>
                    </p>
                    <p class="form-row col-sm-12">
                        <label for="email">Email地址<abbr title="required" class="required">*</abbr></label>
                        <p>
                             <input type="text" name="email" id="email" class="form-controller col-sm-10">
                             <span id="s_email" class="error col-sm-2"></span>
                        </p>
                    </p>

                    <p class="form-row col-sm-12">
                        <label for="address">性别<abbr title="required" class="required">*</abbr></label>
                        <p>
                            <input type="text" name="address" id="address" placeholder="address" class="form-controller col-sm-10">
                        </p>
                    </p>


                    <p class="col-sm-12">
                        <label class="" for="password1">密码<abbr title="required" class="required">*</abbr></label>
                        <p>
                            <input type="password" value="" placeholder="password" id="password1" name="password1" class="form-controller col-sm-10">
                            <span id="s_password1" class="error col-sm-2"></span>
                        </p>
                    </p>
                    <p class="col-sm-12" >
                        <label class="" for="password2">密码确认 <abbr title="required" class="required">*</abbr></label>
                        <p>
                            <input type="password" value="" placeholder="Password" id="password2" name="password2" class="form-controller col-sm-10">
                             <span id="s_password2" class="error col-sm-2"></span>
                        </p>
                    </p>
                    <p class="col-sm-12">
                        <input type="checkbox" value="forever" id="rememberme" name="rememberme">
                        <label class="inline" for="rememberme">I agree <a href="#">Terms & Condition</a></label>
                    </p>
                    <p class="col-sm-12">
                        <input type="submit" id="submit" value="Register" name="signup" class="theme-button marL0">
                    </p>
                </div>
            </div>
            <!-- /.col-md-6 -->
            <div class="col-md-6 marTB30"></div>
            <!-- /.col-md-6 -->

        </div>
        <!-- /.row -->
    </div>
</div>
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
<script src="../resources/js/main.js"></script>

<script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
<script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

<script type="text/javascript" src="../resources/js/common/common.js" charset="utf-8"></script>
<script type="text/javascript" src="../resources/js/local/regist.js" charset="utf-8"></script>
</body>


</html>