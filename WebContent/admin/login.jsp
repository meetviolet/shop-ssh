<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>后台管理登录界面</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/alogin.css" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/valid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
</head>
<body>

	<div class="login">
		<h1>后台管理系统登录</h1>
	    <form id="loginForm" action="${pageContext.request.contextPath }/admin_login.action" target="_parent" method="post">
	    	<div class="margin-top-10">
	    		<input id="username" type="text" name="username" placeholder="用户名"/>
	    	</div>
	    	<div class="margin-top-10">
	        	<input id="password" type="password" name="password" placeholder="密码"/>
	        </div>
	        <span id="errorMsg" class="font-12 color-red padding-h-10"><s:actionerror/></span>
	        <div class="margin-top-10">
	        	<div onclick="login();" class="btn btn-primary btn-block btn-large link">登录</div>
	        </div>
	    </form>
	</div>
	
	<script type="text/javascript">
		// 绑定键盘按下事件
		$(document).keypress(function(e) {
	    	// 回车键事件 
	       	if(e.which == 13) {
   	   			login();
	       	}
	   	});
	
		function login(){
			var username = $('#username').val();
			if(isNull(username)){
				$('#errorMsg').html('用户名不能为空');
				return;
			}
			
			var password = $('#password').val();
			if(isNull(password)){
				$('#errorMsg').html('密码不能为空');
				return;
			}
			
			$('#errorMsg').html('');
			
			$('#loginForm').submit();
		}
	</script>
</body>
</html>