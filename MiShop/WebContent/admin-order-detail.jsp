<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>订单详情</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="./lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="./js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
      <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
      <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <div class="x-body">
        <form class="layui-form">
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>订单编号
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${ requestScope.detail.orderNo }" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="phone" class="layui-form-label">
                  <span class="x-red">*</span>收件人
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${ requestScope.detail.receiver }" id="phone" name="phone" required="" lay-verify="phone"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>联系方式：
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${ requestScope.detail.tel }" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled" value="17875511815">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>收货地址
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="${ requestScope.detail.addr }" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          <div class="layui-form-item">
              <label for="username" class="layui-form-label">
                  <span class="x-red">*</span>订单状态：
              </label>
              <div class="layui-input-inline">
                  <input type="text" value="待发货" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
          </div>
          
          <div class="layui-form-item">
          
              <label for="L_email" class="layui-form-label">
                  <span class="x-red">*</span>订单金额：
              </label>
              
              <div class="layui-input-inline">
                  <input type="text" value="${ requestScope.detail.payment }" id="username" name="username" required="" lay-verify="required"
                  autocomplete="off" class="layui-input" disabled="disabled">
              </div>
              
          </div>
          <div class="layui-form-item layui-form-text">
              <label for="desc" class="layui-form-label">
                  	商品清单
              </label>
              <div class="layui-input-block">
                  <table class="layui-table">
				    <colgroup>
				      <col width="150">
				      <col width="200">
				      <col width="150">
				      <col width="150">
				      <col>
				    </colgroup>
				    <thead>
				      <tr>
				        <th>图片</th>
				        <th>详情</th>
				        <th>单价</th>
				        <th>数量</th>
				        <th>小计</th>
				      </tr> 
				    </thead>
				    <tbody>
				      <c:set var="itemlist" value="${ requestScope.items }"></c:set>
				      <c:if test="${ items != null && fn:length(items) != 0 }">
				      	<c:forEach var="item" items="${items}">
					      	<tr>
						        <td><img src="${item.productImage}" style="width:100px;height:100px;"></td>
						        <td>${item.productName}&nbsp;${item.config}&nbsp;${item.color}</td>
						        <td>${item.unitPrice}</td>
						        <td>${item.quantity}</td>
						        <td>${item.totalPrice}</td>
						    </tr>
						</c:forEach>
				      </c:if>
				      
				    </tbody>
				  </table>
              </div>
          </div>
      </form>
    </div>
    <script>
        layui.use(['form','layer'], function(){
            $ = layui.jquery;
          var form = layui.form
          ,layer = layui.layer;
        
          //自定义验证规则
          form.verify({
            nikename: function(value){
              if(value.length < 5){
                return '昵称至少得5个字符啊';
              }
            }
            ,pass: [/(.+){6,12}$/, '密码必须6到12位']
            ,repass: function(value){
                if($('#L_pass').val()!=$('#L_repass').val()){
                    return '两次密码不一致';
                }
            }
          });

          //监听提交
          form.on('submit(add)', function(data){
            console.log(data);
            //发异步，把数据提交给php
            layer.alert("增加成功", {icon: 6},function () {
                // 获得frame索引
                var index = parent.layer.getFrameIndex(window.name);
                //关闭当前frame
                parent.layer.close(index);
            });
            return false;
          });
          
        });
    </script>
    <script>var _hmt = _hmt || []; (function() {
        var hm = document.createElement("script");
        hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
      })();</script>
  </body>

</html>