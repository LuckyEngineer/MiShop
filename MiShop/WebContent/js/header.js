$(function(){
    // header
    (function () {
        // 购物车
        var $shop = $(".topnav .t_wrapper .t_w_right .t_w_r_shop");
        var $s_hide = $(".topnav .t_wrapper .t_w_right .t_w_r_shop .t_w_r_s_hide");
        // 搜索框
        var $search = $(".nav .n_wrapper .n_w_search");
        var $input = $(".nav .n_wrapper .n_w_s_input input");
        var $search_hide = $(".nav .n_wrapper .n_w_s_input .n_w_s_hide");
        var $hotwords = $(".nav .n_wrapper .n_w_s_hotwords");
        // 购物车鼠标移进事件
        $shop.hover(function(){
            $s_hide.stop(true).slideDown();
        },function(){
            $s_hide.stop(true).slideUp();
        });
        // search input获取焦点
        $input.focus(function(){
            $search.addClass("focus");
            $search_hide.fadeIn();
            $hotwords.fadeOut();
        }).blur(function(){
            $search.removeClass("focus");
            $hotwords.fadeIn();
            $search_hide.fadeOut();
        });
        // 鼠标滑动到主导航上，将n_product展示出来
        var $label = $(".nav .n_wrapper .n_w_main .n_w_m_label");
        var $product = $(".nav .n_product");
//         var $p_ul = $(".n_product .n_p_main ul");
        $label.hover(function(){
            var ul_index = $(this).index();
            $product.stop(true).slideDown(300);
            // 显示需要显示的那一栏，把同级的其他ul隐藏
            $(".n_product .n_p_main ul").eq(ul_index).show().siblings().hide();
        },function(){
            $product.stop(true).slideUp(300);
        });
        $product.hover(function(){
            $(this).stop(true).slideDown(300);
        },function(){
            $(this).stop(true).slideUp(300);
        });
        // 点击导航栏的Select Region,显示模态框
        var $selbtn = $(".topnav .t_wrapper .t_w_left .t_w_l_selregion");
        var $selmodal = $("#selregion");
        var $selmodalbox = $("#selregion .s_box");
        var $selclose = $("#selregion .s_box .s_b_header .s_b_h_close");
        $selbtn.click(function(){
            $selmodal.stop(true).show();
            $selmodalbox.stop(true).slideDown(300);
        });
        $selclose.click(function(){
            $selmodalbox.stop(true).slideUp(300);
            setTimeout(function(){
                $selmodal.stop(true).hide();
            },300);
        });
        $selmodal.click(function(e){
            var flag = $(e.target).is(".s_box,.s_box *");
            if(!flag){
                $selmodalbox.stop(true).slideUp(300);
                setTimeout(function(){
                    $selmodal.stop(true).hide();
                },300);
            }
        });
    })();
});
(function(){
	$.ajax({
    	url:"queryCtrl?method=queryProduct",
    	type:"post",
    	scriptCharset: "charset=utf-8",
    	success:function(result,status){
    		var data=JSON.parse(result);
    		for(var i=0;i<data.length;i++){
    				var categoryId=data[i].categoryId;
    				var value=".ul"+categoryId;
    				if($(value).length==0){
    					var index=0;
        				//建立ul标签
        				var str="<ul class='ul"+data[i].categoryId+"'></ul>";
    					$("#pro").append(str);
    					var parent=".ul"+data[i].categoryId;
    					//建立li标签
    					inner:for(var j=0;j<data.length;j++){
    						if(data[j].categoryId==categoryId){
    							var str1="<li>" +
    							"<span class='p_label'></span>" +
    							"<a href='javascript:void(0)'><img src='"+data[j].mainImage+"'></a>" +
    							"<a href='javascript:void(0)' class='p_title'>"+data[j].productName+"</a>" +
    							"<p class='p_price'>"+data[j].price+"</p>" +
    							"<div class='p_border'></div>" +
    							"</li>";
    							$(parent).append(str1);
    							index++;
    							if(index>=6){
    								break inner;
    							}
    						}
    					}
    					if(categoryId>=	8){
    						break;
    					}
    				}
    			}
    		}
    });
})();