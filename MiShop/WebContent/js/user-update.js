$(document).ready(function(){
    $(".c_m_i_update").click(function(){
       var realName=$(".c_m_i_l_f_realName").val().trim();
       var sex = $('input[name="sex"]:checked').val();
       var bir=$(".date").val().trim();
       if(realName==""){
    	   alert("用户名不能为空");
    	   return;
       }
       if(bir==""){
    	   alert("请输入生日");
    	   return;
       }
       $.ajax({
    	   url:"PersonalCenterCtrl?method=success",
    	   type:"post",
    	   data:{
    		   "realName":realName,
    		   "sex":sex,
    		   "bir":bir
    	   },
    	   success:function(res){
    		   alert(res);
    		   if(res=="true"){
    			   window.location.href="personalCenter.jsp";
    		   }else{
    			   alert("修改失败");
    		   }
    	   },
       		error:function(){
       			alert("网络连接错误");
       		}
    	   
       });
    });
});