<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>购物车</title>
    <link href="css/cart.css" rel="stylesheet" type="text/css">
    <link href="./fonts/cart/iconfont.css" rel="stylesheet" type="text/css">
    <!-- footer:iconfont -->
    <link rel="stylesheet" type="text/css" href="./fonts/footer/iconfont.css">
    <!-- footer.css -->
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <script type="text/javascript" src="js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="js/cart.js"></script>
</head>
<body>
    <div class="header">
        <!-- top -->
        <div class="top">
            <div class="top_logo">
                <a href="index.jsp"></a>
            </div>
            <div class="top_title">
                <h2>我的购物车</h2>
            </div>
            <div class="top_tip">
                <p>温馨提示：产品是否购买成功，以最终下单为准哦，请尽快结算</p>
            </div>
            <div class="top_nav">
                <span class="t_n_user">
                    <a  class="t_n_u_id" href="javascript:void(0)">
                        <span>949709a918</span>
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
            <ul class="content_centre">
                  <!--第一栏-->
                  <li class="content_centre1">
                      <div class="content_centre1_msg1">
                          <a href="javascript:void(0)"><i id="selall" class="iconfont icon-fuxuan1 checkbox_selected"></i></a>
                          <span>全选</span>
                      </div>
                      <div class="content_centre1_msg2">
                          <span>商品名称</span>
                      </div>
                      <div class="content_centre1_msg3">
                          <span>单价</span>
                      </div>
                      <div class="content_centre1_msg4">
                          <span>数量</span>
                      </div>
                      <div class="content_centre1_msg5">
                          <span>小计</span>
                      </div>
                      <div class="content_centre1_msg6">
                          <span>操作</span>
                      </div>
                  </li>
                  <!--第二栏-->
                  <c:set var="goods"  value="1" />
                  <c:forEach items="${cart_list}" var="cartlist"  begin="0" >
	                  <li class="content_centre2" data-id="${cartlist.cartId}" product-id="${cartlist.productId}">
	                      <div class="content_centre2_msg1">
	                          <a href="javascript:void(0)"><i class="iconfont icon-fuxuan1 checkbox_selected selpart"></i></a>
	                      </div>
	                      <div class="content_centre2_msg2">
	                          <a href="javascript:void(0)"><img src="${cartlist.mainImage}"> </a>
	                      </div>
	                      <div class="content_centre2_msg3">
	                          <a href="javascript:void(0)">${cartlist.name}&nbsp;${cartlist.config}&nbsp;${cartlist.color}</a>
	                      </div>
	                      <!-- 商品单价 -->
	                      <div class="content_centre2_msg4">
	                          <span class="content_price">${cartlist.price}</span><span>元</span>
	                      </div>
	                      <!-- 商品数量 -->
	                      <div class="content_goods">
	                     		 <!-- 减少数量 -->
	                          <a href="CartCtrl?method=sub&deletecId=${cartlist.cartId} &quanty=${cartlist.quantity}" class="c_g_minus">
	                              <i class="iconfont icon-jianhaob"></i>
	                          </a>
	                          <input type="text" value="${cartlist.quantity}" class="c_g_num">
	                          <!-- 增加数量 -->
	                          <a href="CartCtrl?method=add&addcId=${cartlist.cartId}&quanty=${cartlist.quantity}" class="c_g_plus">
	                              <i class="iconfont icon-jiahaob"></i>
	                          </a>
	                      </div>
	                      <!-- 小计 -->
	                      <div class="content_centre2_msg6">
	                          <span class="content_subtotal">${cartlist.subtotal}</span><span>元</span>
	                      </div>
	                      <div class="content_centre2_msg7 close">
	                          <div class="content_centre2_msg7_chahao">
	                          <!--跳到删除的控制层，将这里的cartId传送过去，进行删除-->
	                          <a href="CartCtrl?method=delete&cId=${cartlist.cartId}"><i class="iconfont icon-chahao"></i></a>
	                          </div>
	                      </div>
	                  </li>
                  </c:forEach>
            </ul>
            <div class="content_centre7">
                <div class="content_centre7_msg1">
                    <a class="mijiafenshan" href="javascript:void(0)">继续购物</a>
                    <span>&nbsp;&nbsp;|</span>
                </div>
                <div class="content_centre7_msg2">
                    <span>共<input class="goods_sum" readonly="readonly" value="${cartlist.size}">件商品已选择<input class="choose_sum" readonly="readonly" value="5">件</span>
                </div>
                      <span class="content_centre7_msg3">
                          总计:
                          <em class="totalprice"></em>
                          元
                      </span>
                <a href="javascript:void(0)" class="content_centre7_msg4">去结算</a>
            </div>
            <!-- content_nav -->
        </div>
        <!--End content-->
    </div>
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
                    <a href="javascript:void(0)"><img src="mages/index/footer/4.png"></a>
                    <a href="javascript:void(0)"><img src="images/index/footer/5.png"></a>
                </div>
            </div>
            <div class="f_l_bottom"></div>
        </div>
    </div>
    <!-- End Footer -->
    <!-- 引入jQuery -->

    <!-- js -->

</body>
</html>