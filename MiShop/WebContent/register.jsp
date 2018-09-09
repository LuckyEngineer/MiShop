<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>小米账号注册</title>
    <link rel="stylesheet" type="text/css" href="./css/register.css">
    <link rel="stylesheet" type="text/css" href="./fonts/register/iconfont.css">
    <style type="text/css">
    </style>
</head>
<body>
<div class="wrapper">
    <div class="wrap">
        <div class="layout">
            <div class="register-box">
                <div class="logo-area">
                    <div class="external-logo-area"><i class="milogo"></i></div>
                </div>
                <div class="title">
                    <h4>注册小米帐号</h4>
                </div>
                <div class="register-list">
                    <form action="RegisterCtrl" method="post">
                        <div class="regbox">
                            <!--用户名--->
                            <div class="username">
                                <div class="psw-img"><i class="iconfont icon-yonghu"></i></div><input type="text" required name="name" id="username" placeholder="请输入用户名" onBlur="checkUserName()" oninput="checkUserName()"/>
                            </div>
                            <p id="user-text"></p>
                            <!--这里插入密码设置-->
                            <div class="password">
                                <div class="psw-img"><i class="iconfont icon-mima "></i></div><input type="password" required name="psw" id="psw-text" placeholder="请输入密码" onBlur="checkPassword()" oninput="checkPassword()"/>
                            </div>
                            <p id="print_psw"></p>
                            <!--这里再次确定密码-->
                            <div class="p-t-text">
                                <div class="psw-img"><i class="iconfont icon-mima "></i></div><input type="password" required id="p-t-text" placeholder="请再次输入密码" onBlur="turePassword()" oninput="turePassword()"/>
                            </div>
                            <p id="print-t-text"></p>
                            <!---输入电话号码--->
                            <div class="phonenumber">
                                <select class="phonenumber-select">
                                    <option>+86</option>
                                    <option>+886</option>
                                    <option>+852</option>
                                </select>
                                <input type="text" name="tel" class="phonenumber-text-box" id="p-t-bID" required placeholder="请输入手机号码" onblur="checkPhone()" oninput="checkPhone()"/>
                            </div>
                            <p class="print" id="printID"></p>
                            <!--邮箱-->
                            <div class="email">
                            
                                <div class="psw-img"><i class="iconfont icon-youxiang "></i></div><input type="text" required name="email"  id="email" placeholder="请输入邮箱" onBlur="checkEmail()" oninput="checkEmail()"/>
                            </div>
                            <p id="email-text"></p>
                            <div class="getcode">
                                <input type="text" required id="code" placeholder="输入验证码" name="code"/>
                                <input type="button" id="get-code" value="获取邮箱验证码"></button>
                                <!-- 
                                <a type="button"  id="get-code"  href="SendEmailCtrl?email=">获取邮箱验证码</a>
                                 -->
                            </div>
                            <!--确定立刻注册-->
                            <input class="button" type="submit" value="立即注册" id="upload"/>
                        </div>
                    </form>
                    <div class="privary_box">
                        <div class="msg">
                            <i class="icon_select"></i>
                            <span>注册帐号即表示你同意并愿意遵守小米</span>
                            <a href="javascript:void(0)" title="用户协议">用户协议</a>
                            <span>和</span>
                            <a href="javascript:void(0)" title="隐私政策">隐私政策</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="footer">
    <div class="select">
        <ul class="list">
            <li><a class="simple" href="javascript:void(0)">简体</a></li>
            <li class="link"><span>|</span></li>
            <li><a href="javascript:void(0)">繁体</a></li>
            <li class="link"><span>|</span></li>
            <li><a href="javascript:void(0)">English</a></li>
            <li class="link"><span>|</span></li>
            <li><a href="javascript:void(0)">常见问题</a></li>
        </ul>
        <div class="introduce">
            <p class="nf-intro">
                <span>小米公司版权所有-京ICP备10046444-</span>
                <a class="beian-record-link" href="javascript:void(0)">
                    <img src="images/login/ghs.png">
                    <span>京公网安备11010802020134号</span>
                </a>
                <span>-京ICP正110507号</span>
            </p>
        </div>
    </div>
</div>
<script type="application/javascript" src="./js/jquery-3.3.1.min.js"></script>

<script type="text/javascript" src="./js/register.js"></script>
<script type="text/javascript">
	(function(){
		$("#get-code").click(function(){
			if($("#email").val() == ""){
				alert("邮箱不能为空");
				return false;
			}
			$.ajax({
				url: "SendEmailCtrl",
				type: "post",
				data:{
					email : $("#email").val()
				},
				success: function(res,status){
					if($.trim(res) == "success"){
						alert("发送成功");
					} else {
						alert("发送失败");
					}
				},
				error: function(){
					alert("检测失败");
				}
			});
		});
	})();
	function check(){
		if($("email").val() == ""){
			alert("邮箱不能为空！");
			return false;
		}
		if($("#username").val() == ""){
			alert("用户名不能为空！");
			return;
		}
		if($("#psw-text").val() == ""){
			alert("密码不能为空！");
			return;
		}
		if($("#p-t-text").val() == ""){
			alert("要确定密码！");
			return;
		}
		if($("#p-t-bID").val() == ""){
			alert("手机号不能为空！");
			return;
		}
		if($("#code").val() == ""){
			alert("要确定密码！");
			return;
		}
		return;
	}
	/* 登录的一些判断 */
	$("#got").click(function(){
		
	});
</script>
</body>
</html>