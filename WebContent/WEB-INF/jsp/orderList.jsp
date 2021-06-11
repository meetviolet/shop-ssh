<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>订单列表</title>
	<link href="${pageContext.request.contextPath}/css/cart.css" rel="stylesheet" type="text/css"/>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.raty.js"></script>
</head>
<body>

	<div id="layout-shadow" class="hidden" style="width:100%; height:100%; position:fixed; z-index:1000; background:#000000; top:0px; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity:0.5; opacity:0.5;"></div>
	
	<%@ include file="top.jsp"%>

	<div class="container cart">
		
		<div class="width-all height-40 margin-top-50 border-top-solid position-relative">
			<div class="width-all position-absolute text-center" style="top:-12px;">
				<span class="back-white padding-w-15 font-20 font-bold">
					<span>订单列表</span>
					<span class="color-red">OrderList</span>
				</span>
			</div>
		</div>
		
		<div class="width-all margin-top-20">
			<table>
				<tbody>
					<s:iterator value="pageBean.proList" var="order">
						<tr class="height-40 line-height-40 font-14">
							<th colspan="6">
								<span class="font-bold color-minblack">订单编号：</span>
								<span class="color-boldgray"><s:property value="#order.oid"/></span>
								
								<span class="margin-left-10 font-bold color-minblack">订单状态：</span>
								<span>
									<s:if test="#order.state == 1">
										<span onclick="openUrl('/order_findByOid.action?oid=<s:property value="#order.oid"/>')" class="changebackred color-red changecolorwhite border-solid-red border-radius-3 link" style="padding:3px 5px;">待下单</span>
									</s:if>
									<s:if test="#order.state == 2">
										<span class="color-blue">已下单</span>
									</s:if>
									<s:if test="#order.state == 3">
										<span onclick="openUrl('/order_updateState.action?oid=<s:property value="#order.oid"/>')" class="changebackorange color-orange changecolorwhite border-solid-orange border-radius-3 link" style="padding:3px 5px;">确认收货</span>
									</s:if>
									<s:if test="#order.state == 4">
										<span class="color-green">交易完成</span>
									</s:if>
								</span>
							</th>
						</tr>
						
						<tr class="color-boldgray height-35 line-height-35 font-13">
							<td class="text-center">图片</td>
							<td>
								<span class="padding-left-10">商品</span>
							</td>
							<td class="text-center">价格</td>
							<td class="text-center">数量</td>
							<td class="text-center">小计</td>
							<td class="text-center">操作</td>
						</tr>
						
						<s:iterator value="#order.orderItems" var="orderItem">
							<tr class="color-gray changebackmingray">
								<td width="100" class="text-center">
									<img src="${pageContext.request.contextPath}/<s:property value="#orderItem.product.image"/>"/>
								</td>
								<td>
									<span onclick="openUrl('/product_findByPid.action?pid=<s:property value="#orderItem.product.pid"/>')" class="padding-left-10 changecolorblue link"><s:property value="#orderItem.product.pname"/></span>
								</td>
								<td class="text-center">
									￥<s:property value="#orderItem.product.shop_price"/>
								</td>
								<td class="text-center" width="60">
									<s:property value="#orderItem.count"/>
								</td>
								<td class="text-center" width="140">
									￥<s:property value="#orderItem.subtotal"/>
								</td>
								<td class="text-center" width="140">
									<s:if test="#order.state == 4">
										<span onclick="openComment(<s:property value="#orderItem.product.pid"/>)" class="changebackblue color-blue changecolorwhite border-solid-blue border-radius-3 link" style="padding:3px 5px;">评价商品</span>
									</s:if>
									<s:else>
										--
									</s:else>
								</td>
							</tr>
						</s:iterator>
						
					</s:iterator>
					
					<s:if test="#pageBean.pageCount == 0">
						<div class="iconNone" style="margin:50px auto;"></div>
					</s:if>
				
				</tbody>
			</table>
			
			<!-- 分页 -->
			<s:if test="pageBean.pageCount > 0">
				<div class="width-all height-40 line-height-40 padding-h-20 color-boldgray font-13 text-center">
					<span class="margin-right-5">
						第<s:property value="pageBean.page"/>/<s:property value="pageBean.pageCount"/>页
					</span>
				
					<s:if test="pageBean.page == 1">
						<span class="color-gray padding-w-2">首页</span>
						<span class="color-gray padding-w-2">上一页</span>
					</s:if>
					<s:else>
						<span onclick="openUrl('/order_findByUid?page=1')" class="padding-w-2 color-boldgray changecolorred link">首页</span>
						<span onclick="openUrl('/order_findByUid?page=<s:property value="pageBean.page-1"/>')" class="padding-w-2 color-boldgray changecolorred link">上一页</span>
					</s:else>
					
					<span class="padding-w-5">
						<s:iterator end="pageBean.pageCount" var="p" begin="1">
							<s:if test="pageBean.page == #p">
								<span class="color-red border-solid-red" style="padding:2px 6px;"><s:property value="#p"/></span>
							</s:if>
							<s:else>
								<span onclick="openUrl('/order_findByUid?page=<s:property value="#p"/>')" class="border-solid changecolorred changeborderred link" style="padding:2px 6px;"><s:property value="#p"/></span>
							</s:else>
						</s:iterator>
					</span>
					
						
					<s:if test="pageBean.page == pageBean.pageCount">
						<span class="color-gray padding-w-2">下一页</span>
						<span class="color-gray padding-w-2">尾页</span>
					</s:if>
					
					<s:else>
						<span onclick="openUrl('/order_findByUid?page=<s:property value="pageBean.page+1"/>')" class="padding-w-2 color-boldgray changecolorred link">下一页</span>
						<span onclick="openUrl('/order_findByUid?page=<s:property value="pageBean.pageCount"/>')" class="padding-w-2 color-boldgray changecolorred link">尾页</span>
					</s:else>
				</div>
			</s:if>
			
		</div>
	</div>
	
	<div id="commentLayout" class="hidden" style="width:100%; min-height:200px; height:auto; position:fixed; top:20%; z-index:1001;">
		<div style="width:800px; min-height:60px; max-height:500px; margin:0 auto; background:#ffffff; border-radius:8px; border:1px solid #e2e2e2;">
			<div class="width-all height-40 line-height-40 padding-h-5 border-bottom-solid">
				<div class="float-left width-430 text-right font-16 font-bold color-black">添加评价</div>
				<div onclick="closeComment()" class="float-right width-50 text-center color-gray font-12 link">关闭</div>
			</div>
			<div id="productDetailDiv" class="padding-w-10 min-height-300 max-height-400 overflow-ya">
				<div class="width-all height-100 text-center">
					<img id="productImage" class="width-100 height-100" style="border-radius:50%;"/>
					<span id="productName" class="margin-left-30 line-height-100 font-bold font-20 color-boldgray"></span>
				</div>
				
				<div class="width-720 padding-h-20 margin-auto-w">
					<div class="float-left width-100 line-height-24">请为商品评分：</div>
					<div class="float-left width-500">
						<div id="star"></div>
						<input id="result" type="hidden"/>
					</div>
				</div>
				
				<div class="width-all height-75 margin-top-20 text-center">
					<textarea id="productContent" class="width-700 padding-10 height-50 border-radius-5 border-solid font-yahei" placeholder="请输入您的评价"></textarea>
				</div>
				<div class="width-all margin-top-10 text-right">
					<span onclick="addComment();" class="back-red changebackboldred color-white border-radius-5 margin-right-30 line-height-30 font-14 link" style="padding:10px 20px;">提交</span>
				</div>
				
			</div>
		</div>
	</div>
	<script>
		var currPid;
		function openComment(pid){
			getProductById(pid);
			currPid = pid;
		}
		function closeComment(){
			$('#layout-shadow').addClass('hidden');
			$('#commentLayout').addClass('hidden');
		}
		
		function rat(star,result,m){
			star= '#' + star;
			result= '#' + result;
			$(result).hide();//将结果DIV隐藏

			$(star).raty({
				hints: ['10','20', '30', '40', '50','60', '70', '80', '90', '100'],
				path: ctxRoot + "/image",
				starOff: 'star-off-big.png',
				starOn: 'star-on-big.png',
				size: 24,
				start: 40,
				showHalf: true,
				target: result,
				targetKeep : true,//targetKeep 属性设置为true，用户的选择值才会被保持在目标DIV中，否则只是鼠标悬停时有值，而鼠标离开后这个值就会消失
				click: function (score, evt) {
					$(result).val(score*m);
				}
			});
		}
		
		function getProductById(pid){
			$.ajax({
		        url: ctxRoot + "/product_findById",
		        type: 'post',
		        data: {"pid": pid},
		        dataType: "json",
		        success: function (result) {
		            if (result != null) {
		                var model = result.product;
		                $('#productImage').attr("src", model.image);
		                $('#productName').html(model.pname);
		                
		                $('#layout-shadow').removeClass('hidden');
		    			$('#commentLayout').removeClass('hidden');
		    			rat('star','result',1);
		            } else {
		                alert('商品详情查询失败！');
		                return;
		            }
		        },
		        error: function (result) {
		            return false;
		        }
		    });
		}
		function addComment(){
			var stars = $('#result').val();
			if(isNull(stars + '')){
				alert('请选择评分后再提交哦~');
				return;
			}
			var content = $('#productContent').val();
			if(isNull(content)){
				alert('请输入评价后再提交哦~');
				return;
			}
			$.ajax({
		        url: ctxRoot + "/comment_addComment.action",
		        type: 'post',
		        data: {"product.pid":currPid, "content":content, "stars":stars},
		        dataType: "json",
		        success: function (result) {
		            if (result != null) {
		            	alert('商品评论添加成功！');
		            	window.location.reload();
		            } else {
		                alert('商品详情查询失败！');
		                return;
		            }
		        },
		        error: function (result) {
		            return false;
		        }
		    });
		}
		
	</script>
	
	<%@ include file="foot.jsp"%>
	
</body>
</html>