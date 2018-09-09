$(function(){
    // 轮播图一
    (function(){
        var swiper = new Swiper('.d_view', {
            slidesPerView: 1,
            spaceBetween: 30,
            loop: true,
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    })();
    var color=null;
    //点击颜色，将颜色赋到li标签中
    $(".text").click(function(){
    	$(this).parent().children().css("border",".6px solid #e0e0e0");
        $(this).css("border",".6px solid #ff6700");
        color=$(this).html();
        $(".d_p_a_u_d_color").innerHTML="";
        $(".d_p_a_u_d_color").html(color);
        $(".d_p_a_u_d_color").find("a").css("color","#000");
    });
    
    $(".d_p_btn").click(function(){
    	var userId=$(this).attr("data-fruit");
    	
    	if(color==null){
    		alert("请选择颜色");
    		return;
    	}
    	if(userId==""){
    		alert("请先登录");
    		window.location.href="login.jsp";
    		return;
    	}
    	alert("hahah");
    	var productId=$(".d_p_title").data("id");
    	var defalutQuantity=1;
    	$.ajax({
    		url:"CartCtrl?method=addCart",
    		type:"post",
    		data:"userId="+userId+"&color="+color+"&productId="+productId+"&defalutQuantity="+defalutQuantity,
    		success:function(result){
    			if(result){
    				window.location.href="CartCtrl?method=success&productId="+productId+"";
    			}else{
    				alert("提交购物车失败");
    				return;
    			}
    		}
    	});
    });
});