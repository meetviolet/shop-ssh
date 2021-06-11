<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
		<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css" />
	</head>
<body>
	
	<div class="width-all height-all" style="background:#BFDAEF;">
		<div class="padding-top-80 text-center font-30 color-red">
			尊敬的管理员<span class="font-italic font-bold"><s:property value="#session.existAdminUser.username" /></span>，欢迎登录后台管理系统
		</div>
		<div class="margin-top-50 color-boldgray text-center font-20">【提示】您可以在该系统完成以下功能：</div>
		<div class="margin-auto-w padding-top-30 line-height-30 font-20 color-boldgray" style="width:550px;">
			<div class="font-boldgray">1、分类管理（一/二级分类总览、新增、删除、修改）</div>
			<div class="font-boldgray">2、商品管理（商品总览、上架、下架、信息修改）</div>
			<div class="font-boldgray">3、订单管理（订单总览、详情查看、订单发货）</div>
			<div class="font-boldgray">4、评论管理（评论总览、评论删除）</div>
			<br>
			<div class="font-boldgray" style="text-align:center">【注】更多功能，等待开发......</div>
		</div>
	</div>

</body>

</html>