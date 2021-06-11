<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>会员注册</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/base.css" />
</head>
<body>

    <div id="layout-shadow" class="layout-shadow hidden"></div>
    
    <div class="regist">
        <div class="registContent">
        
        	<div class="padding-h-40">
	        	<div onclick="openUrl('/index.action');" class="float-left img-logo link"></div>
				<div class="float-right img-zhengPin"></div>
				<div class="clear"></div>
        	</div>
			

			<div class="regist-leftDiv">
				<div style="position:absolute; bottom:0px; width:100%; height:100%; background:#E8DFC2; filter:alpha(Opacity=30); -moz-opacity:0.3; opacity:0.3; z-index:1;"></div>
				<div style="position:absolute; width:100%; top:0px; z-index:2;">
					<div class="font-18 text-center padding-top-50 font-bold">注册</div>
					<div class="font-16 text-center font-italic padding-top-50">欢迎注册</div>
					<div class="font-16 text-center font-italic padding-top-20">注册后即可购物</div>
					<div class="font-16 text-center font-italic padding-top-20">不定时发布优惠</div>
					<div class="font-16 text-center font-italic padding-top-20">心动不如行动</div>
					
				</div>
			</div>
            <div class="regist-rightDiv">
                <div class="width-340 height-35 line-height-30">
                    <div class="float-left width-4 height-18 margin-top-6 margin-right-10 back-boldorange"></div>
                    <div class="float-left font-bold font-16 color-boldorange">会员注册</div>
                    <div class="float-right font-12 color-gray">已有账号？<a class="orange font-12" href="${pageContext.request.contextPath}/user_loginPage.action">立即登录</a></div>
                    <div class="clear"></div>
                </div>

                <span class="errorFlag font-12 color-red padding-h-10"><s:actionerror/></span>

                <form id="registForm" method="post" action="${pageContext.request.contextPath}/user_regist.action">
                    <div class="height-75">
                        <span class="line-height-30 color-gray">用户名：</span>
                        <span id="userNameError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="username" name="username" type="text" placeholder="请输入用户名" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;" onblur="checkUsername()">
                    </div>

                    <div class="height-75">
                        <span class="line-height-30 color-gray">密码：</span>
                        <span id="passwordError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="password" name="password" type="password" placeholder="请输入密码" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                        <input id="pswHidden" type="hidden" name="pwd" />
                    </div>

                    <div class="height-75">
                        <span class="line-height-30 color-gray">确认密码：</span>
                        <span id="confirmPasswordError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="confirmPassword" type="password" placeholder="请输入确认密码" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                       <!--  <input id="pswHidden" type="hidden" name="pwd" /> -->
                    </div>

                    <div class="height-75">
                        <span class="line-height-30 color-gray">邮箱：</span>
                        <span id="emailError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="email" name="email" type="text" placeholder="请输入Email" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                    </div>

                    <div class="height-75">
                        <span class="line-height-30 color-gray">姓名：</span>
                        <span id="nameError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="name" name="name" type="text" placeholder="请输入姓名" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                    </div>

                    <div class="height-75">
                        <span class="line-height-30 color-gray">电话：</span>
                        <span id="phoneError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="phone" name="phone" type="text" placeholder="请输入电话" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                    </div>

                    <div class="height-75">
                        <span class="line-height-30 color-gray">地址：</span>
                        <span id="addrError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="addr" name="addr" type="text" placeholder="请输入地址" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                    </div>


                    <div id="readDiv" class="width-340 height-30 line-height-30 margin-bottom-10 font-12">
                        <input id="confirmInput" class="margin-right-5 vertical-middle" type="checkbox">
                        <font class="color-gray vertical-middle">我已阅读并同意</font><a class="blue margin-w-5 vertical-middle" href="javascript:void(0);" onclick="openRulePop();"><&nbsp;服务协议&nbsp;></a>
                        <span class="hidden margin-left-80 gray changecolororange link" onclick="openUrl('/forgetpass/1');">忘记密码？</span>
                    </div>

                    <div class="width-340 height-40 line-height-40 border-radius-5 text-center back-red changebackboldred color-white font-16 letter-spacing-5 link" onclick="registSubmit()">注册</div>

                </form>
            </div>
            <div class="clear"></div>
        </div>
    </div>
    
    <%@ include file="tradeRule.jsp"%>
    <%@ include file="foot.jsp"%>

	<script type="text/javascript">
		// 检验用户名是否存在
		function checkUsername(){
			var username = $('#username').val();
			if(isNull(username)){
				$('#userNameError').html('用户名不能为空');
				return;
			}
			
			$.ajax({
				url: ctxRoot + "/user_isExist.action",
				type: 'POST',
				data: {"checkUserName":username},
				dataType: "json",
				success: function(result){
					if(result.state){
						$('#userNameError').html(result.message);
					}
				},
				error: function(msg){
					return false;
				}
			});
		}
		
		// 提交
		function registSubmit(){
			$('#errorFlag').html('');
			
			var userName = $('#username').val();
			if(isNull(userName)){
				$('#userNameError').html('用户名不能为空');
				return;
			}
			$('#userNameError').html('');
			
			var password = $('#password').val();
			if(isNull(password)){
				$('#passwordError').html('密码不能为空');
				return;
			}
			$('#passwordError').html('');
			
			var confirmPassword = $('#confirmPassword').val();
			if(isNull(confirmPassword)){
				$('#confirmPasswordError').html('确认密码不能为空');
				return;
			}
			if(confirmPassword != password){
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
			
			var name = $('#name').val();
			if(isNull(name)){
				$('#nameError').html('姓名不能为空');
				return;
			}
			$('#nameError').html('');
			
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
			
			if(!$('#confirmInput').attr('checked')){
				alert('请阅读并同意协议！');
				return;
			}
			
			$('.errorFlag').html('');
			
			$('#registForm').submit();
		}
	</script>

</body>
</html>



	
