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

            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            货物出库
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal adminex-form" id="signupForm" method="get" action="${pageContext.request.contextPath}/good/out">
                                   	 <input type="hidden" value="${good.id }" name="id">
                                     <input type="hidden" value="${good.repository.id }" name="repoID">
                 					 <div class="form-group ">
                                        <label for="firstname" class="control-label col-lg-2">仓库名称</label>
                                        <div class="col-lg-3">
                                            <input class=" form-control" id="firstname"  type="text" readonly="readonly" value="${good.repository.repositoryName }"/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="firstname" class="control-label col-lg-2">货物名称</label>
                                        <div class="col-lg-3">
                                            <input class=" form-control" id="firstname" name="name" type="text" readonly="readonly" value="${good.name }"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group ">
                                        <label for="firstname" class="control-label col-lg-2">出库数量</label>
                                        <div class="col-lg-3">
                                            <input class=" form-control"  name="outnumber" type="number" id="outnumber"/>
                                        </div>
                                       	<div id="numbertip"></div>
                                       	<font color='red'>尚有存货 ${good.number }</font>
                                       	<input type="hidden" id="maxNumber" value="${good.number }">
                                    </div>                                    
                                    <div class="form-group">
                                        <div class="col-lg-offset-2 col-lg-10">
                                            <button class="btn btn-primary" type="submit">保存</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </section>
                </div>
            </div>

        <!--body wrapper start-->
        <!--body wrapper end-->

        <!--footer section start-->
        <!--footer section end-->


    </div>
    <!-- main content end-->



		






<!-- Placed js at the end of the document so the pages load faster -->
<script src="${pageContext.request.contextPath}/admin/js/jquery-1.10.2.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery-migrate-1.2.1.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/modernizr.min.js"></script>
<script src="${pageContext.request.contextPath}/admin/js/jquery.nicescroll.js"></script>

<!--pickers plugins-->
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap-daterangepicker/daterangepicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap-colorpicker/js/bootstrap-colorpicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/admin/js/bootstrap-timepicker/js/bootstrap-timepicker.js"></script>

<!--pickers initialization-->
<script src="js/pickers-init.js"></script>
<!--common scripts for all pages-->
<script src="js/scripts.js"></script>


<script type="text/javascript">
function del() {
	var msg = "确定要删除该货物吗？";
	if (confirm(msg)==true){
	return true;
	}else{
	return false;
	}
	}
</script>

<script type="text/javascript">  
$(function(){ 
    $("#outnumber").blur(function(){ 
    	var num=$("#outnumber").val();
    	var reg = /(^[1-9]+\d*$)|(^0$)/;  
        var flag= reg.test(num); 
    	if(!flag){
    		document.getElementById("numbertip").innerHTML="<font color='red'>"+"请输入正确的数量！"+"</font>";  
            //在div中提示用户该用户名不能为空  
			document.getElementById("outnumber").focus();//用户名输入控件获得焦点  
    	}
    	else{
    		var maxNumber=$("#maxNumber").val();
    		if(num>maxNumber){
    			document.getElementById("numbertip").innerHTML="<font color='red'>"+"数量超过最大值！"+"</font>";  
    			document.getElementById("outnumber").focus();
    		}
    		else{
    			document.getElementById("numbertip").innerHTML="";
    		}
    	}
        
    });   
});  
</script>

</body>
</html>
