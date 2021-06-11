<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>购物车</title>
	<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@ include file="top.jsp"%>
	<div class="container cart min-height-300">
		<s:if test="#session.cart.cartItems.size() != 0">
			<div class="width-all margin-top-40">
				<table>
					<tbody>
						<tr class="color-boldgray height-40 line-height-40 font-14">
							<td class="text-center">图片</td>
							<td>
								<span class="padding-left-10">商品</span>
							</td>
							<td class="text-center">价格</td>
							<td class="text-center">数量</td>
							<td class="text-center">小计</td>
							<td class="text-center">操作</td>
						</tr>
						<s:iterator value="#session.cart.cartItems" var="cartItem">
							<tr class="color-gray changebackmingray">
								<td width="100" class="text-center">
									<img src="${pageContext.request.contextPath}/<s:property value="#cartItem.product.image"/>"/>
								</td>
								<td>
									<span class="padding-left-10"><s:property value="#cartItem.product.pname"/></span>
								</td>
								<td class="text-center">
									￥<s:property value="#cartItem.product.shop_price"/>
								</td>
								<td class="text-center" width="60">
									<s:property value="#cartItem.count"/>
								</td>
								<td class="text-center" width="140">
									￥<s:property value="#cartItem.subtotal"/>
								</td>
								<td class="text-center" width="60">
									<a href="cart_removeCart.action?pid=<s:property value="#cartItem.product.pid"/>" class="blue">删除</a>
								</td>
							</tr>
						</s:iterator>
					</tbody>
				</table>
				
				<div class="height-40 line-height-40 text-right font-14">
					<span class="color-gray">金额总计：</span>
					<span class="padding-w-5 font-bold color-red font-20">￥<s:property value="#session.cart.total"/></span>
					<span class="color-gray">元</span>
				</div>
				
				<div class="width-200 float-right padding-top-30">
					<div onclick="clearCart()" class="float-left width-90 height-30 line-height-30 back-gray changebackboldgray color-white text-center border-radius-3 link">清空购物车</div>
					<div onclick="openUrl('/order_save.action')" class="float-right width-90 height-30 line-height-30 back-minred changebackboldred color-white text-center border-radius-3 link">提交订单</div>
				</div>
			</div>
		</s:if>
		<s:else>
			<div class="iconNone" style="bottom:0px; margin:80px auto"></div>
		</s:else>
		
	</div>
	
	<%@ include file="foot.jsp"%>
	
	<script type="text/javascript">
		function clearCart(){
			if(confirm('是否清空购物车?')){
				openUrl('/cart_clearCart.action');
			}
		}
	</script>
	
</body>
</html>