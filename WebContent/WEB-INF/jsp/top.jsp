<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!-- 遮罩层 -->
<div id="layout-shadow" class="hidden" style="width:100%; height:100%;position:fixed; z-index:1000; background:#000000; top:0px; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity:0.5; opacity:0.5;}"></div>

<div class="width-all height-35 back-mingray">
	<div class="width-1200 margin-auto-w text-right line-height-35 color-boldgray font-12">
		<div class="float-right margin-left-30">
			<div class="img-phone">
			客服热线:
			<strong>12345678910</strong>
		</div>
		</div>
		<div class="float-right">
			<s:if test="#session.existUser==null">
				<a href="user_loginPage.action" class="gray">登录</a>
				<span class="padding-w-10">/</span>
				<a href="user_registPage.action" class="gray">注册</a>
			</s:if>
			<s:else>
				<span>尊敬的：</span>
				<span class="color-minred"><s:property value="#session.existUser.username" /></span>
				<span>先生/女士</span>
				
				<span class="padding-w-10">/</span>
				<a href="user_quit.action" class="boldgray">退出</a>
				<span class="padding-w-10">/</span>
				<a href="order_findByUid.action?page=1" class="boldgray">我的订单</a>
				<span class="padding-w-10">/</span>
				<a href="javascript:void(0)" onclick="openUrl('/user_centerPage.action');" class="boldgray">会员中心</a>
			</s:else>
			<span class="padding-w-10">/</span>
			<a href="javascript:void(0)" onclick="openUrl('/user_aboutPage.action');" class="boldgray">联系我们</a>
		</div>
		<div class="clear"></div>
	</div>
</div>


<div class="width-1200 margin-auto-w">
	<div class="width-all height-60 padding-bottom-30">
		<div onclick="openUrl('/index.action');" class="float-left img-logo link"></div>
		<div class="float-left img-zhengPin"></div>
		
		<div onclick="openUrl('/cart_goCart.action');" class="float-right margin-top-30 line-height-28 color-boldgray changebackmingray border-solid border-radius-3 link" style="padding:5px 15px 5px 10px;">
			<div class="float-left img-cart"></div>
			<span class="float-left">购物车</span>
		</div>
		<div class="float-right margin-top-30 margin-right-80 line-height-28 color-boldgray" style="padding:5px 15px 5px 10px;">
			<div class="float-left padding-right-10 line-height-30">搜索：</div>
			<input  onchange="searchAll(this)" value="<s:property value="searchName"/>" placeholder="输入商品名称模糊搜索" class="width-200 padding-left-10 height-30 line-height-30 border-solid border-radius-3 color-boldgray font-yahei" />
		</div>
		
		<div class="clear"></div>
	</div>
</div>

<div class="width-all height-40 line-height-40 font-14" style="background:#1d1d1d;">
	<div class="width-1200 margin-auto-w color-white">
		<span onclick="openUrl('/index.action')" class="changeback50 link" style="padding:12px 25px;">首页</span>
		<s:iterator value="#session.cList" var="c" status="s">
			<s:if test="#s.index < 10">
				|
				<span onclick="openUrl('/product_findByPageCid?cid=<s:property value="#c.cid"/>&page=1')" class="changeback50 link" style="padding:12px 25px;"><s:property value="#c.cname"/></span>
			</s:if>
		</s:iterator>
	</div>
</div>

<script type="text/javascript">
	function searchAll(obj){
		if($(obj).val() != 0){
			openUrl('/product_findByPname?pname='+ encodeURI(encodeURI($(obj).val())) +'&page=1');
		}
	}
</script>
