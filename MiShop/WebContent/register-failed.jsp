<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>注册失败</title>
<style type="text/css">
	*{
		font-size: 30px;
	}
	.face{
		font-size: 100px;
	}
</style>
<script language='javascript' type='text/javascript'>    
	var secs =15; //倒计时的秒数    
	var URL ;    
	function Load(url){    
		URL =url;    
		for(var i=secs;i>=0;i--){    
			window.setTimeout('doUpdate(' + i + ')', (secs-i) * 1000);    
		}    
	}    
	function doUpdate(num){    
		//document.getElementById('ShowDiv').innerHTML = '将在'+num+'秒后自动跳转到注册页面' ;  
		document.getElementById('ShowDiv').innerHTML =num;
		if(num == 0) { 
			window.location=URL; 
		}    
	}    
</script> 
</head>
<body>
	<span class="face">:(</span>
		对不起，
		<%= 
			request.getAttribute("errorinfo")
		%>
		,将在
    <span id="ShowDiv" style="color: red;">5</span>秒后自动跳转到注册页面    

<script language="javascript" type='text/javascript'>    
    Load("register.jsp"); //要跳转到的页面    
</script>
</body>
</html>