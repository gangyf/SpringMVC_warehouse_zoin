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

        <!--body wrapper start-->
        <!-- page heading start-->
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

        <!--body wrapper start-->
        <div class="wrapper">
        <div class="row">
        <div class="col-sm-12">
        <section class="panel">
        <header class="panel-heading">
			            仓库列表
            <span class="tools pull-right">
                <a href="javascript:;" class="fa fa-chevron-down"></a>
                <a href="javascript:;" class="fa fa-times"></a>
             </span>
        </header>
        <c:if test="${empty repolist}">
        	当前暂无仓库，不如新建一个吧！
        </c:if>
        
        <c:if test="${!empty repolist}">
        	
       
        <div class="panel-body">
        <div class="adv-table">
        <table  class="display table table-bordered table-striped" id="dynamic-table">
        <thead>
    
	        <tr>
	            <th>仓库名</th>
	            <th>查看</th>
	            <th>编辑</th>
	            <th>删除</th>
	        </tr>
        
        </thead>
        <tbody>
			<c:if test="${!empty repolist}">
				<c:forEach items="${repolist}" var="repo">
					<tr>
						<td>${repo.repositoryName }</td>
						<td>
							<a href="${pageContext.request.contextPath}/repo/repo_goods?id=${repo.id}">查看</a>
						</td>
						<td>
							<a href="${pageContext.request.contextPath}/repo/toedit?id=${repo.id}">编辑</a>
						</td>
						<td>
							<a onclick="javascript:return del();" href="${pageContext.request.contextPath}/repo/delete?id=${repo.id}">删除</a>
						</td>
					</tr>
				</c:forEach>
			</c:if>
			
        </tbody>
        </table>
		
        </div>
        </div>
        
        </c:if>
        </section>
        </div>
        </div>
        </div>
        <!--body wrapper end-->

        <!--footer section start-->
        <!--footer section end-->


    </div>
    <!-- main content end-->

        <!--body wrapper start-->
        <!--body wrapper end-->

        <!--footer section start-->
        <!--footer section end-->


	
	


</section>

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
<script src="js/dynamic_table_init.js"></script>

<!--common scripts for all pages-->
<script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>


<script type="text/javascript">
function del() {
	var msg = "确定要删除该仓库吗？";
	if (confirm(msg)==true){
		$.ajax({  
	        type: "post",
	        url: "http://localhost:8080/SpringMVC_warehouse_zoin/allTimes",  
	        contentType: false,  
	        cache: false,  
	        currentType: false,  
	        processData: false,    
	        success: function (res) {
	        	
	        	if(res=="success"){
	        		alert("删除成功!");
	        		return true;
	        	}
	        	else{
	        		alert("仓库中还有货物,删除失败!")
	        		return false;
	        	}
	        	
	        }
		});
	}else{
		return false;
	}
	}
</script>
</body>
</html>
