<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改密码</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/alogin.css" />
    
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/valid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
</head>
<body>

	<div class="login">
		<h1>密码修改</h1>
		<input id="password" value="<s:property value="#session.existAdminUser.password" />" type="hidden"/>
	    <form id="loginForm" action="${pageContext.request.contextPath }/admin_modifyPsd.action" target="mainFrame" method="post">
	    	<div class="margin-top-10">
	    		<input id="oldPassword" type="password" placeholder="原密码"/>
	    	</div>
	    	<div class="margin-top-10">
	        	<input id="newPassword" type="password" name="password" placeholder="新密码"/>
	        </div>
	    	<div class="margin-top-10">
	        	<input id="confirmPassword" type="password" placeholder="确认新密码"/>
	        </div>
	        <span id="errorMsg" class="font-12 color-red padding-h-10"><s:actionmessage/></span>
	        <div class="margin-top-10">
	        	<div onclick="modifyPsd();" class="btn btn-primary btn-block btn-large link">确定修改</div>
	        </div>
	    </form>
	</div>
	
	<script type="text/javascript">
		// 绑定键盘按下事件
		$(document).keypress(function(e) {
	    	// 回车键事件 
	       	if(e.which == 13) {
	       		modifyPsd();
	       	}
	   	});
	
		function modifyPsd(){
			var oldPassword = $('#oldPassword').val();
			if(isNull(oldPassword)){
				$('#errorMsg').html('原密码不能为空');
				return;
			}
			
			var password = $('#password').val();
			if(oldPassword != password){
				$('#errorMsg').html('原密码不正确');
				return;
			}
			
			var newPassword = $('#newPassword').val();
			if(isNull(newPassword)){
				$('#errorMsg').html('新密码不能为空');
				return;
			}
			
			var confirmPassword = $('#confirmPassword').val();
			if(isNull(confirmPassword)){
				$('#errorMsg').html('确认密码不能为空');
				return;
			}
			if(confirmPassword != newPassword){
				$('#errorMsg').html('两次密码不一致');
				return;
			}
			
			$('#errorMsg').html('');
			
			$('#loginForm').submit();
		}
	</script>
</body>
</html>