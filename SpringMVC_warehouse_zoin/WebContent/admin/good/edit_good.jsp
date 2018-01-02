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


        <!--body wrapper start-->
            <div class="row">
                <div class="col-lg-12">
                    <section class="panel">
                        <header class="panel-heading">
                            货物修改
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal adminex-form" id="signupForm" method="post" action="${pageContext.request.contextPath}/good/update">
                                   <div class="form-group">
                        <input type="hidden" value="${good.id }" name="id" id="goodID">
                        <label class="col-sm-2 control-label col-lg-2" for="inputSuccess">仓库名称</label>
                        <div class="col-lg-3">
                            <select class="form-control" name="repoID"  >
								<c:forEach items="${repolist}" var="repo">
									<c:if test="${repo.id==good.repository.id}">
										<option value="${repo.id }" selected="selected" id="repoID">${repo.repositoryName }</option>										
									</c:if>
									<c:if test="${repo.id!=good.repository.id}">
										<option value="${repo.id }" >${repo.repositoryName }</option>										
									</c:if>
								</c:forEach>                            	
                                
                            </select>
                         </div>
                         </div>
                                    <div class="form-group ">
                                        <label for="firstname" class="control-label col-lg-2">货物名称</label>
                                        <div class="col-lg-3">
                                        	<input type="hidden" value="${good.name }" id="goodNameCopy" >
                                            <input class=" form-control"  name="name" type="text" value="${good.name }" id="name"/>
                                            <div id="showResult"></div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="lastname" class="control-label col-lg-2">货物单价</label>
                                        <div class="col-lg-3">
                                            <input class=" form-control" name="price" type="text" value="${good.price }" id="price"/>
                                            <div id="pricetip"></div>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="username" class="control-label col-lg-2">货物数量</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="number" type="text" value="${good.number }" id="number"/>
                                            <div id="numbertip"></div>
                                    	</div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="password" class="control-label col-lg-2">货物产地</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="area" type="text" value="${good.area }"/>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group ">
                                        <label for="password" class="control-label col-lg-2">生产日期</label>
                                        <div class="col-lg-3">
                                            <div data-date-viewmode="years" data-date-format="yyyy-mm-dd" data-date="${good.manufactureDate }"  class="input-append date dpYears">
                                            <input type="text" readonly="readonly"  value="${good.manufactureDate }" size="16" class="form-control" name="manufactureDate">
                                                          <span class="input-group-btn add-on">
                                                            <button class="btn btn-primary" type="button"><i class="fa fa-calendar"></i></button>
                                                          </span>
                                        </div>
                                        </div>
                                    </div>
                                    
                                    <div class="form-group ">
                                        <label for="username" class="control-label col-lg-2">供应商</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="supplier" type="text" value="${good.supplier }"/>
                                        </div>
                                    </div>
                                    <div class="form-group ">
                                        <label for="username" class="control-label col-lg-2">供应商联系方式</label>
                                        <div class="col-lg-3">
                                            <input class="form-control "  name="supplierPhone" type="text" value="${good.supplierPhone }" id="phone"/>
                                            <div id="phonetip"></div>
                                        </div>
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
<script src="${pageContext.request.contextPath}/admin/js/pickers-init.js"></script>
<!--common scripts for all pages-->
<script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>
<script type="text/javascript">  
$(function(){ 
    var inputUserNameObj = $("#name");   //将获取ID为uname的控件的对象  
    
    $("#name").blur(function(){   //当该控件失去焦点时发生  
    	
        var text = inputUserNameObj.val();   //获得用户输入的用户名  
    	var repoID=$("#repoID").val();
    	var goodID=$("#goodID").val();
        $.post("validateName.action?name="+text+"&repoID="+repoID+"&goodID="+goodID,null,function(response){      
                   //以POST方式跳转到action里面的方法中进行处理，并返回处理结果response  
             if(response=="exist"){ //根据返回值进行处理  
                          
                document.getElementById("name").focus();//用户名输入控件获得焦点  
                             
                    document.getElementById("showResult").innerHTML="<font color='red'>"+"该货物已存在"+"</font>";   
                                //在div中提示用户该用户名已经存在  
  
             }else{  
                if(document.getElementById("name").value=="") //判断用户名是否为空  
                {  
                document.getElementById("showResult").innerHTML="<font color='red'>"+"货物名不为空"+"</font>";  
                                 //在div中提示用户该用户名不能为空  
  
                document.getElementById("name").focus();//用户名输入控件获得焦点  
  
                }else{  
  					if($("#goodNameCopy").val()==text){
  						document.getElementById("showResult").innerHTML="";  
  					}	
  					else     
                		document.getElementById("showResult").innerHTML="<font color='blue'>"+"该货物为新货物"+"</font>";   
                                 //在div中提示用户该用户名可用  
                    }  
            }  
        });    
    });
    
    $("#number").blur(function(){ 
    	var num=$("#number").val();
    	var reg = /(^[1-9]+\d*$)|(^0$)/;  
        var flag= reg.test(num); 
    	if(!flag){
    		document.getElementById("numbertip").innerHTML="<font color='red'>"+"请输入正确的数量！"+"</font>";  
            //在div中提示用户该用户名不能为空  
			document.getElementById("number").focus();//用户名输入控件获得焦点  
    	}
    	else{
    		document.getElementById("numbertip").innerHTML="";
    	}
        
    });
    
    $("#price").blur(function(){ 
    	var num=$("#price").val();
    	var reg = /(^[1-9]+\d*$)|(^0$)/;
        var flag= reg.test(num); 
    	if(!flag){
    		document.getElementById("pricetip").innerHTML="<font color='red'>"+"请输入正确的价格！"+"</font>";  
            //在div中提示用户该用户名不能为空  
			document.getElementById("price").focus();//用户名输入控件获得焦点  
    	}
    	else{
    		document.getElementById("pricetip").innerHTML="";
    	}
    });
    
    $("#phone").blur(function(){ 
    	var len=$("#phone").val().trim().length;
    	if(len!=11){
    		document.getElementById("phonetip").innerHTML="<font color='red'>"+"请输入正确的手机号！"+"</font>";  
            //在div中提示用户该用户名不能为空  
			document.getElementById("phone").focus();//用户名输入控件获得焦点  
    	}
    	else{
    		document.getElementById("phonetip").innerHTML="";
    	}
    });
    
});  
</script>
</body>
</html>
