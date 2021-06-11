<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ page import="java.util.Calendar"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>会员登录</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/login.css" />
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/base.css" />
</head>
<body style="overflow:hidden;">

   	<div id="layout-shadow" class="layout-shadow hidden"></div>
    
    <div class="login">
        <div class="loginContent">
        
        	<div class="padding-h-40">
	        	<div onclick="openUrl('/index.action');" class="float-left img-logo link"></div>
				<div class="float-right img-zhengPin"></div>
				<div class="clear"></div>
        	</div>
			

			<div class="float-left padding-top-25 login-leftPic"></div>
            <div class="float-right loginDiv">
                <div class="width-340 height-35 line-height-30">
                    <div class="float-left width-4 height-18 margin-top-6 margin-right-10 back-boldorange"></div>
                    <div class="float-left font-bold font-16 color-boldorange">会员登录</div>
                    <div id="toResendDiv" class="float-right font-12 color-gray">还没有账号？<a class="orange font-12" href="${pageContext.request.contextPath}/user_registPage.action">立即注册</a></div>
                    <div id="toLoginDiv" class="float-right font-12 color-gray hidden"><a class="lightblue font-12" href="#" onclick="changeToLogin();return false;">返回登录</a></div>
                    <div class="clear"></div>
                </div>

                <span class="errorFlag font-12 color-red"><s:actionerror/></span>

                <form id="loginForm" method="post" action="${pageContext.request.contextPath}/user_login.action">
                    <div class="height-75">
                        <span class="line-height-30 color-gray">用户名：</span>
                        <span id="userNameError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="username" name="username" value="${code}" type="text" placeholder="请输入用户名" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                    </div>

                    <div class="height-75">
                        <span class="line-height-30 color-gray">密码：</span>
                        <span id="passwordError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                        <input id="password" name="password" type="password" placeholder="请输入密码" style="width:330px; height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                        <input id="pswHidden" type="hidden" name="pwd" />
                    </div>

                    <div class="height-75">
                    	<div class="line-height-30 color-gray">
	                    	验证码：
	                    	<span id="codeError" class="errorFlag margin-left-10 line-height-30 color-red font-12"></span>
                    	</div>
                        <div class="float-left">
                            <input id="code" name="checkcode" type="text" placeholder="请输入验证码" style="width:205px;height:40px; line-height:40px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
                        </div>
                        <div class="float-left margin-left-15"> <img class="width-105 height-42 border-none border-radius-5 link" title="看不清，换一张" src="${pageContext.request.contextPath }/checkImg.action?date=<%=Calendar.getInstance().getTimeInMillis() %>" onclick="javascript:this.src=this.src+'?rnd=' + Math.random();" />
                        </div>
                        <div class="clear"></div>
                    </div>

                    <div id="readDiv" class="width-340 height-30 line-height-30 margin-bottom-10 font-12">
                        <input id="confirmInput" class="margin-right-5 vertical-middle" type="checkbox" checked="checked">
                        <font class="color-gray vertical-middle">我已阅读并同意</font><a class="blue margin-w-5 vertical-middle" href="javascript:void(0);" onclick="openRulePop()"><&nbsp;服务协议&nbsp;></a>
                        <span class="hidden margin-left-80 gray changecolororange link" onclick="openUrl('/forgetpass/1');">忘记密码？</span>
                    </div>

                    <div class="width-340 height-40 line-height-40 border-radius-5 text-center back-red changebackboldred color-white font-16 letter-spacing-5 link" onclick="loginSubmit()">登录</div>

                </form>
            </div>
        </div>
    </div>
    
    <%@ include file="tradeRule.jsp"%>
    <%@ include file="foot.jsp"%>

	<script type="text/javascript">
		
		// 更换验证码
		function change() {
			var checkImg1 = document.getElementById("checkImg");
			checkImg1.src = "checkImg.action?time=" + new Date().getTime();
		}
		
		// 提交
		function loginSubmit(){
			var userName = $('#username').val();
			if(isNull(userName)){
				$('#userNameError').html('用户名不能为空');
				return;
			}
			
			var password = $('#password').val();
			if(isNull(password)){
				$('#passwordError').html('密码不能为空');
				return;
			}
			
			var code = $('#code').val();
			if(isNull(code)){
				$('#codeError').html('验证码不能为空');
				return;
			}
			
			if(!$('#confirmInput').attr('checked')){
				alert('请阅读并同意协议！');
				return;
			}
			
			$('.errorFlag').html('');
			$('#loginForm').submit();
		}
	</script>

</body>
</html>



	
