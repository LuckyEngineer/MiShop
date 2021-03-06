<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>添加商品</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
  <link rel="stylesheet" href="./css/font.css">
  <link rel="stylesheet" href="./css/xadmin.css">
  <link rel="stylesheet" type="text/css" href="lib/layui/css/layui.css" />
  <!-- 引入阿里巴巴字体图标库 -->
  <link rel="stylesheet" type="text/css" href="./fonts/product-add/iconfont.css">
</head>
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
<body>
	<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a href="">商品管理</a>
        <a>
          <cite>添加商品</cite></a>
      </span>
      <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i>
      </a>
    </div>
              
	<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  		<legend>添加商品</legend>
	</fieldset>
 
	<form class="layui-form" action="ProductCtrl" method="post" enctype="multipart/form-data">
  		<div class="layui-form-item">
    		<label class="layui-form-label">商品名称</label>
	    	<div class="layui-input-block">
	      		<input type="text" name="pname" lay-verify="pname" autocomplete="off" placeholder="请输入商品名称" class="layui-input">
	    	</div>
  		</div>
  

		  <div class="layui-form-item">
		    <label class="layui-form-label">商品类别</label>
		    <div class="layui-input-block">
		      <select name="category" lay-filter="aihao" lay-verify="required">
		        <option value="">请选择类别</option>
		        <c:set var="itemlist" value="${requestScope.cates}"></c:set>
		        <c:if test="${cates !=null && fn:length(cates) != 0}">
		        <c:forEach var="item" items="${cates}">
		        	<option value="${item.categoryId }">${item.name }</option>
		        </c:forEach>
		        <!-- 
		        <option value="1">手机</option>
		        <option value="2">笔记本</option>
		        <option value="3">智能</option>
		        <option value="4">路由</option>
		         -->
		        </c:if>
		      </select>
		    </div>
		  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">商品描述</label>
    <div class="layui-input-block">
      <input type="text" name="description" lay-verify="required" placeholder="请输入" autocomplete="off" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">版本配置</label>
    <div class="layui-input-block">
      <input type="text" name="config" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <label class="layui-form-label">颜色</label>
    <div class="layui-input-block">
      <input type="text" name="color" lay-verify="required" placeholder="多种颜色用下划线‘/’隔开" autocomplete="off" class="layui-input">
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">原价</label>
      <div class="layui-input-inline" style="width: 200px;">
        <input type="number" name="price" lay-verify="required" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
      <label class="layui-form-label">折扣金额</label>
      <div class="layui-input-inline" style="width: 200px;">
        <input type="number" name="discount" lay-verify="required" placeholder="￥" autocomplete="off" class="layui-input">
      </div>
      <label class="layui-form-label">库存</label>
      <div class="layui-input-inline" style="width: 200px;">
        <input type="number" name="stock" lay-verify="required" placeholder="" autocomplete="off" class="layui-input">
      </div>
    </div>
  </div>
  
  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">摘要</label>
    <div class="layui-input-block">
      <textarea placeholder="请输入内容" name="detail" lay-verify="required" class="layui-textarea"></textarea>
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">产品主图</label>
    <div class="layui-input-block">
      <img src="./images/default.PNG" id="main-product">
	  <input type="file" name="main_image" id="main-image" required="required"/>
    </div>
  </div>

  <div class="layui-form-item layui-form-text">
    <label class="layui-form-label">产品子图</label>
    <div class="layui-input-block">
      <div class="sub-product-box">
		<div class="sub-product-add f">
			<i class="iconfont icon-tubiaolunkuo-" style="font-size: 80px;"></i>
		</div>
	  </div>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" lay-submit="ProductCtrl" lay-filter="demo1">立即提交</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
<script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
<script type="text/javascript" src="./js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="./js/xadmin.js"></script>
<script>
	//定义全局变量i
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
		$(".sub-product-box").append('<input type="file" class="f" id="image'+i+'" style="display:none;" name="image[]">')
		$('#image'+i).click()
	})
	// 当选择图片后，添加一个图片标签，用于本地预览
	$(document).on("change",".f",function(){
		//sub-product-pic f
		$(".sub-product-box").prepend('<img class="sub-product-pic f" src="" id='+i+'>')
		var src = localView(this)
		$("#"+i).attr("src",src)
	});
	
	
	layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;
	  
	  //日期
	  laydate.render({
	    elem: '#date'
	  });
	  laydate.render({
	    elem: '#date1'
	  });
	  
	  //创建一个编辑器
	  var editIndex = layedit.build('LAY_demo_editor');
	 
	  //自定义验证规则
	  form.verify({
	    pname: function(value){
	      if(value.length < 1){
	        return '商品名称不能为空';
	      }
	    }
	    // ,pass: [/(.+){6,12}$/, '密码必须6到12位']
	    ,content: function(value){
	      layedit.sync(editIndex);
	    }
	  });
	  
	  //监听指定开关
	  form.on('switch(switchTest)', function(data){
	    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
	      offset: '6px'
	    });
	    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
	  });
	  
	  //监听提交
	  /*
	  form.on('submit(demo1)', function(data){
	    layer.alert(JSON.stringify(data.field), {
	      title: '最终的提交信息'
	    })
	    return false;
	  });
	  */
	 
	  //表单初始赋值
	  form.val('example', {
	    "username": "贤心" // "name": "value"
	    ,"password": "123456"
	    ,"interest": 1
	    ,"like[write]": true //复选框选中状态
	    ,"close": true //开关状态
	    ,"sex": "女"
	    ,"desc": "我爱 layui"
	  })
	  
	});
</script>

</body>
</html>