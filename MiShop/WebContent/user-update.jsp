<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.List,com.mishop.entity.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改个人信息</title>
    <!-- 引入swiper插件css -->
    <link rel="stylesheet" type="text/css" href="library/swiper/swiper-4.2.0.min.css">
    <!-- header:iconfont -->
    <link rel="stylesheet" type="text/css" href="iconfont/header/iconfont.css">
    <!-- header.css -->
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <!-- product:iconfont -->
    <link rel="stylesheet" type="text/css" href="iconfont/product/iconfont.css">
    <!-- product.css -->
    <link rel="stylesheet" type="text/css" href="css/product.css">
    <!-- footer:iconfont -->
    <link rel="stylesheet" type="text/css" href="iconfont/footer/iconfont.css">
    <!-- footer.css -->
    <link rel="stylesheet" type="text/css" href="css/footer.css">
    <link rel="stylesheet" type="text/css" href="css/user-update.css">
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
                    <li><a href="miui.html">MIUI</a><span>|</span></li>
                    <li><a href="IoT.html">IoT</a><span>|</span></li>
                    <li><a href="cloud.html">云服务</a><span>|</span></li>
                    <li><a href="shuidi.html">水滴</a><span>|</span></li>
                    <li><a href="jr.html">金融</a><span>|</span></li>
                    <li><a href="youpin.html">有品</a><span>|</span></li>
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
                    <div id="open"><span class="user" style="position: relative">${USER.userName}</span><span class="ii">∨</span></div>
                    <div class="drop-down" id="drop-down">
                        <ul class="drop-down-ul">
                            <li><a href="personalCenter.jsp" class="ac">个人中心</a></li>
                            <li><a href="javascript:void(0)" class="ac">评价晒单</a></li>
                            <li><a href="javascript:void(0)" class="ac">我的喜欢</a></li>
                            <li><a href="javascript:void(0)" class="ac">小米账户</a></li>
                            <li><a href="index.jsp" class="ac">退出登录</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Topnav -->
    <!-- Nav 主导航 -->
    <div class="nav">
        <div class="n_wrapper">
            <div class="n_w_logo" title="小米官网">
                <a href="index.jsp"></a>
            </div>
            <div class="n_w_holiday" >
                <a href="javascript:void(0)"></a>
            </div>
            <div class="n_w_main">
                <ul>
                    <li class="n_w_m_label"><a href="javascript:void(0)">小米手机</a></li>
                    <li class="n_w_m_label"><a href="javascript:void(0)">红米</a></li>
                    <li class="n_w_m_label"><a href="javascript:void(0)">电视</a></li>
                    <li class="n_w_m_label"><a href="javascript:void(0)">笔记本</a></li>
                    <li class="n_w_m_label"><a href="javascript:void(0)">盒子</a></li>
                    <li class="n_w_m_label"><a href="javascript:void(0)">新品</a></li>
                    <li class="n_w_m_label"><a href="javascript:void(0)">路由器</a></li>
                    <li class="n_w_m_label"><a href="javascript:void(0)">智能硬件</a></li>
                    <li><a href="service.html">服务</a></li>
                    <li><a href="community.html">社区</a></li>
                </ul>
            </div>
            <div class="n_w_search">
                <form class="n_w_s_input">
                    <input type="search"  name="key">
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
            <div class="n_p_main">
            </div>
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
        <a class="c_p_index" href="index.jsp">首页</a>
        <span>> 修改个人信息</span>
    </div>
    <div class="c_main">
        <div class="c_m_list">
            <ul class="c_m_l_nav">
                <li class="c_m_l_n_center">
                    <a href="personalCenter.jsp">个人中心</a>
                </li>
                <li>
                    <a href="javascript:void(0)">订单中心</a>
                </li>
                <li>
                    <a href="javascript:void(0)">修改密码</a>
                </li>
            </ul>
        </div>
        <div class="c_m_info">
            <p class="c_m_i_personal">修改个人信息</p>
            <ul class="c_m_i_list">
                <li class="c_m_i_l_fir">
                    <span class="left">用户名：</span>
                    <span class="c_m_i_l_f_name">${USER.userName}</span>
                </li>
                <li class="c_m_i_l_fir">
                    <span class="left">真实姓名：</span>
                    <input type="text" class="c_m_i_l_f_realName" value="${USER.userRealName}">
                </li>
                <li class="c_m_i_l_fir">
                    <span class="left">性别：</span>
                    <p class="sex">男</p><input type="radio" name="sex" value="男" class="sexbox" checked/>
                    <p class="sex">女</p><input type="radio" name="sex" value="女" class="sexbox"/>
                </li>
                <li class="c_m_i_l_fir">
                    <span class="left">生日：</span>
                    <input type="date" name="birthday" class="date" value="${USER.birthday}">
                </li>
                <li class="c_m_i_l_fir">
                    <span class="left">电话：</span>
                    <span class="c_m_i_l_f_tel" name="tel">${USER.tel}</span>
                </li>
                <li class="c_m_i_l_fir">
                    <span class="left">邮箱：</span>
                    <span class="c_m_i_l_f_email" name="email">${USER.email}</span>
                </li>

               <!-- <li class="c_m_i_l_fif">
                    <span class="left">收货地址：</span>
                    <input type="text" class="c_m_i_l_fi_answer">
                </li>-->
            </ul>
            <button class="c_m_i_update">提交修改</button>
        </div>

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
<script type="text/javascript" src="js/user-update.js"></script>
<!-- 引入header.js -->
<script type="text/javascript" src="js/header.js"></script>
<!-- 引入swiper插件js -->
<script type="text/javascript" src="library/swiper/swiper-4.2.0.min.js"></script>
<script type="text/javascript" src="js/product.js"></script>
<script type="text/javascript">
    var $user = $("#open");
    var $menu = $("#drop-down");
    $user.mouseenter(function(){
        $menu.slideDown(200);
    });
    $user.mouseleave(function(){
        $menu.slideUp(200);
    });
    $menu.mouseenter(function(){
        $(this).slideDown(200);
    });
    $menu.mouseleave(function(){
        $(this).slideUp(200);
    });
</script>
</body>
</html>