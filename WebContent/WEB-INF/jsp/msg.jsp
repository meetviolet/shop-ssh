<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>消息提示</title>
</head>
<body>
<div id="divcontent">
    <div class="width-500 border-dashed-999 border-radius-5 padding-40" style="margin:100px auto;">
    	<s:if test="hasActionErrors()">
    		<div class="errorPng margin-auto-w"></div>
    	</s:if>
    	<s:if test="hasActionMessages()">
    		<div class="successPng margin-auto-w"></div>
    	</s:if>
		
		<div class="width-500 margin-auto-w">
			<div class="padding-h-30 text-center color-boldgray font-bold font-24">
				<s:actionmessage/>
		        <s:actionerror/>
			</div>
			<div class="width-all height-40 line-height-40 font-18">
			 	<div onclick="openUrl('/index.action')" class="float-left width-150 text-center font-18 color-white back-red changebackboldred border-radius-5 link">返回首页</div>
			 	<div onclick="openUrl('/user_registPage.action')" class="float-left width-150 margin-left-25 margin-right-25 text-center font-18 color-white back-red changebackboldred border-radius-5 link">注册</div>
			 	<div onclick="openUrl('/user_loginPage.action')" class="float-left width-150 text-center font-18 color-white back-red changebackboldred border-radius-5 link">登录</div>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<%@ include file="foot.jsp"%>
</div>
</body>
</html>