<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
    <link rel="shortcut icon" href="#" type="image/png">

    <title>Login</title>

    <link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/css/style-responsive.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="js/html5shiv.js"></script>
    <script src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-body">

<div class="container">

    <form class="form-signin" action="${pageContext.request.contextPath}/user/googleValidate" method="post">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">仓库管理系统</h1>
            <img src="${pageContext.request.contextPath}/admin/images/login-logo.png" alt=""/>
        </div>
        <div class="login-wrap">
        	<font color='red'>${message}</font><br>
        	<font>请输入您的动态密码</font><br>
            <input type="text" class="form-control" placeholder="请输入您的动态密码" autofocus name="code">
            <button class="btn btn-lg btn-login btn-block" type="submit">
                <i class="fa fa-check"></i>
            </button>

            

        

        </div>


    </form>

</div>



<!-- Placed js at the end of the document so the pages load faster -->

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/admin/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/modernizr.min.js"></script>
<script type="text/javascript">
$(function(){ 
	var email=$("#email").val();
	$("#btn").click(function(){ 
		$.post("${pageContext.request.contextPath}/user/reset.action?email="+email);
		$("#myModal").attr("aria-hidden","true");
		
	}); 
}); 
</script>
</body>
</html>
