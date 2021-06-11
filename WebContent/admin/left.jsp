<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
	<link type="text/css" rel="stylesheet" href="css/css.css"/>
	<script type="text/javascript">
		var ctxRoot = '${pageContext.request.contextPath }';
	</script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="js/sdmenu.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/valid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
	
</head>
<body class="overflow-h">
	<div style="width:280px; min-height:816px; background:lightblue;">
		
		<s:if test="#session.existAdminUser!=null">
			<div class="color-white line-height-30 font-15" style="padding:5px 8px;">
				<span>
					用户：<s:property value="#session.existAdminUser.username" />
					<a href="${pageContext.request.contextPath}/admin_changePsd.action" target="mainFrame" class="margin-left-20 font-bold color-red font-12 link">修改密码</a>
					<br>
					角色：超级管理员
				</span>
			</div>
		</s:if>
		
		<div style="float:left; margin-top:10px;" id="my_menu" class="sdmenu">
	      <div class="collapsed">
	        <span>首页</span>
	        <a href="${pageContext.request.contextPath}/admin/home.jsp" target="_parent">返回首页</a>
	      </div>
	      <div>
	        <span>分类管理</span>
	        <a href="${pageContext.request.contextPath}/admincategory_findAll.action" target="mainFrame">一级分类管理</a>
	        <a href="${pageContext.request.contextPath}/adminsecond_findAll.action?page=1" target="mainFrame">二级分类管理</a>
	      </div>
	      <div>
	        <span>商品管理</span>
	        <a href="${pageContext.request.contextPath}/adminproduct_findAll.action?page=1" target="mainFrame" >商品管理</a>
	      </div>
	      <div>
	        <span>订单管理</span>
	        <a href="${pageContext.request.contextPath}/adminorder_findAll.action?page=1" target="mainFrame">订单管理</a>
	      </div>
	      <div>
	        <span>评论管理</span>
	        <a href="${pageContext.request.contextPath}/admincomment_findAll.action?page=1" target="mainFrame">评论管理</a>
	      </div>
    </div>
	</div>
	<script type="text/javascript">
		$(function (){
			var myMenu;
			window.onload = function() {
				myMenu = new SDMenu("my_menu");
				myMenu.init();
			};
		})
	</script>
</body>
</html>
