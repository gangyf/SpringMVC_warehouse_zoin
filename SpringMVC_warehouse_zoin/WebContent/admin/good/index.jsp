<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="keywords" content="admin, dashboard, bootstrap, template, flat, modern, theme, responsive, fluid, retina, backend, html5, css, css3">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title></title>

  <!--icheck-->
  <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/admin/js/iCheck/skins/square/blue.css" rel="stylesheet">

  <!--dashboard calendar-->
  <link href="${pageContext.request.contextPath}/admin/css/clndr.css" rel="stylesheet">


  <!--common-->
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
	<%@ include  file="/admin/base.jsp"%>
	
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
	 <div class="alert alert-success alert-block fade in">
                                <button type="button" class="close close-sm" data-dismiss="alert">
                                    <i class="fa fa-times"></i>
                                </button>
                                <h4>
                                    <i class="icon-ok-sign"></i>
                                    欢迎来到仓库管理系统!
                                </h4>
                            </div>                         
    
<div class="page-heading">
            <h3>
                近日仓库统计图
            </h3>
       
        </div>
        <!-- page heading end-->
		 <div id="flot-placeholder1"></div>
        <!--body wrapper start-->
        <div class="wrapper">
            <div class="row">
                <div class="col-sm-12">
                    <section class="panel">
                        <header class="panel-heading">
                            货物出入库次数统计
                        <span class="tools pull-right">
                            <a href="javascript:;" class="fa fa-chevron-down"></a>
                            <a href="javascript:;" class="fa fa-times"></a>
                         </span>
                        </header>
                        <div class="panel-body">
                            <div id="visitors-chart">
                                <div id="visitors-container" style="width: 100%;height:300px; text-align: center; margin:0 auto;">
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>

            </div>

        <!--body wrapper start-->
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


<!--icheck -->
<script src="${pageContext.request.contextPath}/admin/js/iCheck/jquery.icheck.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/icheck-init.js"></script>

<!-- jQuery Flot Chart-->
<script src="${pageContext.request.contextPath}/admin/js/flot-chart/jquery.flot.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/flot-chart/jquery.flot.tooltip.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/flot-chart/jquery.flot.resize.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/flot-chart/jquery.flot.pie.resize.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/flot-chart/jquery.flot.selection.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/flot-chart/jquery.flot.stack.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/flot-chart/jquery.flot.time.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/flot.chart.init.js"></script>
<!--common scripts for all pages-->
<script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>


</body>
</html>
