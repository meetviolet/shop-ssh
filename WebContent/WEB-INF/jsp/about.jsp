<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>联系我们</title>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/base.css" />
</head>

<body>
	
	<%@ include file="top.jsp"%>

	<div class="container">

		<div class="width-all height-40 margin-top-50 border-top-solid position-relative">
			<div class="width-all position-absolute text-center" style="top:-12px;">
				<span class="back-white padding-w-15 font-26 font-bold">
					<span>联系我们</span>
					<span class="color-red">Contact</span>
				</span>
			</div>
		</div>
		<div class="width-550 margin-auto-w padding-top-20 min-height-200 font-16">
			<div class="height-45 line-height-45 padding-left-35" style="background:url(${pageContext.request.contextPath }/image/tubiao01_8pef.png) no-repeat left center;">地址：西安交通大学创新港校区软件学院</div>
			<div class="height-45 line-height-45 padding-left-35" style="background:url(${pageContext.request.contextPath }/image/tubiao02_k7yp.png) no-repeat left center;">电话：12345678910</div>
			<div class="height-45 line-height-45 padding-left-35" style="background:url(${pageContext.request.contextPath }/image/tubioa03_bm43.png) no-repeat left center;">邮编：712000</div>
			<div class="height-45 line-height-45 padding-left-35" style="background:url(${pageContext.request.contextPath }/image/tubiao05_uxos.png) no-repeat left center;">邮箱：cxgxjtu@163.com</div>
			<div class="height-45 line-height-45 padding-left-35" style="background:url(${pageContext.request.contextPath }/image/tubiao06_faut.png) no-repeat left center;">微博：www.weibo.com/u/5722903259</div>
			<div class="height-45 line-height-45 padding-left-35" style="background:url(${pageContext.request.contextPath }/image/tubiao04_k3kc.png) no-repeat left center;">成员：岳怡、李晔璇、王跃、李明昊、周亚亚、申瑜豪、刘富超、赵飞 </div>
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