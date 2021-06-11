<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>商品详情</title>
</head>
<body>
	<%@ include file="top.jsp"%>

	<div class="width-1200 margin-auto-w padding-top-10">
		<div class="float-left width-420">
			<div id="productImg"  class="width-all height-530">
				<img src="${pageContext.request.contextPath }/<s:property value="model.image"/>" width="420" height="530"/>
			</div>
		</div>
		<input id="hidePid" value="<s:property value="model.pid"/>" type="hidden"/>
		<div class="float-right width-750 margin-top-30">
			<div class="line-height-40 font-18 font-minblack"><s:property value="model.pname"/></div>
			<div class="width-all back-mingray padding-h-20 margin-top-20">
				<div class="height-50 line-height-50">
					<span class="color-red margin-left-50">
						<span class="font-24">￥</span>
						<span class="font-48"><s:property value="model.shop_price"/></span>
					</span>
					<input id="hiddenPrice" type="hidden" value="<s:property value="model.shop_price"/>"/>
					<span class="font-16 margin-left-10 color-gray">
						￥
						<span class="text-through"><s:property value="model.market_price"/></span>
					</span>
					
					<span class="margin-left-50">上架时间：<s:property value="model.pdate"/></span>
				</div>
				<div class="width-150 height-30 line-height-30 margin-left-50 margin-top-20 border-radius-5 back-minred color-white font-16 text-center">
					限时促销
				</div>
			</div>
			
			<form id="cartForm" action="cart_addCart.action" method="post">
				<div class="height-40 line-height-40 margin-top-30 font-14">
					<input type="hidden" name="pid" value="<s:property value="model.pid"/>"/>
					<div class="float-left color-gray">购买数量</div>
					<div class="float-left margin-left-20">
						<div onclick="decrease()" class="float-left">
							<img src="${pageContext.request.contextPath }/image/decrease.png" class="border-solid-boldgray link" width="26" height="26" style="padding:2px 3px;"/>
						</div>
						<div class="float-left padding-w-10 margin-top-5 height-30 line-height-30 border-top-solid-boldgray border-bottom-solid-boldgray">
							<input onblur="calBuyerCount()" id="buyCount" name="count" value="1" class="color-gray font-12" style="text-align:center; width:30px;border:none;"/>
						</div>
						<div onclick="increase()" class="float-left">
							<img src="${pageContext.request.contextPath }/image/increase.png" class="border-solid-boldgray link" width="26" height="26" style="padding:2px 3px;"/>
						</div>
						<div class="clear"></div>
					</div>
					<div class="float-left margin-left-10 font-12 color-gray">每人限购10件，抓紧抢购吧！</div>
					<div class="clear"></div>
				</div>
			</form>
			
			<div class="height-40 line-height-40 margin-top-30 font-14">
				<div class="float-left color-gray">预计总额</div>
				<div class="float-left margin-left-20 font-italic">
					￥
					<span id="totalAmount" class="font-26"><s:property value="model.shop_price"/></span>
				</div>
				<div class="clear"></div>
			</div>
			
			<div class="width-all margin-top-60 font-18">
				<div onclick="saveCart()" class="width-130 margin-auto-w height-40 line-height-40 back-minred changebackred border-radius-5 color-white padding-w-15 link">
					<div class="float-left margin-top-4 itemCart"></div>
					<div class="float-right">加入购物车</div>
				</div>
			</div>
			
		</div>
	</div>
	<div class="clear"></div>
	
	<div class="width-1200 margin-auto-w padding-top-30">
		<div class="width-all height-40 margin-top-50 border-top-solid position-relative">
			<div class="width-all position-absolute text-center" style="top:-12px;">
				<span class="back-white padding-w-15 font-20 font-bold">
					<span>商品介绍</span>
					<span class="color-red">Introduction</span>
				</span>
			</div>
		</div>
		<div class="font-14 color-boldgray"><s:property value="model.pdesc"/></div>
	</div>
	<div class="width-1200 margin-auto-w padding-top-10">
		<div class="width-all height-40 margin-top-50 border-top-solid position-relative">
			<div class="width-all position-absolute text-center" style="top:-12px;">
				<span class="back-white padding-w-15 font-20 font-bold">
					<span>商品评价</span>
					<span class="color-red">Comment</span>
				</span>
			</div>
		</div>
		
		<div id="commentDiv"></div>
		
	</div>
	
	
	<%@ include file="foot.jsp"%>

	<script>
		$(function(){
			getCommentByPid();
		});
	
		// 查询商品评价
		function getCommentByPid(){
			var pid = $('#hidePid').val();
			
			$.ajax({
		        url: ctxRoot + "/comment_findByPagePid.action",
		        type: 'post',
		        data: {"pid": pid, "page": 1},
		        dataType: "json",
		        success: function (result) {
		            if (result != null) {
		            	var str = '';
		            	var list = result.pageBean.proList;
		            	if(list != null && list.length > 0){
		            		for(var i = 0, len = list.length; i < len; i++){
			            		str += '<div class="padding-h-5 margin-bottom-10 border-dashed border-radius-3">'+
					            			'<div class="height-30 line-height-30 padding-w-20">'+
							    				'<span class="color-blue font-14">'+ list[i].userName +'</span>'+
							    				'<span class="margin-left-5 color-gray font-12">'+ list[i].createTime +'</span>'+
							    				'<span class="margin-left-50 color-red font-14 font-bold">'+ list[i].stars +'分</span>'+
							    			'</div>'+
							    			'<div class="padding-w-40 line-height-25 color-gray font-13">'+ list[i].content +'</div>'+
							    		'</div>';
		            		}
		            	} else {
		            		str += '<div class="width-all text-center padding-h-20 color-gray font-14">暂无评论</div>';
		            	}
		            	$('#commentDiv').html(str);
		            } else {
		            	$('#commentDiv').html('<div class="width-all text-center padding-h-20 color-gray font-14">暂无评论</div>');
		                return;
		            }
		        },
		        error: function (result) {
		            return false;
		        }
		    });
		}
		
		function calBuyerCount(){
			var count = $('#buyCount').val();
			if(count < 1){
				alert("商品数量不能小于1");
				$('#buyCount').val(1);
				calTotalAmount();
				return;
			}
			if(count > 10){
				alert("该商品数量限购10件");
				$('#buyCount').val(10);
				calTotalAmount();
				return;
			}
			calTotalAmount();
		}
		
		function increase(){
			var buyCount = $('#buyCount').val();
			if(buyCount >= 10){
				alert("该商品数量限购10件");
				return;
			}
			
			buyCount ++;
			$('#buyCount').val(buyCount);
			calTotalAmount();
		}
		
		function decrease(){
			var buyCount = $('#buyCount').val();
			if(buyCount > 1){
				buyCount --;
			} else{
				alert("商品数量不能小于1");
			}
			$('#buyCount').val(buyCount);
			calTotalAmount();
		}
		
		function calTotalAmount(){
			var totalAmount;
			var price = $('#hiddenPrice').val();
			var num = $('#buyCount').val();
			$('#totalAmount').html(eval(price * num));
		}
		
	
		function saveCart(){
			document.getElementById("cartForm").submit();
		}
		
	</script>
</body>
</html>