<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>

	<meta http-equiv="Content-Language" content="zh-cn">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/table.css" />
	
	<script type="text/javascript">
		var ctxRoot = '${pageContext.request.contextPath }';
	</script>
	
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.8.3.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/valid.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
	
</head>
<body style="background:url(${pageContext.request.contextPath}/admin/images/bg-admin.jpg) repeat;">
	<div id="layout-shadow" class="hidden" style="width:100%; height:100%; position:fixed; z-index:1000; background:#000000; top:0px; filter:alpha(opacity=50); -moz-opacity:0.5; -khtml-opacity:0.5; opacity:0.5;"></div>
	<div class="width-900 margin-auto-w padding-top-40">
		<div class="height-40 line-height-40 color-white text-center font-bold font-16">订单列表</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab" class="margin-top-10">
			<tr>
			  <th align="center" valign="middle" class="borderright">编号</th>
			  <th align="center" valign="middle" class="borderright">订单编号</th>
			  <th align="center" valign="middle" class="borderright">总金额</th>
			  <th align="center" valign="middle" class="borderright">收货人</th>
			  <th align="center" valign="middle" class="borderright">订单状态</th>
			  <th align="center" valign="middle">操作</th>
			</tr>
			<s:iterator var="order" value="pageBean.proList" status="status">
				<tr id="currItem-<s:property value="#order.oid"/>" class="item changebackmingray">
					<td align="center" valign="middle" class="borderright borderbottom">
						<s:property value="#status.count"/>
					</td>
		        	<td align="center" valign="middle" class="borderright borderbottom">
		        		<s:property value="#order.oid"/>
		        	</td>
		        	<td align="center" valign="middle" class="borderright borderbottom">
		        		<s:property value="#order.total"/>
		        	</td>
		        	<td align="center" valign="middle" class="borderright borderbottom">
		        		<s:property value="#order.name"/>
		        	</td>
		        	<td align="center" valign="middle" class="borderright borderbottom">
		        		<s:if test="#order.state==1">未下单</s:if>
						<s:if test="#order.state==2">
							<span onclick="openUrl('/adminorder_updateState.action?oid=<s:property value="#order.oid"/>');" class="back-red changebackboldred color-white border-radius-3 link" style="padding:5px 15px;">发货</span>
						</s:if>
						<s:if test="#order.state==3">
							<span class="color-orange">未确认收货</span>
						</s:if>
						<s:if test="#order.state==4">
							<span class="color-green">交易完成</span>
						</s:if>
		        	</td>
		        	
		        	<td align="center" valign="middle" class="borderbottom">
		        		<button onclick="showDetail(<s:property value="#order.oid"/>)" type="button" class="width-70 height-30 line-height-28 font-yahei border-none border-radius-3 back-blue color-white link">订单详情</button>
		        	</td>
				</tr>
			</s:iterator>
    	</table>
    	
    	<!-- 分页 -->
		<s:if test="pageBean.pageCount > 0">
			<div class="width-all height-40 line-height-40 padding-h-20 back-white color-boldgray font-13 text-center">
				<span class="margin-right-5">
					第<s:property value="pageBean.page"/>/<s:property value="pageBean.pageCount"/>页
				</span>
				
				<s:if test="pageBean.page == 1">
					<span class="color-gray padding-w-2">首页</span>
					<span class="color-gray padding-w-2">上一页</span>
				</s:if>
				<s:else>
					<span onclick="openUrl('/adminorder_findAll.action?page=1')" class="padding-w-2 color-boldgray changecolorred link">首页</span>
					<span onclick="openUrl('/adminorder_findAll.action?page=<s:property value="pageBean.page-1"/>')" class="padding-w-2 color-boldgray changecolorred link">上一页</span>
				</s:else>
				
				<s:iterator end="pageBean.pageCount" var="p" begin="1">
					<s:if test="pageBean.page == #p">
						<span class="color-red border-solid-red" style="padding:2px 6px;"><s:property value="#p"/></span>
					</s:if>
					<s:else>
						<span onclick="openUrl('/adminorder_findAll.action?page=<s:property value="#p"/>')" class="border-solid changecolorred changeborderred link" style="padding:2px 6px;"><s:property value="#p"/></span>
					</s:else>
				</s:iterator>
					
				<s:if test="pageBean.page == pageBean.pageCount">
					<span class="color-gray padding-w-2">下一页</span>
					<span class="color-gray padding-w-2">尾页</span>
				</s:if>
				<s:else>
					<span onclick="openUrl('/adminorder_findAll.action?page=<s:property value="pageBean.page+1"/>')" class="padding-w-2 color-boldgray changecolorred link">下一页</span>
					<span onclick="openUrl('/adminorder_findAll.action?page=<s:property value="pageBean.pageCount"/>')" class="padding-w-2 color-boldgray changecolorred link">尾页</span>
				</s:else>
			</div>
		</s:if>
    	
	</div>

	<%@include file="layout.jsp" %>
	
	<script>
		function showDetail(oid){
			
			$('.item').removeClass('back-mingray');
			$('#currItem-' + oid).addClass('back-mingray');
			
			//1.创建异步交互对象
			var xmlhttp = ajaxFunction();
			//2.设置监听
			xmlhttp.onreadystatechange=function(){
			  if (xmlhttp.readyState==4 && xmlhttp.status==200){
				  $('#orderDetailDiv').html(xmlhttp.responseText);
				  openDetail();
			    }
			};
			//3.打开连接
			xmlhttp.open("GET","${pageContext.request.contextPath}/adminorder_findOrderItem.action?time="+new Date().getTime()+"&oid="+oid,true);
			//4.发送
			xmlhttp.send(null);
			
		}
		
		function ajaxFunction(){
			var xmlhttp;
			if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
			  	xmlhttp=new XMLHttpRequest();
			} else {// code for IE6, IE5
			  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
			}
			return xmlhttp;
		}
	</script>
</body>
</html>

