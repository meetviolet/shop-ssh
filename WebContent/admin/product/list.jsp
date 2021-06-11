<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
	
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
	<div class="width-900 margin-auto-w padding-top-40">
		<div class="height-40 line-height-40 color-white text-center font-bold font-16">商品管理</div>
		<div class="height-30 line-height-30 margin-top-30 text-right font-14">
			<span onclick="openUrl('/adminproduct_addPage.action')" class="back-orange color-white changebackboldorange border-radius-3 link" style="padding:5px 10px;">添加商品</span>
		</div>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab" class="margin-top-10">
			<tr>
			  <th align="center" valign="middle" class="borderright">编号</th>
			  <th align="center" valign="middle" class="borderright">商品图片</th>
			  <th align="center" valign="middle" class="borderright">商品名称</th>
			  <th align="center" valign="middle" class="borderright">商品价格</th>
			  <th align="center" valign="middle" class="borderright">是否热门</th>
			  <th align="center" valign="middle">操作</th>
			</tr>
			<s:iterator var="p" value="pageBean.proList" status="status">
				<tr class="changebackmingray">
					<td align="center" valign="middle" class="borderright borderbottom">
						<s:property value="#status.count"/>
					</td>
		        	<td align="center" valign="middle" class="borderright borderbottom">
		        		<img alt="商品图片" width="40" height="45" src="${pageContext.request.contextPath }/<s:property value="#p.image"/>">
		        	</td>
		        	<td align="center" valign="middle" class="borderbottom">
		        		<s:property value="#p.pname" />
		        	</td>
		        	<td align="center" valign="middle" class="borderbottom">
		        		<s:property value="#p.shop_price" />
		        	</td>
		        	<td align="center" valign="middle" class="borderbottom">
		        		<s:if test="#p.is_hot==1">是</s:if>
		        		<s:else>否</s:else>
		        	</td>
		        	
		        	<td align="center" valign="middle" class="borderbottom">
	        			<a href="${pageContext.request.contextPath}/adminproduct_edit.action?pid=<s:property value="#p.pid"/>" target="mainFrame" onFocus="this.blur()" class="add">编辑</a>
		        		<span class="color-mingray padding-w-5">|</span>
		        		<a onclick="deleteProduct(<s:property value="#p.pid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">删除</a>
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
					<span onclick="openUrl('/adminproduct_findAll.action?page=1')" class="padding-w-2 color-boldgray changecolorred link">首页</span>
					<span onclick="openUrl('/adminproduct_findAll.action?page=<s:property value="pageBean.page-1"/>')" class="padding-w-2 color-boldgray changecolorred link">上一页</span>
				</s:else>
				
				<s:iterator end="pageBean.pageCount" var="p" begin="1">
					<s:if test="pageBean.page == #p">
						<span class="color-red border-solid-red" style="padding:2px 6px;"><s:property value="#p"/></span>
					</s:if>
					<s:else>
						<span onclick="openUrl('/adminproduct_findAll.action?page=<s:property value="#p"/>')" class="border-solid changecolorred changeborderred link" style="padding:2px 6px;"><s:property value="#p"/></span>
					</s:else>
				</s:iterator>
					
				<s:if test="pageBean.page == pageBean.pageCount">
					<span class="color-gray padding-w-2">下一页</span>
					<span class="color-gray padding-w-2">尾页</span>
				</s:if>
				<s:else>
					<span onclick="openUrl('/adminproduct_findAll.action?page=<s:property value="pageBean.page+1"/>')" class="padding-w-2 color-boldgray changecolorred link">下一页</span>
					<span onclick="openUrl('/adminproduct_findAll.action?page=<s:property value="pageBean.pageCount"/>')" class="padding-w-2 color-boldgray changecolorred link">尾页</span>
				</s:else>
			</div>
		</s:if>
    	
	</div>
	
	<script type="text/javascript">
		function deleteProduct(id){
			if(confirm('是否确定删除该商品（该操作会同时删除该商品订单表数据）？')){
				openUrl('/adminproduct_delete.action?pid=' + id);
			}
		}
	</script>

</body>
</html>

