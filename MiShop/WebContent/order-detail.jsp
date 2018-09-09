<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <!-- 引入swiper插件css -->
    <link rel="stylesheet" type="text/css" href="library/swiper/swiper-4.2.0.min.css">
    <!-- header:iconfont -->
    <link rel="stylesheet" type="text/css" href="fonts/header/iconfont.css">
    <!-- header.css -->
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <!-- product:iconfont -->
    <link rel="stylesheet" type="text/css" href="fonts/product/iconfont.css">
    <!-- product.css -->
    <link rel="stylesheet" type="text/css" href="css/product.css">
    <!-- footer:iconfont -->
    <link rel="stylesheet" type="text/css" href="fonts/footer/iconfont.css">
    <!-- footer.css -->
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <link rel="stylesheet" type="text/css" href="css/order-detail.css">
</head>
<body>
<!-- Header -->
<div class="header">
    <!-- Topnav 顶部导航栏 -->
    <div class="topnav">
        <div class="t_wrapper">
            <div class="t_w_left">
                <ul>
                    <li><a href="index.html">小米商城</a><span>|</span></li>
                    <li><a href="javascript:void(0)">MIUI</a><span>|</span></li>
                    <li><a href="javascript:void(0)">IoT</a><span>|</span></li>
                    <li><a href="javascript:void(0)">云服务</a><span>|</span></li>
                    <li><a href="javascript:void(0)">水滴</a><span>|</span></li>
                    <li><a href="javascript:void(0)">金融</a><span>|</span></li>
                    <li><a href="javascript:void(0)">有品</a><span>|</span></li>
                    <li><a href="javascript:void(0)" class="t_w_l_selregion">选择地区</a></li>
                </ul>
            </div>
            <div class="t_w_right">
                <div class="t_w_r_shop">
                    <i class="iconfont icon-gouwuchekong"></i>
                    <a href="cart.html" class="car">购物车（<span>0</span>）</a>
                    <div class="t_w_r_s_hide">
                        	购物车中还没有商品，赶紧选购吧！
                    </div>
                </div>
                <div class="t_w_r_login">
                    <a href="login.html">登录</a><span>|</span>
                    <a href="register.html">注册</a><span>|</span>
                    <a href="javascript:void(0)">消息通知</a>
                </div>
            </div>
        </div>
    </div>
    <!-- End Topnav -->
    <!-- Nav 主导航 -->
    <div class="nav">
        <div class="n_wrapper">
            <div class="n_w_logo" title="小米官网">
                <a href="index.html"></a>
            </div>
            <div class="n_w_holiday" >
                <a href="javascript:void(0)"></a>
            </div>
            <div class="n_w_main">
                <ul>
                    <li class="n_w_m_label n1"><a href="javascript:void(0)">小米手机</a></li>
                    <li class="n_w_m_label n2"><a href="javascript:void(0)">红米</a></li>
                    <li class="n_w_m_label n3"><a href="javascript:void(0)">电视</a></li>
                    <li class="n_w_m_label n4"><a href="javascript:void(0)">笔记本</a></li>
                    <li class="n_w_m_label n5"><a href="javascript:void(0)">盒子</a></li>
                    <li class="n_w_m_label n6"><a href="javascript:void(0)">新品</a></li>
                    <li class="n_w_m_label n7"><a href="javascript:void(0)">路由器</a></li>
                    <li class="n_w_m_label n8"><a href="javascript:void(0)">智能硬件</a></li>
                    <li><a href="javascript:void(0)">服务</a></li>
                    <li><a href="javascript:void(0)">社区</a></li>
                </ul>
            </div>
            <div class="n_w_search">
                <form class="n_w_s_input">
                    <input type="search" name="key">
                    <div class="n_w_s_hide">
                        <ul>
                            <li><a href="javascript:void(0)">小米手机6<span>约有29件</span></a></li>
                            <li><a href="javascript:void(0)">小米手机5X<span>约有8件</span></a></li>
                            <li><a href="javascript:void(0)">红米note&nbsp;4X<span>约有14件</span></a></li>
                            <li><a href="javascript:void(0)">红米手机4X<span>约有9件</span></a></li>
                            <li><a href="javascript:void(0)">红米Max&nbsp;2<span>约有5件</span></a></li>
                            <li><a href="javascript:void(0)">小米电视4C<span>约有2件</span></a></li>
                            <li><a href="javascript:void(0)">电视32英寸<span>约有1件</span></a></li>
                            <li><a href="javascript:void(0)">笔记本pro<span>约有3件</span></a></li>
                            <li><a href="javascript:void(0)">空气净化器<span>约有17件</span></a></li>
                            <li><a href="javascript:void(0)">净水器<span>约有9件</span></a></li>
                        </ul>
                    </div>
                    <div class="n_w_s_find">
                        <i class="iconfont icon-sousuo5"></i>
                    </div>
                    <div class="n_w_s_hotwords">
                        <a href="javascript:void(0)">小米Note 5</a>
                        <a href="javascript:void(0)">小米MIX 2</a>
                    </div>
                </form>
            </div>
        </div>
        <div class="n_product">
            <div id="pro" class="n_p_main"></div>
        </div>
    </div>
    <!-- End Nav -->
    <!-- Selregion Modal 地区选择模态框 -->
    <div id="selregion" class="selregion" >
        <div class="s_box">
            <div class="s_b_header">
                <span class="s_b_h_title">选择地区</span>
                <a class="s_b_h_close" href="javascript:void(0)"><i class="iconfont icon-close"></i></a>
            </div>
            <div class="s_b_body">
                <h1>欢迎来到小米官网</h1>
                <p>请选择您的国家或地区</p>
                <p class="s_b_b_region">
                    <a href="javascript:void(0)">中国大陆</a>
                    <a href="javascript:void(0)">香 港</a>
                    <a href="javascript:void(0)">台 湾</a>
                    <a href="javascript:void(0)">新加坡</a>
                    <a href="javascript:void(0)">马来西亚</a>
                    <a href="javascript:void(0)">菲律宾</a>
                    <a href="javascript:void(0)">印 度</a>
                    <a href="javascript:void(0)">印 尼</a>
                    <a href="javascript:void(0)">全球家庭</a>
                    <a href="javascript:void(0)">中东和北非</a>
                    <a href="javascript:void(0)">波 兰</a>
                    <a href="javascript:void(0)">乌克兰</a>
                    <a href="javascript:void(0)">俄罗斯</a>
                    <a href="javascript:void(0)">越 南</a>
                    <a href="javascript:void(0)">墨西哥</a>
                    <a href="javascript:void(0)">韩 国</a>
                    <a href="javascript:void(0)">埃 及</a>
                    <a href="javascript:void(0)">泰 国</a>
                    <a href="javascript:void(0)">西班牙</a>
                    <a href="javascript:void(0)">美 国</a>
                </p>
            </div>
        </div>
    </div>
    <!-- End Selregion -->
</div>
<!-- End Header -->
<div class="centain">
    <div class="c_person">
        <a class="c_p_index" href="index.html">首页</a>
        <span>> 订单详情</span>
    </div>
    <div class="c_main">
        <div class="c_m_list">
            <ul class="c_m_l_nav">
                <li >
                    <a href="personalCenter.html">个人中心</a>
                </li>
                <li class="c_m_l_n_update">
                    <a href="queryOrderCtrl">订单中心</a>
                </li>
                <li>
                    <a href="pass-update.html">修改密码</a>
                </li>
            </ul>
        </div>
        <c:set var="item" value="${requestScope.orderId }"/>
        <c:choose>
                 <c:when test="${not empty page.pageData}">
                 
                     <c:forEach var="order" items="${page.pageData}">
                     
                     	<c:if test="${order.orderId==item}">
                     	<c:if test="${order.status==1 }">
                     		<c:set var="status" value="未发货"/>
                     	</c:if>
                     	<c:if test="${order.status==0 }">
                     		<c:set var="status" value="已发货"/>
                     	</c:if>
                     	
		                     <div class="c_m_info">
					            <p class="c_m_i_personal">订单详情</p>
					            <ul class="c_m_i_list">
					                <li class="c_m_i_l_fir">
					                    <span class="left">订单号：</span>
					                    <span class="c_m_i_l_f_name">${order.orderNumber}</span>
					                </li>
					                <li class="c_m_i_l_sec">
					                    <span class="left">收件人：</span>
					                    <span class="c_m_i_l_s_phone">${order.receiver}</span>
					                </li>
					                <li class="c_m_i_l_thi">
					                    <span class="left">电话号码：</span>
					                    <span class="c_m_i_l_t_email">${order.tel}</span>
					                </li>
					                <li class="c_m_i_l_fou">
					                    <span class="left">收货地址：</span>
					                    <span class="c_m_i_l_fi_answer">${order.address}</span>
					                </li>
					                <li class="c_m_i_l_fif">
					                    <span class="left">订单状态：</span>
					                    
					                    <span class="c_m_i_l_fi_answer">${status}</span>
					                </li>
					            </ul>
					        </div>
					        <div class="c_m_product">
					            <p class="c_m_i_p_list">商品清单</p>
					            <table cellspacing="0" cellpadding="0" class="c_m_i_header">
					                <tr class="c_m_i_h_th">
					                    <td  class="c_m_i_h_info" colspan="2">商品信息</td>
					                    <td class="c_m_i_h_price">单价</td>
					                    <td class="c_m_i_h_count">数量</td>
					                    <td class="c_m_i_h_sum">合计</td>
					                </tr>
					                <c:forEach var="orderItem" items="${orderItems}">
					                	<c:if test="${orderItem.orderNumber==order.orderNumber}">
					                		<tr>
						                    <td class="c_m_i_i_pic">
						                        <img class="c_m_i_i_s_product" src="${orderItem.productImage }">
						                    </td>
						                    <td class="c_m_i_i_info">
						                        <a href="javascript:void(0);">${orderItem.productName}&nbsp;${orderItem.config }&nbsp;${orderItem.color}</a>
						                    </td>
						                    <td class="common_td c_m_i_i_price">￥${orderItem.unitPrice }</td>
						                    <td class="common_td c_m_i_i_num">${orderItem.quantity}</td>
						                    <td class="common_td c_m_i_i_total">￥${orderItem.totalPrice}</td>
					                		</tr>
					                	</c:if>
					                </c:forEach>
					            </table>
					            </ul>
					        </div>
				        </c:if>
                     </c:forEach>
                 </c:when>
        </c:choose>
    </div>
    <div class="clear"></div>
</div>
<!--End Centain-->
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
<script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
<!-- 引入header.js -->
<script type="text/javascript" src="js/header.js"></script>
<!-- 引入swiper插件js -->
<script type="text/javascript" src="library/swiper/swiper-4.2.0.min.js"></script>
<script type="text/javascript" src="js/product.js"></script>
</body>
</html>