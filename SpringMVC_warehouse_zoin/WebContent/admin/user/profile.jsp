<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>Profile</title>

  <link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/admin/css/style-responsive.css" rel="stylesheet">
  
    <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/minimal/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/square/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/flat/green.css" rel="stylesheet">
    
     <!--ios7-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/ios-switch/switchery.css" />

    <!--icheck-->
    <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/minimal/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/square/green.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/flat/green.css" rel="stylesheet">

    <!--multi-select-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-multi-select/css/multi-select.css" />


    <!--tags input-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/admin/js/jquery-tags-input/jquery.tagsinput.css" />



  <link href="${pageContext.request.contextPath}/admin/css/style.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/admin/css/style-responsive.css" rel="stylesheet">   
    
  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
	<%@ include  file="/admin/base.jsp"%>
    <!-- left side end-->
    
    <!-- main content start-->
    <div class="main-content" >

        <!-- header section start-->
        <div class="header-section">

        <!--toggle button start-->
        <a class="toggle-btn"><i class="fa fa-bars"></i></a>
        <!--toggle button end-->

        <!--search start-->
        <form class="searchform" action="index.html" method="post">
            <input type="text" class="form-control" name="keyword" placeholder="Search here..." />
        </form>
        <!--search end-->

        <!--notification menu start -->
         <%@ include  file="/admin/base_user.jsp"%>
        <!--notification menu end -->

        </div>
        <!-- header section end-->

        <!-- page heading start-->
        <!--<div class="page-heading">-->
            <!--Page Tittle goes here-->
        <!--</div>-->
        <!-- page heading end-->

        <!--body wrapper start-->
        <div class="wrapper">

            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <div class="profile-pic text-center">
                                        <img alt="" src="${pageContext.request.contextPath}/admin/images/photos/qq.png">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="panel">
                                <div class="panel-body">
                                    <ul class="p-info">
                                        <li>
                                            <div class="title">用户名</div>
                                            <div class="desk">${user.userName }</div>
                                        </li>
                                        <li>
                                            <div class="title">邮箱</div>
                                            <div class="desk">${user.email }</div>
                                        </li>
                                        <li>
                                        	<div class="title">谷歌身份验证器</div>
			                                <div>
			                                	<c:if test="${user.openGoogleValidate==1 }">
				                                    <input type="checkbox" class="js-switch" checked="checked" id="changeGoogle"/>			                                	
			                                	</c:if>
			                                	<c:if test="${user.openGoogleValidate==0 }">
				                                    <input type="checkbox" class="js-switch" id="changeGoogle"/>			                                	
			                                	</c:if>
			                                </div>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <!--footer section end-->


    </div>
    <!-- main content end-->
</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/admin/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/modernizr.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery.nicescroll.js"></script>

<!--Sparkline Chart-->
<script src="${pageContext.request.contextPath}/admin/js/sparkline/jquery.sparkline.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/sparkline/sparkline-init.js"></script>



<script src="${pageContext.request.contextPath}/admin/js/ios-switch/switchery.js" ></script>
<script src="${pageContext.request.contextPath}/admin/js/ios-switch/ios-init.js" ></script>

<!--icheck -->
<script src="${pageContext.request.contextPath}/admin/js/iCheck/jquery.icheck.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/icheck-init.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/multi-select-init.js"></script>
<!--tags input-->
<script src="js/jquery-tags-input/jquery.tagsinput.js"></script>
<script src="js/tagsinput-init.js"></script>

<!--common scripts for all pages-->
<script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>

<script type="text/javascript">
$(function(){
	$("#changeGoogle").change(function() { 
		if($('#changeGoogle').is(':checked')) {
			alert("开启成功！"); 
		}
		else{
			alert("关闭成功！")
		}
		
		$.post("${pageContext.request.contextPath}/user/changeGoogleValidate");
		
	}); 
});  

</script>
</body>
</html>
