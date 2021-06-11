<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>订单页面</title>
	<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<%@ include file="top.jsp"%>

	<div class="container cart">

		<div class="width-all height-40 margin-top-50 border-top-solid position-relative">
			<div class="width-all position-absolute text-center" style="top:-12px;">
				<span class="back-white padding-w-15 font-20 font-bold">
					<span>订单详情</span>
					<span class="color-red">OrderDetail</span>
				</span>
			</div>
		</div>
		
		<div class="width-all margin-top-20">
			<table>
				<tbody>
					<s:iterator value="model.orderItems" var="orderItem">
						<tr class="color-boldgray back-mingray height-35 line-height-35 font-13">
							<td>
								<span class="padding-left-10">订单编号</span>
							</td>
							<td class="text-center">图片</td>
							<td>
								<span class="padding-left-10">商品</span>
							</td>
							<td class="text-center">数量</td>
							<td class="text-center">价格</td>
							<td class="text-center">小计</td>
						</tr>
						
						<tr class="color-gray changebackmingray">
							<td>
								<span class="padding-left-10"><s:property value="model.oid"/></span>
							</td>
							<td width="100" class="text-center">
								<img src="${pageContext.request.contextPath}/<s:property value="#orderItem.product.image"/>"/>
							</td>
							<td>
								<span class="padding-left-10"><s:property value="#orderItem.product.pname"/></span>
							</td>
							<td class="text-center" width="60">
								<s:property value="#orderItem.count"/>
							</td>
							<td class="text-center">
								￥<s:property value="#orderItem.product.shop_price"/>
							</td>
							<td class="text-center" width="140">
								￥<s:property value="#orderItem.subtotal"/>
							</td>
						</tr>
					</s:iterator>
				</tbody>
			</table>
			
			<div class="height-40 line-height-40 text-right font-14">
				<span class="color-gray">金额总计：</span>
				<span class="padding-w-5 font-bold color-red font-20">￥<s:property value="model.total"/></span>
				<span class="color-gray">元</span>
			</div>
			
		</div>
		
		<div class="width-500 margin-auto-w border-dashed" style="padding:20px 20px 20px 30px;">
			<form id="orderForm" action="order_payOrder.action" method="post">
				<input type="hidden" name="oid" value="<s:property value="model.oid"/>"/>
				
				<div class="width-all font-14">
					<div class="width-all padding-h-10">
						<div class="float-left width-80 height-35 line-height-35">收货地址：</div>
						<div class="float-left height-35 line-height-35">
							<input id="addr" name="addr" type="text" value="<s:property value="model.user.addr"/>" style="width:400px; height:30px; line-height:30px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
						</div>
						<div class="clear"></div>						
					</div>
					<div class="width-all padding-h-10">
						<div class="float-left width-80 height-35 line-height-35">收货人：</div>
						<div class="float-left height-35 line-height-35">
							<input id="name" name="name" type="text" value="<s:property value="model.user.name"/>" style="width:400px; height:30px; line-height:30px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
						</div>
						<div class="clear"></div>
					</div>
					<div class="width-all padding-h-10">
						<div class="float-left width-80 height-35 line-height-35">联系方式：</div>
						<div class="float-left height-35 line-height-35">
							<input id="phone" name="phone" type="text" value="<s:property value="model.user.phone"/>" style="width:400px; height:30px; line-height:30px; padding-left:10px; border:1px solid #dbdbdb; border-radius:5px;">
						</div>
						<div class="clear"></div>
					</div>
				</div>
			</form>
		</div>
		<div id="errorMsg" class="color-red text-center font-12 padding-h-15"></div>
		<div class="width-all">
			<div onclick="confirmOrder()" class="float-right width-120 height-40 line-height-40 back-red changebackboldred border-radius-3 color-white font-14 text-center link">
				确认订单
			</div>
			<div class="clear"></div>
		</div>
		
	</div>
	
	<%@ include file="foot.jsp"%>
	
	<script type="text/javascript">
		function confirmOrder(){
			var addr = $('#addr').val();
			if(isNull(addr)){
				$('#errorMsg').html('请填写联系地址');
				return;
			}
			
			var name = $('#name').val();
			if(isNull(name)){
				$('#errorMsg').html('请填写联系人');
				return;
			}
			
			var phone = $('#phone').val();
			if(isNull(phone)){
				$('#errorMsg').html('请填写联系方式');
				return;
			}
			if(!isPhone){
				$('#errorMsg').html('联系方式格式错误');
				return;
			}
			
			$('#errorMsg').html('');	
			
			if(confirm('是否确认订单？')){
				$('#orderForm').submit();
			}
		}
	</script>
	
</body>
</html>