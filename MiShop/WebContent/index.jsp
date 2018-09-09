<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>小米商城</title>
    <!-- header:iconfont -->
    <link rel="stylesheet" type="text/css" href="fonts/header/iconfont.css">
    <!-- header.css -->
    <link rel="stylesheet" type="text/css" href="css/header.css">
    <!-- index:iconfont -->
    <link rel="stylesheet" type="text/css" href="fonts/index/iconfont.css">
    <!-- index.css -->
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <!-- footer:iconfont -->
    <link rel="stylesheet" type="text/css" href="fonts/footer/iconfont.css">
    <!-- footer.css -->
    <link rel="stylesheet" type="text/css" href="css/footer.css">
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
<!-- Container -->
<div class="container">
    <!-- Banner 广告位 -->
    <div class="banner">
        <!-- b_main -->
        <div class="b_main">
            <div class="b_m_pic">
                <ul>
                    <c:set  var="adver1" value="0"/>
	                <c:forEach items="${adver_list}"  var="adver" begin="0">
		                <c:if test="${adver1<6}">
			                <c:if test="${adver.adverType==0}">
			                	<li><a href="javascript:void(0)"><img src="${adver.adverHref}"></a></li>
			                	<c:set var="adver1" value="${adver1+1}"/>
			                </c:if>
		                </c:if>
	                </c:forEach>
                </ul>
            </div>
            <div class="b_m_btn">
                <div class="b_m_b_left"></div>
                <div class="b_m_b_right"></div>
            </div>
            <div class="b_m_tab">
                <ul><li class="click"></li><li></li><li></li><li></li><li></li></ul>
            </div>
        </div>
        <!-- End b_main -->
        <!-- b_nav -->
        <div class="b_nav">
            <ul>
                <li>
                    <a href="javascript:void(0)">手机 平板 电话卡<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==1||product.categoryId==2}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}"  varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==1||product.categoryId==2}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">电视 盒子<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==3||product.categoryId==5}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==3||product.categoryId==5}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">笔记本<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==4}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==4}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">智能 家电<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==6}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==6}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">健康 家居<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==26}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==26}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">出行 儿童<i class="iconfont icon-right"></i></a>
                     <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==27}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==27}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">路由器 手机配件<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==7}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==7}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">移动电源 插线板<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==8}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==8}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">耳机 音箱<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==9}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==9}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
                <li>
                    <a href="javascript:void(0)">生活 箱包<i class="iconfont icon-right"></i></a>
                    <c:set var="num1" value="0"/>
	                    <!-- 判断有多少条相关的信息 -->
			            <c:forEach items="${product_list}" var="product" begin="0">
							<c:if test="${product.categoryId==10}">
			                   <c:set var="num1" value="${num1+1}"/>
							</c:if>
						</c:forEach>
						<!-- 计算ul标签的数量 -->
						<fmt:parseNumber var="uls" integerOnly="true" value="${num1/6}" /> 
						<c:if test="${num1%6!=0}">
							<c:set var="uls" value="${uls+1}"/>
						</c:if>
                   <div class="b_n_hide" style="width:${uls*267}px;">
						<!-- 建立变量存储从集合中开始遍历的角标 -->
						<c:set var="row" value="1"/>
						<!-- 判断建立多少个ul标签 -->
						<c:forEach var="index" begin="1" end="${uls}">
			        		<ul>
			        			<c:set var="lineNmber" value="1"/>
			                    <c:forEach items="${product_list}" var="product" begin="${row}" varStatus="xh">
			                    		<!-- 判断该产品是否属于该类型 -->
										<c:if test="${product.categoryId==10}">
											<!-- 当建立6个li标签后，停止建立标签 -->
											<c:if test="${lineNmber<7}">
												<li>
					                                <a href="javascript:void(0)">
					                                    <img src="${product.mainImage}">
					                                    <span><c:out value="${product.productName}"></c:out></span>
					                                </a>
					                            </li>
							                    <c:set var="lineNmber" value="${lineNmber+1}"/>
							                    <c:set var="row" value="${xh.index}"/>
						                    </c:if>
										</c:if>
							    </c:forEach>
	                        </ul>
						</c:forEach>
                    </div>
                </li>
            </ul>
        </div>
        <!-- End b_nav -->
    </div>
    <!-- End Banner -->
    <!-- Hot 热门 -->
    <div class="hot">
        <div class="h_list">
            <ul>
                <li class="l1"><a href="javascript:void(0)"><i class="iconfont icon-phone"></i><span class="h_l_title">选购手机</span></a></li>
                <li class="l2"><a href="javascript:void(0)"><i class="iconfont icon-gift"></i><span class="h_l_title">企业团购</span></a></li>
                <li class="l3"><a href="javascript:void(0)"><i class="iconfont icon-F"></i><span class="h_l_title">F码通道</span></a></li>
                <li class="l4"><a href="javascript:void(0)"><i class="iconfont icon-ai-SIM"></i><span class="h_l_title">米粉卡</span></a></li>
                <li class="l5"><a href="javascript:void(0)"><i class="iconfont icon-phone02"></i><span class="h_l_title">以旧换新</span></a></li>
                <li class="l6"><a href="javascript:void(0)"><i class="iconfont icon-qiapian"></i><span class="h_l_title">话费充值</span></a></li>
            </ul>
        </div>
        <c:set  var="adver2"  value="1"/>
        	<c:forEach items="${adver_list2}" var="adver" begin="0">
        		<c:if test="${adver2<4 }">
	        		<c:if test="${adver.adverType==1}">
	        			<div class="h_img'+${adver2}+' h_img">
	        				<a href="javascript:void(0)"><img src="${adver.adverHref}" width="316" height="170"></a>
	        			</div>
	        			<c:set var="adver2" value="${adver2+1}"/>
	        		</c:if>
        		</c:if>
        	</c:forEach>
    </div>
    <!-- End Hot -->
    <!-- Purchase 购买 -->
    <div class="purchase">
        <div class="p_title">
            <h2 class="p_t_h2">小米闪购</h2>
            <div class="p_t_btn">
                <div class="p_t_b_left"><i class="iconfont icon-left"></i></div>
                <div class="p_t_b_right click"><i class="iconfont icon-right"></i></div>
            </div>
        </div>
        <div class="p_goods">
            <div class="p_g_countdown">
                <div class="p_g_c_title"><span class="start_time">10</span>:00场</div>
                <img src="images/index/purchase/purchase_flash.png">
                <div class="p_g_c_desc">距离结束还有</div>
                <div class="p_g_c_time">
                    <div class="p_g_c_box rest_hours">00</div>
                    <div class="p_g_c_dosh">:</div>
                    <div class="p_g_c_box rest_minutes">10</div>
                    <div class="p_g_c_dosh">:</div>
                    <div class="p_g_c_box rest_seconds">35</div>
                </div>
            </div>
            <div class="p_g_list">
                <ul>
                    <!--<li class="p_g_l_border1">-->
                        <!--<a href="javascript:void(0)">-->
                            <!--<img src="../images/index/purchase/purchase_goods1.jpg">-->
                        <!--</a>-->
                        <!--<h3>红米5 2+16GB 移动4G+版 金色</h3>-->
                        <!--<p class="p_g_l_desc">千元全面屏，前置柔光自拍</p>-->
                        <!--<p class="p_g_l_price">-->
                            <!--<span>739</span>-->
                            <!--<span>元</span>-->
                            <!--<del>799元</del>-->
                        <!--</p>-->
                    <!--</li>-->
                </ul>
            </div>
        </div>
        <div class="common_banner">
            <a href="javascript:void(0)">
                <img src="images/index/banner/banner_long1.jpg">
            </a>
        </div>
    </div>
    <!-- End Purchase -->
    <!-- bgColor -->
    <div id="bgColor">
        <!-- Phone -->
        <div class="phone">
            <div class="p_title">
                <h2>手机</h2>
                <a href="javascript:void(0)">查看全部<span class="iconfont icon-xiangyou3fill"></span></a>
            </div>
            <div class="p_content">
                <ul>
                    <li class="left">
                        <a href="javascript:void(0)">
                            <img src="images/index/phone/phone_main.jpg">
                        </a>
                    </li>
                    <li class="p_c_bottom">
                        <a href="javascript:void(0)" class="p_c_img">
                            <img src="images/index/phone/phone_4.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                    <li class="p_c_bottom">
                        <a href="javascript:void(0)" class="p_c_img">
                            <img src="images/index/phone/phone_2.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                    <li class="p_c_bottom">
                        <a href="javascript:void(0)" class="p_c_img">
                            <img src="images/index/phone/phone_3.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                    <li class="p_c_bottom">
                        <a href="javascript:void(0)" class="p_c_img">
                            <img src="images/index/phone/phone_3.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                    <li class="p_c_bottom">
                        <a href="javascript:void(0)" class="p_c_img">
                            <img src="images/index/phone/phone_3.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                    <!--<li class="p_c_bottom">-->
                        <!--<a href="javascript:void(0)" class="p_c_img">-->
                            <!--<img src="../images/index/phone/phone_8.jpg">-->
                        <!--</a>-->
                        <!--<a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>-->
                        <!--<p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>-->
                        <!--<p class="p_c_price">2299元</p>-->
                    <!--</li>-->
                    <li class="p_c_bottom">
                        <a href="javascript:void(0)" class="p_c_img">
                            <img src="images/index/phone/phone_6.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                    <li class="freetag" class="p_c_bottom">
                        <a href="product.html" class="p_c_img">
                            <img src="images/index/phone/phone_7.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                    <li style="margin-right:0" class="freetag">
                        <a href="javascript:void(0)" class="p_c_img">
                            <img src="images/index/phone/phone_8.jpg">
                        </a>
                        <a href="javascript:void(0)" class="p_c_title">小米6 4GB+64GB</a>
                        <p class="p_c_detail">变焦双摄，4 轴防抖，骁龙835 处理器</p>
                        <p class="p_c_price">2299元</p>
                    </li>
                </ul>
            </div>
            <div class="common_banner">
                <a href="javascript:void(0)">
                    <img src="images/index/banner/banner_long2.jpg">
                </a>
            </div>
        </div>
        <!-- End Phone -->

        <!-- Household -->
        <div class="household">
            <div class="h_title">
                <h2 class="h_t_h2">家电</h2>
                <ul>
                    <li class="hover">热门</li>
                    <li>电视影音</li>
                    <li>电脑</li>
                    <li>家居</li>
                </ul>
            </div>
            <div class="h_con">
                <div class="h_c_left">
                    <a href="javascript:void(0)" class="h_c_l_top">
                        <img src="images/index/household/household_left1.jpg"></a>
                    <a href="javascript:void(0)">
                        <img src="images/index/household/household_left2.jpg"></a>
                </div>
                <div class="h_c_right">
                    <ul style="display: block;">
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="common_banner">
                <a href="javascript:void(0)">
                    <img src="images/index/banner/banner_long3.jpg">
                </a>
            </div>
        </div>
        <!-- End Household -->

        <!-- Smarty  -->
        <div class="household">
            <div class="h_title">
                <h2 class="h_t_h2">智能</h2>
                <ul>
                    <li class="hover">热门</li>
                    <li>出行</li>
                    <li>健康</li>
                    <li>酷玩</li>
                    <li>路由器</li>
                </ul>
            </div>
            <div class="h_con">
                <div class="h_c_left">
                    <a href="javascript:void(0)" class="h_c_l_top">
                        <img src="images/index/smarty/smarty_left1.jpg"></a>
                    <a href="javascript:void(0)">
                        <img src="images/index/smarty/smarty_left2.jpg"></a>
                </div>
                <div class="h_c_right">
                    <ul style="display: block;">
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="common_banner">
                <a href="javascript:void(0)">
                    <img src="images/index/banner/banner_long4.jpg">
                </a>
            </div>
        </div>
        <!-- End Smarty -->

        <!-- Match -->
        <div class="household">
            <div class="h_title">
                <h2 class="h_t_h2">搭配</h2>
                <ul>
                    <li class="hover">热门</li>
                    <li>耳机音箱</li>
                    <li>电源</li>
                    <li>电池存储卡</li>
                </ul>
            </div>
            <div class="h_con">
                <div class="h_c_left">
                    <a href="javascript:void(0)" class="h_c_l_top">
                        <img src="images/index/match/match_left1.jpg"></a>
                    <a href="javascript:void(0)">
                        <img src="images/index/match/match_left2.jpg"></a>
                </div>
                <div class="h_c_right">
                    <ul style="display: block;">
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="common_banner">
                <a href="javascript:void(0)">
                    <img src="images/index/banner/banner_long5.jpg">
                </a>
            </div>
        </div>
        <!-- End Match -->

        <!-- Part -->
        <div class="household">
            <div class="h_title">
                <h2 class="h_t_h2">配件</h2>
                <ul>
                    <li class="hover">热门</li>
                    <li>保护套</li>
                    <li>贴膜</li>
                    <li>其他配件</li>
                </ul>
            </div>
            <div class="h_con">
                <div class="h_c_left">
                    <a href="javascript:void(0)" class="h_c_l_top">
                        <img src="images/index/part/part_left1.jpg"></a>
                    <a href="javascript:void(0)">
                        <img src="images/index/part/part_left2.jpg"></a>
                </div>
                <div class="h_c_right">
                    <ul style="display: block;">
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="common_banner">
                <a href="javascript:void(0)">
                    <img src="images/index/banner/banner_long6.jpg">
                </a>
            </div>
        </div>
        <!-- End Part -->

        <!-- Surround -->
        <div class="household">
            <div class="h_title">
                <h2 class="h_t_h2">周边</h2>
                <ul>
                    <li class="hover">热门</li>
                    <li>出行</li>
                    <li>居家</li>
                    <li>生活周边</li>
                    <li>箱包</li>
                </ul>
            </div>
            <div class="h_con">
                <div class="h_c_left">
                    <a href="javascript:void(0)" class="h_c_l_top">
                        <img src="images/index/surround/surround_left1.jpg"></a>
                    <a href="javascript:void(0)">
                        <img src="images/index/surround/surround_left2.jpg"></a>
                </div>
                <div class="h_c_right">
                    <ul style="display: block;">
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">79元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household3.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">99元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">149元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">49元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/household7.jpg"></a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">29元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/household8.png"></a>
                            <p class="h_c_e_price">29元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                    <ul>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot1.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot2.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot3.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot4.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot5.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot6.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_bottom">
                            <a href="" class="h_c_r_img">
                                <img src="images/index/household/hot7.jpg">
                            </a>
                            <a href="" class="h_c_r_title">小米电视4C 43英寸</a>
                            <p class="h_c_r_comment">人工智能 / 全高清屏幕 / 大内存</p>
                            <p class="h_c_r_price">999元</p>
                            <div class="h_c_hide">
                                <span class="review">小米的品质和性价比我不愿意在这里多说，如果不是最好的...</span>
                                <span class="author">来自于 17875511815 的评价</span>
                            </div>
                        </li>
                        <li class="h_c_eight">
                            <a href="javascript:void(0)" class="h_c_e_title">小米电视4C 43英寸</a>
                            <a href="javascript:void(0)" class="h_c_e_img">
                                <img src="images/index/household/hot8.jpg"></a>
                            <p class="h_c_e_price">999元</p>
                        </li>
                        <li class="h_c_nine">
                            <a href="javascript:void(0)" class="h_c_n_more">浏览更多</a>
                            <a href="javascript:void(0)" class="h_c_n_ear">小米笔记本</a>
                            <a href="javascript:void(0)" class="iconfont icon-icon--"></a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- End Surround -->


        <!-- Household -->
        <!--<div class="household">-->
            <!--<div class="h_title">-->
                <!--<h2 class="h_t_h2">家电</h2>-->
                <!--<ul>-->
                    <!--<li>热门</li>-->
                    <!--<li>电视影音</li>-->
                    <!--<li>电脑</li>-->
                    <!--<li>家居</li>-->
                <!--</ul>-->
            <!--</div>-->
            <!--<div class="h_con">-->
                <!--<div class="h_c_left">-->
                    <!--<a href="javascript:void(0)" class="h_c_l_top"><img src="../images/index/household/household_left1.jpg"></a>-->
                    <!--<a href="javascript:void(0)"><img src="../images/index/household/household_left2.jpg"></a>-->
                <!--</div>-->
                <!--<div class="h_c_right">-->
                <!--</div>-->
            <!--</div>-->
            <!--<div class="common_banner">-->
                <!--<a href="javascript:void(0)">-->
                    <!--<img src="../images/index/banner/banner_long3.jpg">-->
                <!--</a>-->
            <!--</div>-->
        <!--</div>-->
        <!-- End household -->

        <!-- 为你推荐 -->
        <!-- recommend -->
        <div class="recommend">
            <div class="r_title">
                <h2 class="r_t_h2">为你推荐</h2>
                <div class="r_t_btn">
                    <div class="r_t_b_left"><i class="iconfont icon-left"></i></div>
                    <div class="r_t_b_right click"><i class="iconfont icon-right"></i></div>
                </div>
            </div>
            <div class="r_goods">
                <ul>
                    <!-- <li>
                        <a href="" class="r_g_img"><img src="image/stargoods/1.png"/></a>
                        <a href="" class="r_g_title">小米手机5 尊享版</a>
                        <p class="r_g_detail">4GB内存+128GB闪存，陶瓷版</p>
                        <p class="r_g_price">2699元</p>
                    </li> -->
                </ul>
            </div>
        </div>
        <!-- End Recommend -->
        <!-- Comment -->
        <div class="comment">
            <h2 class="c_title">热评产品</h2>
            <div class="c_con">
                <ul>
                    <li>
                        <a href="javascript:void(0)" class="c_c_img"><img src="images/index/comment/comment_1.jpg"></a>
                        <a href="javascript:void(0)" class="c_c_detail">非常可爱，一拿到小宝宝还没享受，一帮大宝宝先high了一把，同事也想买，希望早点大卖。</a>
                        <p class="c_c_comment">来自于 秘密 的评价</p>
                        <a href="javascript:void(0)" class="c_c_title">米兔智能故事机 <span class="space">| </span><span class="price">189元</span></a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="c_c_img"><img src="images/index/comment/comment_2.jpg"></a>
                        <a href="javascript:void(0)" class="c_c_detail">超级喜欢！小巧玲珑！音质完美！不知道为什么！只要是小米出的东西我都喜欢！那倒是因为那一句？？小米...</a>
                        <p class="c_c_comment">来自于 田密 的评价</p>
                        <a href="javascript:void(0)" class="c_c_title">小米随身蓝牙音箱 <span class="space">| </span><span class="price">59元</span></a>
                    </li>
                    <li>
                        <a href="javascript:void(0)" class="c_c_img"><img src="images/index/comment/comment_3.jpg"></a>
                        <a href="javascript:void(0)" class="c_c_detail">非常好用，孩子使用防止沉迷于电话影响学习。做工很好，定位基本准确，通话清晰。如果加入时间显示就...</a>
                        <p class="c_c_comment">来自于 178576259 的评价</p>
                        <a href="javascript:void(0)" class="c_c_title">米兔定位电话 <span class="space">| </span><span class="price">149元</span></a>
                    </li>
                    <li style="margin-right:0">
                        <a href="javascript:void(0)" class="c_c_img"><img src="images/index/comment/comment_4.jpg"></a>
                        <a href="javascript:void(0)" class="c_c_detail">包装很让人感动，式样也很可爱，做出的饭全家人都爱吃，超爱五星！手机控制还是不太熟练，最主要是没...</a>
                        <p class="c_c_comment">来自于 HZG 的评价</p>
                        <a href="javascript:void(0)" class="c_c_title">米家压力IH电饭煲 <span class="space">| </span><span class="price">999元</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- End Comment -->

        <!-- Content -->
        <div class="content">
            <h2 class="c_title">内容</h2>
            <div class="c_con">
                <ul>
                    <li class="c_c_li">
                        <h3>图书</h3>
                        <div class="box_wrap">
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">哈利·波特与被诅咒的孩子</a>
                                <a href="javascript:void(0)" class="c_c_detail">哈利波特</a>
                                <a href="javascript:void(0)" class="c_c_price">29.37元</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_book1.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">哈利·波特与魔法石</a>
                                <a href="javascript:void(0)" class="c_c_detail">哈利波特</a>
                                <a href="javascript:void(0)" class="c_c_price">29.37元</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_book2.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">哈利·波特与魔法石</a>
                                <a href="javascript:void(0)" class="c_c_detail">哈利波特</a>
                                <a href="javascript:void(0)" class="c_c_price">29.37元</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_book1.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">哈利·波特与魔法石</a>
                                <a href="javascript:void(0)" class="c_c_detail">哈利波特</a>
                                <a href="javascript:void(0)" class="c_c_price">29.37元</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_book3.jpg"></a>
                            </div>
                        </div>
                        <div class="tab">
                            <ul><li class="on"></li><li></li><li></li><li></li></ul>
                        </div>
                        <div class="btn" onselectstart="return false;">
                            <div class="b_left iconfont icon-left" style="left:0"></div>
                            <div class="b_right iconfont icon-right" style="right:0;"></div>
                        </div>
                    </li>
                    <li class="c_c_li">
                        <h3>MIUI 主题</h3>
                        <div class="box_wrap">
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">黑豹-迅猛来袭</a>
                                <a href="javascript:void(0)" class="c_c_detail">小米主题与迪士尼首度合作</a>
                                <a href="javascript:void(0)" class="c_c_price">8米币</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_theme1.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">黑豹-迅猛来袭</a>
                                <a href="javascript:void(0)" class="c_c_detail">小米主题与迪士尼首度合作</a>
                                <a href="javascript:void(0)" class="c_c_price">8米币</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_theme2.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">黑豹-迅猛来袭</a>
                                <a href="javascript:void(0)" class="c_c_detail">小米主题与迪士尼首度合作</a>
                                <a href="javascript:void(0)" class="c_c_price">8米币</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_theme3.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">黑豹-迅猛来袭</a>
                                <a href="javascript:void(0)" class="c_c_detail">小米主题与迪士尼首度合作</a>
                                <a href="javascript:void(0)" class="c_c_price">8米币</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_theme4.jpg"></a>
                            </div>
                        </div>
                        <div class="tab">
                            <ul><li class="on"></li><li></li><li></li><li></li></ul>
                        </div>
                        <div class="btn" onselectstart="return false;">
                            <div class="b_left iconfont icon-left" style="left:0"></div>
                            <div class="b_right iconfont icon-right" style="right:0;"></div>
                        </div>
                    </li>
                    <li class="c_c_li">
                        <h3>游戏</h3>
                        <div class="box_wrap">
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">剑侠世界2</a>
                                <a href="javascript:void(0)" class="c_c_detail">潮流武侠，炫动江湖！</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_game1.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">剑侠世界2</a>
                                <a href="javascript:void(0)" class="c_c_detail">潮流武侠，炫动江湖！</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_game2.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">剑侠世界2</a>
                                <a href="javascript:void(0)" class="c_c_detail">潮流武侠，炫动江湖！</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_game3.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">剑侠世界2</a>
                                <a href="javascript:void(0)" class="c_c_detail">潮流武侠，炫动江湖！</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_game4.jpg"></a>
                            </div>
                        </div>
                        <div class="tab">
                            <ul><li class="on"></li><li></li><li></li><li></li></ul>
                        </div>
                        <div class="btn" onselectstart="return false;">
                            <div class="b_left iconfont icon-left" style="left:0"></div>
                            <div class="b_right iconfont icon-right" style="right:0;"></div>
                        </div>
                    </li>
                    <li class="c_c_li"  style="margin-right:0">
                        <h3>应用</h3>
                        <div class="box_wrap">
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">2017金米奖</a>
                                <a href="javascript:void(0)" class="c_c_detail">最优秀的应用和游戏</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_app1.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">2015年度应用</a>
                                <a href="javascript:void(0)" class="c_c_detail">2015年度应用</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_app2.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">2015年度应用</a>
                                <a href="javascript:void(0)" class="c_c_detail">2015年度应用</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_app3.png"></a>
                            </div>
                            <div class="box">
                                <a href="javascript:void(0)" class="c_c_title">2015年度应用</a>
                                <a href="javascript:void(0)" class="c_c_detail">2015年度应用</a>
                                <a href="javascript:void(0)" class="c_c_price">免费</a>
                                <a href="javascript:void(0)" class="c_c_img"><img src="images/index/content/content_app4.jpg"></a>
                            </div>
                        </div>
                        <div class="tab">
                            <ul><li class="on"></li><li></li><li></li><li></li></ul>
                        </div>
                        <div class="btn" onselectstart="return false;">
                            <div class="b_left iconfont icon-left" style="left:0"></div>
                            <div class="b_right iconfont icon-right" style="right:0;"></div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- End Content -->

        <!-- Video -->
        <div class="video">
            <div class="v_title">
                <h2 class="v_t_h2">视频</h2>
                <a href="#">查看全部<span class="iconfont icon-xiangyou3fill"></span></a>
            </div>
            <div class="v_con">
                <ul>
                    <li data="media/index/1.mp4">
                        <img src="images/index/video/video_bg1.jpg" alt="">
                        <a href="">品质之魂 存于匠心</a>
                        <p>红米手机品质的工程师访谈</p>
                        <span class="iconfont icon-bofang"></span>
                    </li>
                    <li data="media/index/2.mp4">
                        <img src="images/index/video/video_bg2.jpg" alt="">
                        <a href="">红米手机工艺视频</a>
                        <p>红米5 / 红米5 Plus 高颜值机身</p>
                        <span class="iconfont icon-bofang"></span>
                    </li>
                    <li data="media/index/3.mp4">
                        <img src="images/index/video/video_bg3.jpg" alt="">
                        <a href="">雷军与斯塔克打造全面屏2.0</a>
                        <p>一场关于小米MIX 2 极致工艺的巅峰对话</p>
                        <span class="iconfont icon-bofang"></span>
                    </li>
                    <li style="margin-right:0;"  data="media/index/4.mp4">
                        <img src="images/index/video/video_bg4.jpg" alt="">
                        <a href="">MIUI 9 理念视频</a>
                        <p>快如闪电，前所未有的流畅</p>
                        <span class="iconfont icon-bofang"></span>
                    </li>
                </ul>
            </div>
            <div class="v_hide">
                <div class="v_h_con">
                    <div class="v_h_c_title">
                        <h2 class="v_h_c_h2">红米年度品牌视频</h2>
                        <i class="iconfont icon-close close"></i>
                    </div>
                    <div class="v_h_c_content">
                        <iframe src='' frameborder='allowfullscreen'></iframe>
                    </div>
                </div>
            </div>
        </div>
        <!-- End video -->
    </div>
    <!-- End bgcolor -->

</div>
<!-- End Container -->
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
<script type="text/javascript" src="js/indexdata.js"></script>
<!-- index.js -->
<script type="text/javascript" src="js/index.js"></script>
</body>
</html>
