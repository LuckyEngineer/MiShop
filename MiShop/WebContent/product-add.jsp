<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--_meta 作为公共模版分离出去-->
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<!--[if lt IE 9]>
<script type="text/javascript" src="lib/html5shiv.js"></script>
<script type="text/javascript" src="lib/respond.min.js"></script>

<![endif]-->
<link rel="stylesheet" type="text/css" href="static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="lib/Hui-iconfont/1.0.8/iconfont.css" />

<link rel="stylesheet" type="text/css" href="static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="static/h-ui.admin/css/style.css" />
<!--[if IE 6]>
<script type="text/javascript" src="lib/DD_belatedPNG_0.0.8a-min.js" ></script>
<script>DD_belatedPNG.fix('*');</script>
<![endif]-->
<!--/meta 作为公共模版分离出去-->

<link href="lib/webuploader/0.1.5/webuploader.css" rel="stylesheet" type="text/css" />
<!-- 引入阿里巴巴字体图标库 -->
<link rel="stylesheet" type="text/css" href="./font/product-add/iconfont.css">
<style type="text/css">
	#main-product{
		width: 200px;
		height: 200px;
	}
	.sub-product-add{
		margin-top:20px;
		width: 120px;
		height: 120px;
		border: 1px solid rgba(0,0,0,.2);
		text-align: center;
		line-height: 120px;
		color: rgba(0,0,0,.2);
		cursor: pointer;
	}
	.sub-product-pic{
		margin-right: 20px;
		margin-top: 20px;
		width: 120px;
		height: 120px;

	}
	.sub-product-pic img{

		width: 120px;
		height: 120px;
	}
	.f{
		float: left;
	}
</style>
</head>
<body>
<div class="page-container">
	<form action="ProductCtrl" method="post" class="form form-horizontal" id="form-article-add" enctype="multipart/form-data">
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品名称：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="请输入产品名称" id="" name="pname" required="required">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2"><span class="c-red">*</span>产品类别：</label>
			<div class="formControls col-xs-8 col-sm-9"> 
				<span class="select-box">
					<select name="category" class="select">
						<option value="1" >手机</option>
						<option value="2">笔记本</option>
						<option value="3">智能家具</option>
						<option value="4">路由</option>
					</select>
				</span> 
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品描述：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" class="input-text" value="" placeholder="" id="" name="description" required="required">
			</div>
		</div>
		
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">版本配置：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="config" id="" placeholder="" value="" class="input-text" required="required">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">颜色：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="text" name="color" id="" placeholder="多种颜色用英文逗号隔开" value="" class="input-text" required="required">
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">价格：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="number" name="price" id="" placeholder="" value="" class="input-text" style="width:90%" required="required">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">折扣金额：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="number" name="discount" id="" placeholder="" value="" class="input-text" style="width:90%" required="required">
				元</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">库存：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<input type="number" name="stock" id="" placeholder="" value="" class="input-text" style="width:90%" required="required">
				个</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">摘要：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<textarea name="detail" cols="" rows="" class="textarea"  placeholder="请输入商品摘要..." datatype="*10-100" dragonfly="true" nullmsg="备注不能为空！" required="required"></textarea>
				<p class="textarea-numberbar"><em class="textarea-length">0</em>/200</p>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品主图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="uploader-thum-container">
					<img src="${pageContext.request.contextPath}/images/default.PNG" id="main-product">
					<input type="file" name="main_image" id="main-image" required="required"/>
				</div>
			</div>
		</div>
		<div class="row cl">
			<label class="form-label col-xs-4 col-sm-2">产品子图：</label>
			<div class="formControls col-xs-8 col-sm-9">
				<div class="sub-product-box">
					<!-- <div class="sub-product-pic f">
						<img src="./images/default.jpg"/>
					</div> -->
					<div class="sub-product-add f">
						<i class="iconfont icon-tubiaolunkuo-" style="font-size: 80px;"></i>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row cl">
			<div class="col-xs-8 col-sm-9 col-xs-offset-4 col-sm-offset-2">
				<button class="btn btn-primary radius" type="submit">发布该商品</button>
				<!-- <button onClick="article_save_submit();" class="btn btn-primary radius" type="submit"><i class="Hui-iconfont">&#xe632;</i> 保存并提交审核</button>
				<button onClick="article_save();" class="btn btn-secondary radius" type="button"><i class="Hui-iconfont">&#xe632;</i> 保存草稿</button> -->
				<button onClick="layer_close();" class="btn btn-success radius" type="reset">&nbsp;&nbsp;取消&nbsp;&nbsp;</button>
			</div>
		</div>
	</form>
</div>

<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript">
	// 定义全局变量i
	var i = 0;
	function localView(from) {
	    var file = from.files[0]
	    var url = null ;
	    if (window.createObjectURL!=undefined) { 
	        url = window.createObjectURL(file) ;
	    } else if (window.URL!=undefined) {
	        url = window.URL.createObjectURL(file) ;
	    } else if (window.webkitURL!=undefined) { 
	        url = window.webkitURL.createObjectURL(file) ;
	    }
	    return url
	}
	// 实现本地预览的功能
	$(document).on("change","#main-image",function(){
		var src = localView(this);
		$("#main-product").attr("src",src);
	})

	// 鼠标点击
	$(".sub-product-add").on('click',function(){
		i++
		if(i==9){
			$(".sub-product-add").hide()
		}
		$(".sub-product-box").append('<input type="file" class="f" id="image'+i+'" style="display:none;" name="sub_image">')
		$('#image'+i).click()
	})
	// 
	$(document).on("change",".f",function(){
		//sub-product-pic f
		$(".sub-product-box").prepend('<img class="sub-product-pic f" src="" id='+i+'>')
		var src = localView(this)
		$("#"+i).attr("src",src)
	})
</script>
</body>
</html>