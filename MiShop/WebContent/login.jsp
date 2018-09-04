<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> - 登录</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <!-- <link rel="shortcut icon" href="favicon.ico">  -->
    <!-- 引入Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- 引入iconfont -->
    <link rel="stylesheet" type="text/css" href="font/login/iconfont.css">
    <!-- 引入animate -->
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/login.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->
    <script>if(window.top !== window.self){ window.top.location = window.location;}</script>
</head>
<body class="gray-bg">
	<%!
		// 定义全局变量
		String username;
		String password;
	%>
	<%
		// 1、获取Cookie数组
		Cookie[] cookies = request.getCookies();
		// 2、遍历Cookie
		for(Cookie c : cookies){
			if(c.getName().equals("username")){
				username = c.getValue();
			}
			if(c.getName().equals("password")){
				password = c.getValue();
			}
		}
	%>
    <div class="middle-box text-center loginscreen  animated fadeInDown">
        <div>
            <div>
                <h1 class="logo-name">
                    <i class="iconfont icon-xiaomi" style="font-size: 160px;color:#ff6700;"></i>
                </h1>
            </div>
            <h3>欢迎登录 小米后台</h3>
            <form class="m-t" role="form" action="" onsubmit="return false;">
                <div class="form-group">
                    <input type="text" name="username" value="<%= (username==null) ? "":username %>" id="uname" class="form-control" placeholder="用户名">
                </div>
                <div class="form-group">
                    <input type="password" name="password" value="<%= (password==null) ? "":password %>" id="pwd" class="form-control" placeholder="密码">
                </div>
                <div class="form-group remeber">
                    <input type="checkbox" name="cookie" value="cookie" id="remeber">记住密码
                </div>
                <input type="submit" onclick="isExist()" class="btn btn-primary block full-width m-b" style="background: #ff6700;border:1px solid #ff6700;" value="登录"/>
                <p class="text-muted text-center"> <a href="login.html#"><small>忘记密码了？</small></a> | <a href="register.html">注册一个新账号</a>
                </p>
           	</form>
        </div>
    </div>
    <!-- 全局js -->
    <script src="js/jquery-3.3.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script type="text/javascript">
    	/*
    		使用jQuery实现Ajax
    	*/
    	function isExist(){
    		var $username = $("#uname").val();
    		var $password = $("#pwd").val();
            // 判断记住密码的复选框是否被选中
            var $remeber = $("#remeber").is(":checked") + "";
    		// 判断输入的用户名是否为空
    		if($username == "" || $username == null){
    			alert("用户名不能为空！");
    			return;
    		}
    		if($password == "" || $password == null){
    			alert("密码不能为空！");
    			return;
    		}
    		$.ajax({
    			url:"LoginCtrl",
    			type:"post",
    			data:{
    				username:$username,
    				password:$password,
                    remeber:$remeber
    			},
    			// data:"username=" + $username,
    			success:function(result,textStatus){
    				if($.trim(result) == "invalid user"){
    					alert("账号不存在");
    				} else if($.trim(result) == "invalid password") {
    					alert("密码错误");
    				} else {
    					window.location.href = "./index.jsp";
    				}
    			},
    			error:function(){
    				alert("检测失败");
    			}
    		});
    	}
    </script>
</body>
</html>
