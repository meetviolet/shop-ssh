<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link href="${pageContext.request.contextPath}/admin/css/css.css" rel="stylesheet" type="text/css">
	<link href="${pageContext.request.contextPath}/css/public.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div class="width-all height-all">
		<div class="float-left padding-h-5" style="width:600px; height:70px;">
			<div class="float-left">
				<img src="../image/logo.png" width="260" height="85">
			</div>
			<div class="float-left" style="line-height:98px;">
				<span class="margin-left-10 color-blue font-bold font-32">商城后台管理系统</span>
			</div>
		</div>
		<div class="float-right padding-h-5" style="width:450px; height:70px; line-height:70px;">
			<span>
				<!-- 日历 -->
				<script type=text/javascript src="js/clock.js"></script>
				<script type=text/javascript>showcal();</script>
            </span>
        	<a href="${pageContext.request.contextPath }" target="_blank" onFocus="this.blur()" class="margin-left-20 admin-index">网站首页</a>
            <a href="${pageContext.request.contextPath }/admin_logout" target="_parent" onFocus="this.blur()" class="margin-left-15 admin-out">注销</a>
		</div>
	</div>
	
</body>
</html>
