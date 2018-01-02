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

    <title>注册</title>
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
	<input type="hidden" value="${pageContext.request.contextPath}" id="projectName">
    <form class="form-signin" action="${pageContext.request.contextPath}/user/addUser" method="post">
        <div class="form-signin-heading text-center">
            <h1 class="sign-title">注册</h1>
            <img src="${pageContext.request.contextPath}/admin/images/login-logo.png" alt=""/>
        </div>


        <div class="login-wrap">
            
          
            <input type="text" autofocus="" placeholder="用户名" class="form-control" name="userName" id="username">
            <div id="nametip"></div>
            <input type="text" autofocus="" placeholder="邮箱" class="form-control" name="email">
            <input type="password" placeholder="密码" class="form-control" name="password" id="pwd1">
            <input type="password" placeholder="重复密码" class="form-control" id="pwd2">
    		<div id="pwdtip"></div>
    		
            <button type="submit" class="btn btn-lg btn-login btn-block">
            	 <i class="fa fa-check"></i>
            </button>

            <div class="registration">
                已经注册？
                <a href="login.jsp" class="">
                    去登陆吧！
                </a>
            </div>

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
    var inputUserNameObj = $("#username");   //将获取ID为uname的控件的对象  
    $("#username").blur(function(){   //当该控件失去焦点时发生  
        var text = inputUserNameObj.val();   //获得用户输入的用户名  
  		var projectName=$("#projectName").val();
        var url=projectName+"/user/validateUsername.action?name="+text;
        $.post(url,null,function(response){      
                   //以POST方式跳转到action里面的方法中进行处理，并返回处理结果response  
             if(response=="exist"){ //根据返回值进行处理  
                          
                document.getElementById("username").focus();//用户名输入控件获得焦点  
                             
                    document.getElementById("nametip").innerHTML="<font color='red'>"+"用户名已存在"+"</font>";   
                                //在div中提示用户该用户名已经存在  
  
             }else{  
                if(document.getElementById("username").value=="") //判断用户名是否为空  
                {  
                document.getElementById("nametip").innerHTML="<font color='red'>"+"用户名不能为空"+"</font>";  
                                 //在div中提示用户该用户名不能为空  
  
                document.getElementById("username").focus();//用户名输入控件获得焦点  
  
                }else{  
  
                         document.getElementById("nametip").innerHTML="<font color='blue'>"+"用户名可以使用"+"</font>";   
                                 //在div中提示用户该用户名可用  
                     }  
            }  
        });    
    });
    $("#pwd2").blur(function(){
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
		if(pwd1.length>0&&pwd2.length>0){
		    if(pwd1!=pwd2){
		    	document.getElementById("pwdtip").innerHTML="<font color='red'>"+"两次密码输入不一致"+"</font>"; 
		    }
		    else{
		    	document.getElementById("pwdtip").innerHTML=""; 
		    }
   		}
    });
    $("#pwd1").blur(function(){
		var pwd1=$("#pwd1").val();
		var pwd2=$("#pwd2").val();
		if(pwd1.length>0&&pwd2.length>0){
		    if(pwd1!=pwd2){
		    	document.getElementById("pwdtip").innerHTML="<font color='red'>"+"两次密码输入不一致"+"</font>"; 
		    }
		    else{
		    	document.getElementById("pwdtip").innerHTML=""; 
		    }
   		}
    });
    
    
});  
</script>
</body>
</html>
