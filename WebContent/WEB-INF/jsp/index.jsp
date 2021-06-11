<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>线上商城</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/base.css" />
</head>

<body>
	
  <%@ include file="top.jsp"%>

	<div class="width-all">
		<!-- 大区轮播 -->
		<div class="swiper-container">
		    <div class="swiper-wrapper" style="height:440px;">
		        <div class="swiper-slide">
		        	<img src="${pageContext.request.contextPath}/banner/banner0.jpg" width="100%" height="600px;">
		        </div>
		        <div class="swiper-slide">
		        	<img src="${pageContext.request.contextPath}/banner/banner2.jpg" width="100%" height="600px;">
		        </div>
		        <div class="swiper-slide">
		        	<img src="${pageContext.request.contextPath}/banner/banner3.jpg" width="100%" height="600px;">
		        </div>
		        <div class="swiper-slide">
		        	<img src="${pageContext.request.contextPath}/banner/banner4.jpg" width="100%" height="600px;">
		        </div>
		    </div>
		    <!-- 如果需要分页器 -->
		    <div class="swiper-pagination"></div>
		    
		    <!-- 如果需要导航按钮 -->
		    <div class="swiper-button-prev"></div>
		    <div class="swiper-button-next"></div>
		</div>
	    <!-- 大区轮播结束 -->
	</div>

	<div class="container">

		<div class="width-all height-40 margin-top-50 border-top-solid position-relative">
			<div class="width-all position-absolute text-center" style="top:-12px;">
				<span class="back-white padding-w-15 font-26 font-bold">
					<span>高评分商品</span>
					<span class="color-red">Well</span>
				</span>
			</div>
		</div>

		<div id="hotProduct">	
			<s:iterator value="hList" var="h">
				<div class="float-left link" style="width:294px; height:294px; margin-left:4px; margin-top:4px;">
					<div onclick="openUrl('/product_findByPid.action?pid=<s:property value='#h.pid'/>', true);" id="<s:property value='#h.pid'/>" class="width-all height-all position-relative productHover">
						<img class="width-all height-all border-radius-15" src="${pageContext.request.contextPath }/<s:property value='#h.image'/>" />
						<div class="hoverFlag hidden">
							<div class="border-radius-15 position-absolute color-white back-white" style="width:100%; height:100%; bottom:0px; z-index:1; filter:alpha(Opacity=30); -moz-opacity:0.3; opacity:0.3;"></div>
							<div class="border-radius-15 position-absolute color-white back-gray" style="width:274px; padding:10px; bottom:0px; z-index:2;"><s:property value='#h.pdesc'/></div>
						</div>
					</div>				
				</div>
			</s:iterator>
			<div class="clear"></div>
		</div>
		
		<div class="width-all height-40 margin-top-50 border-top-solid position-relative">
			<div class="width-all position-absolute text-center" style="top:-12px;">
				<span class="back-white padding-w-15 font-26 font-bold">
					<span>最新商品</span>
					<span class="color-red">New</span>
				</span>
			</div>
		</div>
		
		<div id="newProduct">
			<s:iterator value="nList" var="p">
				<div class="float-left link" style="width:294px; height:294px; margin-left:4px; margin-top:4px;">
					<div onclick="openUrl('/product_findByPid.action?pid=<s:property value='#p.pid'/>', true)" id="<s:property value='#h.pid'/>" class="width-all height-all position-relative productHover">
						<img class="width-all height-all border-radius-15" src="${pageContext.request.contextPath }/<s:property value='#p.image'/>" />
						<div class="hoverFlag hidden">
							<div class="border-radius-15 position-absolute color-white back-white" style="width:100%; height:100%; bottom:0px; z-index:1; filter:alpha(Opacity=30); -moz-opacity:0.3; opacity:0.3;"></div>
							<div class="border-radius-15 position-absolute color-white back-gray" style="width:274px; padding:10px; bottom:0px; z-index:2;"><s:property value='#p.pdesc'/></div>
						</div>
					</div>
				</div>
			</s:iterator>
			<div class="clear"></div>
		</div>

		<%@ include file="foot.jsp"%>
	</div>
	
	<script type="text/javascript">
		
		$(function(){
			$('.productHover').hover(
				function(){
					$(this).children(".hoverFlag").fadeIn();
				},
				function(){
					$(this).children(".hoverFlag").fadeOut();
				}
			);
		})
		
		var mySwiper = new Swiper ('.swiper-container', {
		    direction: 'horizontal',
		    autoplay: true,
		    loop: true,
		    
		    // 如果需要分页器
		    pagination: {
		      el: '.swiper-pagination',
		    },
		    
		    // 如果需要前进后退按钮
		    navigation: {
		      nextEl: '.swiper-button-next',
		      prevEl: '.swiper-button-prev',
		    },
		    
		    // 如果需要滚动条
		    scrollbar: {
		      el: '.swiper-scrollbar',
		    },
  		})
	</script>
	
</body>
</html>