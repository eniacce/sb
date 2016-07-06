<%--<%@include file="WEB-INF/layouts/meta.jsp" %>--%>



    <%--<%@include file="WEB-INF/layouts/header.jsp"%>--%>

    <%--<%@include file="WEB-INF/layouts/footer.jsp"%>--%>

<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <meta charset="utf-8"/>
    <title>PAYGURU | <?= TITLE_LOGIN ?></title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta http-equiv="Content-type" content="text/html; charset=utf-8">
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" type="text/css"/>
    <link href="resources/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/assets/global/plugins/uniform/css/uniform.default.min.css" rel="stylesheet" type="text/css"/>
    <link href="resources/assets/global/plugins/icheck/skins/all.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN PAGE LEVEL STYLES -->
    <link href="resources/assets/admin/pages/css/login2.css" rel="stylesheet" type="text/css"/>
    <link href="resources/assets/admin/layout2/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END PAGE LEVEL SCRIPTS -->
    <!-- BEGIN THEME STYLES -->
    <link href="resources/assets/global/css/components-md.css" id="style_components" rel="stylesheet" type="text/css"/>
    <link href="resources/assets/global/css/plugins-md.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-md login loaded">
<div id="loader-wrapper">
    <div id="loader"></div>
    <div class="loader-section section-left"></div>
    <div class="loader-section section-right"></div>
</div>
<!-- BEGIN SIDEBAR TOGGLER BUTTON -->
<div class="menu-toggler sidebar-toggler">
</div>
<!-- END SIDEBAR TOGGLER BUTTON -->
<!-- BEGIN LOGO -->
<div class="logo">
    <a href="/">
        <img src="/assets/admin/layout2/img/payguru.png" alt=""/>
    </a>
</div>
<!-- END LOGO -->
<!-- BEGIN LOGIN -->
<div class="content">

    <!-- BEGIN LOGIN FORM -->
    <form class="login-form" action="login" method="post">
        <div class="form-title">
            <span class="form-title">WELCOME</span>

        </div>
        <div class="form-group">
            <!--ie8, ie9 does not support html5 placeholder, so we just show field title for that-->
            <label class="control-label visible-ie8 visible-ie9">Username</label>
            <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="Username" name="username"/>
        </div>
        <div class="form-group">
            <label class="control-label visible-ie8 visible-ie9">Password</label>
            <input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="Password" name="password"/>
        </div>
        <div class="form-actions">
            <button type="submit" onclick="showLoading()" class="btn btn-primary btn-block uppercase"><?= LABEL_LOGIN ?></button>
        </div>
        <div class="form-actions">
            <div class="pull-left">
                <label class="rememberme check">
                    <input type="checkbox" class="form-control icheck" name="remember" value="1"/>Hatirla
                </label>
            </div>
            <div class="pull-right forget-password-block">
                <a href="javascript:;" id="forget-password" class="forget-password">Forget Password</a>
            </div>
        </div>
    </form>
    <!-- END LOGIN FORM -->
    <!-- BEGIN FORGOT PASSWORD FORM -->
    <form class="forget-form" action="/forgot-password" method="post">
        <div class="form-title">
            <span class="form-title">Forget Password ?</span>
            <span class="form-subtitle">Enter your e-mail to reset it.</span>
        </div>
        <div class="form-group">
            <input class="form-control placeholder-no-fix" type="text" autocomplete="off" placeholder="Email" name="email"/>
        </div>
        <div class="form-actions">
            <button type="button" id="back-btn" class="btn btn-default">Back</button>
            <button type="submit" class="btn btn-primary uppercase pull-right">Submit</button>
        </div>
    </form>
    <!-- END FORGOT PASSWORD FORM -->

</div>
<div class="copyright hide">
    2015 © PAYGURU.
</div>
<!-- END LOGIN -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="resources/assets/global/plugins/respond.min.js"></script>
<script src="resources/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="resources/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="resources/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="resources/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="resources/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="resources/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="resources/assets/global/plugins/icheck/icheck.min.js" type="text/javascript"></script>

<!-- END CORE PLUGINS -->
<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="resources/assets/global/plugins/jquery-validation/js/jquery.validate.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="resources/assets/global/scripts/metronic.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
    jQuery(document).ready(function () {
        $('.icheck').iCheck({
            checkboxClass: 'icheckbox_minimal-blue'
        });
        //Metronic.init();

    });
</script>
<script src="resources/assets/admin/pages/scripts/script.js" type="text/javascript"></script>
<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>
