<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link href="js/iCheck/skins/minimal/minimal.css" rel="stylesheet">
  <link href="js/iCheck/skins/square/square.css" rel="stylesheet">
  <link href="js/iCheck/skins/square/red.css" rel="stylesheet">
  <link href="js/iCheck/skins/square/blue.css" rel="stylesheet">

  <!--dashboard calendar-->
  <link href="css/clndr.css" rel="stylesheet">


  <!--common-->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">


  <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
</head>

<body class="sticky-header">

<section>
    <!-- left side start-->
    <div class="left-side sticky-left-side">

        <!--logo and iconic logo start-->
        <div class="logo">
            <a href="${pageContext.request.contextPath}/admin/good/index.jsp"><img src="${pageContext.request.contextPath}/admin/images/logo.png" alt=""></a>
        </div>

        <div class="logo-icon text-center">
            <a href="${pageContext.request.contextPath}/admin/good/index.jsp"><img src="${pageContext.request.contextPath}/admin/images/logo_icon.png" alt=""></a>
        </div>
        <!--logo and iconic logo end-->


        <div class="left-side-inner">

            <!--sidebar nav start-->
            <ul class="nav nav-pills nav-stacked custom-nav">
                <li class="menu-list"><a href="index.html"><i class="fa fa-home"></i> <span>货物管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${pageContext.request.contextPath}/good/getall"> 查看货物</a></li>
                        <li><a href="${pageContext.request.contextPath}/good/toadd"> 货物入库</a></li>
                    </ul>
                </li>
                
                <li class="menu-list"><a href="index.html"><i class="fa fa-home"></i> <span>仓库管理</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${pageContext.request.contextPath}/repo/getall"> 查看仓库</a></li>
                        <li><a href="${pageContext.request.contextPath}/repo/toadd"> 新增仓库</a></li>
                    </ul>
                </li>
                
              
                <li class="menu-list"><a href=""><i class="fa fa-file-text"></i> <span>用户中心</span></a>
                    <ul class="sub-menu-list">
                        <li><a href="${pageContext.request.contextPath}/admin/user/profile.jsp"> 我的信息</a></li>
                    </ul>
                </li>
               

            </ul>
            <!--sidebar nav end-->

        </div>
    </div>
    <!-- left side end-->
    <!-- left side end-->
    

</section>

<!-- Placed js at the end of the document so the pages load faster -->
<script src="js/jquery-1.10.2.min.js"></script>
<script src="js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="js/jquery-migrate-1.2.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/modernizr.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>

<!--easy pie chart-->
<script src="js/easypiechart/jquery.easypiechart.js"></script>
<script src="js/easypiechart/easypiechart-init.js"></script>

<!--Sparkline Chart-->
<script src="js/sparkline/jquery.sparkline.js"></script>
<script src="js/sparkline/sparkline-init.js"></script>

<!--icheck -->
<script src="js/iCheck/jquery.icheck.js"></script>
<script src="js/icheck-init.js"></script>

<!-- jQuery Flot Chart-->
<script src="js/flot-chart/jquery.flot.js"></script>
<script src="js/flot-chart/jquery.flot.tooltip.js"></script>
<script src="js/flot-chart/jquery.flot.resize.js"></script>
<script src="js/flot-chart/jquery.flot.pie.resize.js"></script>
<script src="js/flot-chart/jquery.flot.selection.js"></script>
<script src="js/flot-chart/jquery.flot.stack.js"></script>
<script src="js/flot-chart/jquery.flot.time.js"></script>
<script src="js/main-chart.js"></script>

<!--common scripts for all pages-->
<script src="js/scripts.js"></script>


</body>
</html>
