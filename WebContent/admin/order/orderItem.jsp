<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<div class="padding-w-30 margin-top-10 line-height-30 font-14">
	<div>
		<span class="color-gray">收货人信息：</span>
		<span class="font-bold color-boldgray font-16">
			<s:property value="orderDetail.name"/>
			(<s:property value="orderDetail.phone"/>)
		</span>
	</div>
	<div>
		<span class="color-gray">收货地址：</span>
		<span class="font-bold color-boldgray font-16">
			<s:property value="orderDetail.addr"/>
		</span>
	</div>
</div>

<table class="width-all border-solid margin-h-15">
	<tr class="font-14 height-35 line-height-35 border-bottom-solid color-boldgray">
		<th align="center" valign="middle" class="borderright">商品图片</th>
	  	<th align="center" valign="middle" class="borderright">商品数量</th>
	  	<th align="center" valign="middle" class="borderright">总金额（元）</th>
	</tr>
	<s:iterator value="list" var="orderItem">
		<tr class="border-bottom-solid">
			<td align="center" valign="middle" class="borderright">
				<img width="40" height="45" src="<s:property value="#orderItem.product.image"/>"/>
			</td>
		  	<td align="center" valign="middle" class="borderright">
		  		<s:property value="#orderItem.count"/>
		  	</td>
		  	<td align="center" valign="middle" class="borderright">
		  		<s:property value="#orderItem.subtotal"/>
		  	</td>
		</tr>
	</s:iterator>
</table>
			