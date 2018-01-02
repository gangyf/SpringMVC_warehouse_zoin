<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <link rel="shortcut icon" href="#" type="image/png">

  <title>Dynamic Table</title>

  <!--dynamic table-->
  <link href="${pageContext.request.contextPath}/admin/js/advanced-datatable/css/demo_page.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/admin/js/advanced-datatable/css/demo_table.css" rel="stylesheet" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/admin/js/data-tables/DT_bootstrap.css" />

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
    
        <!-- page heading end-->
		<div class="page-heading">
            <h3>
               仓库详情
            </h3>
            <ul class="breadcrumb">
                <li>
                    <a href="#">仓库管理系统</a>
                </li>
                <li>
                    <a href="#">查看仓库</a>
                </li>
                
            </ul>
        </div>
        <!-- page heading end-->
        <div class="wrapper">
        <div class="row">
        <div class="col-sm-12">
        <section class="panel">
        <header class="panel-heading">
            ${repo.repositoryName }
            <span class="tools pull-right">
                <a href="javascript:;" class="fa fa-chevron-down"></a>
                <a href="javascript:;" class="fa fa-times"></a>
             </span>
        </header>
        <div class="panel-body">
        <div class="adv-table">
        <table  class="display table table-bordered table-striped" id="dynamic-table">
        <thead>
        <tr>
            <th>货物名称</th>
            <th>货物单价</th>
            <th class="hidden-phone">货物数量</th>
            <th class="hidden-phone">供应商</th>
            <th class="hidden-phone">货物产地</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${repo.goods}" var="good">
        	<tr class="gradeX">
            <td>${good.name }</td>
            <td>${good.price }</td>
            <td class="hidden-phone">${good.number}</td>
            <td class="center hidden-phone">${good.supplier }</td>
            <td class="center hidden-phone">${good.area }</td>
        </tr>
        </c:forEach>
        </tbody>
        </table>
        </div>
        </div>
        </section>
        </div>
        </div>
</div>


        <!--body wrapper start-->






        <!--body wrapper start-->

        <!-- page heading end-->

        <!--body wrapper start-->


        <!--body wrapper start-->
        <!--body wrapper end-->




  


        <!--footer section start-->
        <!--footer section end-->


<!-- Placed js at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/admin/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/modernizr.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery.nicescroll.js"></script>

<!--dynamic table-->
<script type="text/javascript" language="javascript" src="${pageContext.request.contextPath}/admin/js/advanced-datatable/js/jquery.dataTables.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/data-tables/DT_bootstrap.js"></script>
<!--dynamic table initialization -->
<script src="${pageContext.request.contextPath}/admin/js/dynamic_table_init.js"></script>

<!--common scripts for all pages-->
<script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>

</body>
</html>
