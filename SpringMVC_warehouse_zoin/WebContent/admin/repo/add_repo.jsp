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
                            增加仓库
                        </header>
                        <div class="panel-body">
                            <div class="form">
                                <form class="cmxform form-horizontal adminex-form" id="signupForm" method="post" action="${pageContext.request.contextPath}/repo/add">
                                    <div class="form-group ">
                                        <label for="firstname" class="control-label col-lg-2">仓库名称</label>
                                        <div class="col-lg-3">
                                            <input class=" form-control" name="repositoryName" type="text" id="name"/>
                                            <div id="nametip"></div>
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
<script src="${pageContext.request.contextPath}/admin/js/pickers-init.js"></script>
<!--common scripts for all pages-->
<script src="${pageContext.request.contextPath}/admin/js/scripts.js"></script>

<script type="text/javascript">  
$(function(){ 
    var inputUserNameObj = $("#name");   //将获取ID为uname的控件的对象  
    
    $("#name").blur(function(){   //当该控件失去焦点时发生  
    	
        var text = inputUserNameObj.val();   //获得用户输入的用户名  
        $.post("validateNameAdd.action?name="+text,null,function(response){      
                   //以POST方式跳转到action里面的方法中进行处理，并返回处理结果response  
             if(response=="exist"){ //根据返回值进行处理  
                          
                document.getElementById("name").focus();//用户名输入控件获得焦点  
                             
                    document.getElementById("nametip").innerHTML="<font color='red'>"+"该仓库名已存在，请换个名字!"+"</font>";   
                                //在div中提示用户该用户名已经存在  
  
             }else{  
                if(document.getElementById("name").value=="") //判断用户名是否为空  
                {  
                document.getElementById("nametip").innerHTML="<font color='red'>"+"仓库名不为空"+"</font>";  
                                 //在div中提示用户该用户名不能为空  
  
                document.getElementById("name").focus();//用户名输入控件获得焦点  
  
                }else{  
  
                         document.getElementById("nametip").innerHTML="<font color='blue'>"+"仓库名可用"+"</font>";   
                                 //在div中提示用户该用户名可用  
                     }  
            }  
        });    
    });
    
    
});  
</script>


</body>
</html>
