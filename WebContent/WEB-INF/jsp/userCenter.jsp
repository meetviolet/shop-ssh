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
					<span>会员中心</span>
					<span class="color-red">VIP Center</span>
				</span>
			</div>
		</div>
		
		<div class="width-300 margin-auto-w padding-top-10">
			
			<div id="errorUpdateMsg" class="errorFlag font-12 color-red text-center"></div>
			
            <div class="height-75">
                <span class="line-height-30 color-gray">用户名：</span>
                <span id="userNameError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                <input id="username" name="username" type="text" value="<s:property value="#session.existUser.username" />" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;" disabled="disabled">
            </div>

            <div class="height-75">
                <span class="line-height-30 color-gray">原密码：</span>
                <span id="oldPasswordError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                <input id="oldPassword" name="password" type="password" maxlength="10" placeholder="请输入原密码" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                <input id="pswHidden" type="hidden" name="pwd" />
            </div>
            
            <div class="height-75">
                <span class="line-height-30 color-gray">新密码：</span>
                <span id="newPasswordError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                <input id="newPassword" type="password" placeholder="请输入新密码" maxlength="10" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                <input id="pswHidden" type="hidden" name="pwd" />
            </div>

            <div class="height-75">
                <span class="line-height-30 color-gray">确认密码：</span>
                <span id="confirmPasswordError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                <input id="confirmPassword" type="password" placeholder="请输入确认密码" maxlength="10" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                <input id="pswHidden" type="hidden" name="pwd" />
            </div>

            <div class="height-75">
                <span class="line-height-30 color-gray">邮箱：</span>
                <span id="emailError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                <input id="email" name="email" type="text" value="<s:property value="#session.existUser.email" />" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
            </div>

            <div class="height-75">
                <span class="line-height-30 color-gray">电话：</span>
                <span id="phoneError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                <input id="phone" name="phone" type="text" value="<s:property value="#session.existUser.phone" />" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
            </div>

            <div class="height-75">
                <span class="line-height-30 color-gray">地址：</span>
                <span id="addrError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                <input id="addr" name="addr" type="text" value="<s:property value="#session.existUser.addr" />" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
            </div>

            <div class="width-340 height-40 line-height-40 margin-top-30 border-radius-5 text-center back-red changebackboldred color-white font-16 letter-spacing-5 link" onclick="updateSubmit()">资料修改</div>
	
	  
        </div>

		<%@ include file="foot.jsp"%>
	</div>
	
	<script type="text/javascript">
		// 提交
		function updateSubmit(){
			$('#errorFlag').html('');
			
			var oldPassword = $('#oldPassword').val();
			if(isNull(oldPassword)){
				$('#oldPasswordError').html('原密码不能为空');
				return;
			}
			if(oldPassword.length > 10){
				$('#oldPasswordError').html('密码过长');
				return;
			}
			$('#oldPasswordError').html('');
			
			var newPassword = $('#newPassword').val();
			if(isNull(newPassword)){
				$('#newPasswordError').html('新密码不能为空');
				return;
			}
			$('#newPasswordError').html('');
			
			var confirmPassword = $('#confirmPassword').val();
			if(isNull(confirmPassword)){
				$('#confirmPasswordError').html('确认密码不能为空');
				return;
			}
			if(confirmPassword != newPassword){
				$('#confirmPasswordError').html('两次密码不一致');
				return;
			}
			$('#confirmPasswordError').html('');
	
			var email = $('#email').val();
			if(isNull(email)){
				$('#emailError').html('邮箱不能为空');
				return;
			}
			if(!isEmail(email)){
				$('#emailError').html('邮箱格式错误');
				return;
			}
			$('#emailError').html('');
			
			var phone = $('#phone').val();
			if(isNull(phone)){
				$('#phoneError').html('电话不能为空');
				return;
			}
			if(!isPhone(phone)){
				$('#phoneError').html('电话格式错误');
				return;
			}
			$('#phoneError').html('');
			
			var addr = $('#addr').val();
			if(isNull(addr)){
				$('#addrError').html('地址不能为空');
				return;
			}
			$('#addrError').html('');
			
			$('.errorFlag').html('');
			
			$.ajax({
		        url: ctxRoot + "/user_update.action",
		        type: 'post',
		        data: {
	        		"email": email, 
	        		"oldPsd": oldPassword,
	        		"password": newPassword,
	        		"addr": addr,
	        		"phone": phone
		        },
		        dataType: "json",
		        success: function (result) {
		            if (result.state) {
		            	alert("会员资料修改成功！");
		            	window.location.reload();
		            } else {
		            	alert(result.message);
		                return;
		            }
		        },
		        error: function (result) {
		            return false;
		        }
		    });
		}
		
	</script>
	
</body>
</html>