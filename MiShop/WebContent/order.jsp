<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link href="css/order.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="./fonts/footer/iconfont.css">
    <!-- footer.css -->
    <link rel="stylesheet" type="text/css" href="css/footer.css">
</head>
<body>
<div class="address-box">
    <div class="add-oneAddress">
        <div class="add-title">
            <span class="t-text">添加收货地址</span>
            <div  class="clear"><a href="javascript:void(0)"><span>&times;</span></a></div>
        </div>
        <form>
            <!--//姓名-->
            <input class="user-name" type="text" placeholder="姓名">
            <!--//手机号-->
            <input class="user-mobile" type="text" placeholder="手机号">
            <!-- //地址-->
            <input class="input" name="" id="city" type="text" placeholder="请选择" autocomplete="off" readonly="true"><s></s>
            <input class="user-address" type="text" placeholder="具体地址">
            <input class="ESM-number" type="text" placeholder="邮政编码">
            <input class="address-point" type="text" placeholder="地址标签">
        </form>
        <div class="choose-box">
            <input type="button" class="got" value="保存">
            <input type="button" class="update" value="修改">
            <input type="button" class="cancel" value="取消">
        </div>
    </div>
</div>

<div class="header">
    <!-- top -->
    <div class="top">
        <div class="top_logo">
            <a href="index.html"></a>
        </div>
        <div class="top_title">
            <h2>我的订单</h2>
        </div>
        <div class="top_nav">
                <span class="t_n_user">
                    <a  class="t_n_u_id" href="javascript:void(0)">
                        <span>949709918</span>
                        <i class="iconfont icon-xiajiantou"></i>
                    </a>
                    <ul class="t_n_u_menu">
                        <li><a href="javascript:void(0)">个人中心</a></li>
                        <li><a href="javascript:void(0)">评价晒单</a></li>
                        <li><a href="javascript:void(0)">我的喜欢</a></li>
                        <li><a href="javascript:void(0)">小米账户</a></li>
                        <li><a href="javascript:void(0)">退出登录</a></li>
                    </ul>
                </span>
            <span class="t_n_border">|</span>
            <a class="t_n_order">我的订单</a>
        </div>
    </div>
    <!--End top-->
</div>
<!--End header-->

<!--container-->
<div class="container">
    <!--content-->
    <div class="content">
        <!--收货地址、收货地址、收货地址-->
        <div class="all-address">
            <div class="a-title"><span>收货地址</span></div>
            <ul class="a-content">
                <li class="one-address info1">
                    <div class="add-address"><a href="javaScript:void(0)"><span>+</span></a></div>
                    <h4 class="user"></h4>
                    <p class="mobile"></p>
                    <p class="city"></p>
                    <p class="small_city"></p>
                    <div class="query-address">
                        <a href="javaScript:void(0)" class="d-query">修改</a>
                    </div>
                </li>
            </ul>
        </div>
        <div style="clear:both;height: 15px"></div>
        <div class="describe">
            <p class="d_list">商品清单</p>
            <a href="cart.html" class="d_return">返回购物车></a>
        </div>
        <div class="content_centre1">
            <span class="content_centre1_msg2">商品描述</span>
            <span class="content_centre1_msg3">单价</span>
            <span class="content_centre1_msg4">数量</span>
            <span class="content_centre1_msg5">小计</span>
        </div>
        <c:set var="itemlist" value="${sessionScope.itemlist}"></c:set>
		<c:if test="${itemlist !=null && fn:length(itemlist) != 0}">
			<ul class="content_centre">
				<c:forEach var="item" items="${itemlist}">
					<!--商品信息-->
					<li class="content_centre2" product-id="${item.productId}">
						<img class="content_centre2_msg2" src="<%=request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort() %>${item.productImage}">
						<p class="c_name" product-id="${item.productId}">${item.productName}&nbsp;${item.config}&nbsp;${item.color}</p>
						<!-- 商品单价 -->
						<p class="c_money">
							<span class="c_money_price">${ item.unitPrice }</span>
							<span class="content_price">元</span>
						</p>
						<!-- 商品数量 -->
						<p class="c_number">${ item.quantity }</p>
						<!-- 小计 -->
						<p class="c_count">
							<span class="c_count_totalPrice">${ item.totalPrice }</span>
							<span class="content_subtotal">元</span>
						</p>
					</li>
				</c:forEach>
			</ul>
			
	        
	        <!--计算总价-->
	        <div class="calculate-money">
	            <div class="c_text">
	                <p class="c_m_t_info"></p>
	                <p class="c_m_t_address"></p>
	            </div>
	            <div class="c_right">
	                <p>总价是：<span class="c_r_price">300元</span></p>
	                <a href="javascript:void(0)" class="c_r_make">立即下单</a>
	            </div>
	        </div>
		</c:if>
		
    </div>
</div>
<!--地址的添加框-->

<!--End container-->
<!-- Footer -->
<div class="footer">
    <div class="f_service">
        <ul>
            <li><a href="javascript:void(0)"><i class="iconfont icon-weixiubanshou"></i>预约维修服务</a></li>
            <li><a href="javascript:void(0)"><i class="iconfont icon-7tianwuliyoutuihuo"></i>7天无理由退货</a></li>
            <li><a href="javascript:void(0)"><i class="iconfont icon-15tianwuliyoutuihuo"></i>15天免费换货</a></li>
            <li><a href="javascript:void(0)"><i class="iconfont icon-liwuhuodong"></i>满150元包邮</a></li>
            <li style="border-right:none;"><a href="javascript:void(0)"><i class="iconfont icon-dingwei"></i>520余家售后网点</a></li>
        </ul>
    </div>
    <div class="f_info">
        <div class="f_i_left">
            <dl>
                <dt>帮助中心</dt>
                <dd><a href="javascript:void(0)">账户管理</a></dd>
                <dd><a href="javascript:void(0)">购物指南</a></dd>
                <dd><a href="javascript:void(0)">订单操作</a></dd>
            </dl>
            <dl>
                <dt>服务支持</dt>
                <dd><a href="javascript:void(0)">售后政策</a></dd>
                <dd><a href="javascript:void(0)">自助服务</a></dd>
                <dd><a href="javascript:void(0)">相关下载</a></dd>
            </dl>
            <dl>
                <dt>线下门店</dt>
                <dd><a href="javascript:void(0)">小米之家</a></dd>
                <dd><a href="javascript:void(0)">服务网点</a></dd>
                <dd><a href="javascript:void(0)">零售网点</a></dd>
            </dl>
            <dl>
                <dt>关于小米</dt>
                <dd><a href="javascript:void(0)">了解小米</a></dd>
                <dd><a href="javascript:void(0)">加入小米</a></dd>
                <dd><a href="javascript:void(0)">联系我们</a></dd>
            </dl>
            <dl>
                <dt>关注我们</dt>
                <dd><a href="javascript:void(0)">新浪微博</a></dd>
                <dd><a href="javascript:void(0)">小米部落</a></dd>
                <dd><a href="javascript:void(0)">官方微信</a></dd>
            </dl>
            <dl>
                <dt>特色服务</dt>
                <dd><a href="javascript:void(0)">F 码通道</a></dd>
                <dd><a href="javascript:void(0)">礼物码</a></dd>
                <dd><a href="javascript:void(0)">防伪查询</a></dd>
            </dl>
        </div>
        <div class="f_i_right">
            <p class="p1">400-100-5678</p>
            <p class="p2">周一至周日 8:00-18:00 </p>
            <p class="p3">（仅收市话费）</p>
            <a href="javascript:void(0)"><i class="iconfont icon-pinglun"></i> 在线客服</a>
        </div>
    </div>
    <div class="f_link">
        <div class="f_l_info">
            <div class="f_l_i_left">
                <img src="images/index/logo/logo_footer.png" width="57" height="57">
                <ul>
                    <li><a href="javascript:void(0)">小米商城</a>|</li>
                    <li><a href="javascript:void(0)">MIUI</a>|</li>
                    <li><a href="javascript:void(0)">米家</a>|</li>
                    <li><a href="javascript:void(0)">米聊</a>|</li>
                    <li><a href="javascript:void(0)">多看</a>|</li>
                    <li><a href="javascript:void(0)">路由器</a>|</li>
                    <li><a href="javascript:void(0)">米粉卡</a>|</li>
                    <li><a href="javascript:void(0)">小米天猫店</a>|</li>
                    <li><a href="javascript:void(0)">隐私政策</a>|</li>
                    <li><a href="javascript:void(0)">问题反馈</a>|</li>
                    <li><a href="javascript:void(0)">Select Region</a></li>
                </ul>
            <span>©mi.com 京ICP证110507号 京ICP备10046444号 京公网安备11010802020134号 京网文[2014]0059-0009号
违法和不良信息举报电话：185-0130-1238，本网站所列数据，除特殊说明，所有数据均出自我司实验室测试</span>
            </div>
            <div class="f_l_i_right">
                <a href="javascript:void(0)"><img src="images/index/footer/1.png"></a>
                <a href="javascript:void(0)"><img src="images/index/footer/2.png"></a>
                <a href="javascript:void(0)"><img src="images/index/footer/3.png"></a>
                <a href="javascript:void(0)"><img src="images/index/footer/4.png"></a>
                <a href="javascript:void(0)"><img src="images/index/footer/5.png"></a>
            </div>
        </div>
        <div class="f_l_bottom"></div>
    </div>
</div>
<!-- End Footer -->
<!-- 引入jQuery -->
<!-- footer:iconfont -->

<!-- js -->

<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="js/Popt.js"></script>
<script type="text/javascript" src="js/city.json.js"></script>
<script type="text/javascript" src="js/citySet.js"></script>
<script type="text/javascript" src="js/order.js"></script>

</body>
</html>