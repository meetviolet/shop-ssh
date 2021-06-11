<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
	<%@include file="head.jsp"%>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>商品列表</title>
</head>
<body>
	<%@ include file="top.jsp"%>
	
	<div class="width-1200 margin-auto-w padding-top-10">
		<!-- 左侧div -->
		<div class="float-left width-351 min-height-300 border-solid border-radius-5">
			<s:iterator value="#session.cList" var="c">
				<div class="padding-h-5 border-bottom-dashed">
					<div onclick="openUrl('/product_findByPageCid?cid=<s:property value="#c.cid"/>&page=1')" class="width-all height-35 line-height-35 font-14 font-bold color-blue changecolororange text-center link">
						<s:property value="#c.cname"/>
					</div>
					<div class="width-all font-12">
						<s:iterator value="#c.categorySeconds" var="cs">
							<div onclick="openUrl('/product_findByCsid?csid=<s:property value="#cs.csid"/>&page=1')" class="float-left width-117 height-30 line-height-30 color-gray changebackmingray text-center link">
								<s:property value="#cs.csname"/>
							</div>
						</s:iterator>
					</div>
					<div class="clear"></div>
				</div>
			</s:iterator>
		</div>
		
		<!-- 右侧div -->
		<div class="float-right width-825">
			<div class="width-all border-solid border-radius-5 min-height-300">
				<s:if test="pageBean.proList.size() > 0">
					<s:iterator value="pageBean.proList" var="p">
						<div class="float-left changebackmingray" style="width:259px; padding:10px 8px;">
							<div onclick="openUrl('/product_findByPid.action?pid=<s:property value="pid"/>')">
								<img src="${pageContext.request.contextPath}/<s:property value="#p.image"/>" width="259" height="259"/>
							</div>
							
							<s:if test="#p.pname.length() > 18">    
								<div class="color-minblack font-14 padding-h-10">
									<s:property value="#p.pname.substring(0,18)"/>
								</div>
							</s:if>
							<s:else>    
								<div class="color-minblack font-14 padding-h-10">
									<s:property value="#p.pname"/>
								</div>
							</s:else>
							
							<div>
								<span>商城价： ￥</span>
								<span class="font-20 color-red font-bold font-italic"><s:property value="#p.shop_price"/></span>元
							</div>
						</div>
					</s:iterator>
				</s:if>
				<s:else>
					<div class="iconNone" style="margin:36px auto;"></div>
				</s:else>
				
				<div class="clear"></div>
			</div>
			
			<!-- 分页 -->
			<s:if test="pageBean.pageCount > 0">
				<div class="width-all height-40 line-height-40 padding-h-20 color-boldgray font-13 text-center">
					<span class="margin-right-5">
						第<s:property value="pageBean.page"/>/<s:property value="pageBean.pageCount"/>页
					</span>
					
					<s:if test="cid != null">
						<s:if test="pageBean.page == 1">
							<span class="color-gray padding-w-2">首页</span>
							<span class="color-gray padding-w-2">上一页</span>
						</s:if>
						<s:else>
							<span onclick="openUrl('/product_findByPageCid?cid=<s:property value="cid"/>&page=1')" class="padding-w-2 color-boldgray changecolorred link">首页</span>
							<span onclick="openUrl('/product_findByPageCid?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page-1"/>')" class="padding-w-2 color-boldgray changecolorred link">上一页</span>
						</s:else>
						
						<s:iterator end="pageBean.pageCount" var="p" begin="1">
							<s:if test="pageBean.page == #p">
								<span class="color-red border-solid-red" style="padding:2px 6px;"><s:property value="#p"/></span>
							</s:if>
							<s:else>
								<span onclick="openUrl('/product_findByPageCid?cid=<s:property value="cid"/>&page=<s:property value="#p"/>')" class="border-solid changecolorred changeborderred link" style="padding:2px 6px;"><s:property value="#p"/></span>
							</s:else>
						</s:iterator>
							
						<s:if test="pageBean.page == pageBean.pageCount">
							<span class="color-gray padding-w-2">下一页</span>
							<span class="color-gray padding-w-2">尾页</span>
						</s:if>
						<s:else>
							<span onclick="openUrl('/product_findByPageCid?cid=<s:property value="cid"/>&page=<s:property value="pageBean.page+1"/>')" class="padding-w-2 color-boldgray changecolorred link">下一页</span>
							<span onclick="openUrl('/product_findByPageCid?cid=<s:property value="cid"/>&page=<s:property value="pageBean.pageCount"/>')" class="padding-w-2 color-boldgray changecolorred link">尾页</span>
						</s:else>
					</s:if>
					
					<s:if test="csid != null">
						<s:if test="pageBean.page == 1">
							<span class="color-gray padding-w-2">首页</span>
							<span class="color-gray padding-w-2">上一页</span>
						</s:if>
						<s:else>
							<span onclick="openUrl('/product_findByCsid?csid=<s:property value="csid"/>&page=1')" class="padding-w-2 color-boldgray changecolorred link">首页</span>
							<span onclick="openUrl('/product_findByCsid?csid=<s:property value="csid"/>&page=<s:property value="pageBean.page-1"/>')" class="padding-w-2 color-boldgray changecolorred link">上一页</span>
						</s:else>
						
						<span class="padding-w-5">
							<s:iterator end="pageBean.pageCount" var="p" begin="1">
								<s:if test="pageBean.page == #p">
									<span class="color-red border-solid-red" style="padding:2px 6px;"><s:property value="#p"/></span>
								</s:if>
								<s:else>
									<span onclick="openUrl('/product_findByCsid?csid=<s:property value="csid"/>&page=<s:property value="#p"/>')" class="border-solid changecolorred changeborderred link" style="padding:2px 6px;"><s:property value="#p"/></span>
								</s:else>
							</s:iterator>
						</span>
						
							
						<s:if test="pageBean.page == pageBean.pageCount">
							<span class="color-gray padding-w-2">下一页</span>
							<span class="color-gray padding-w-2">尾页</span>
						</s:if>
						
						<s:else>
							<span onclick="openUrl('/product_findByCsid?csid=<s:property value="csid"/>&&page=<s:property value="pageBean.page+1"/>')" class="padding-w-2 color-boldgray changecolorred link">下一页</span>
							<span onclick="openUrl('/product_findByCsid?csid=<s:property value="csid"/>&page=<s:property value="pageBean.pageCount"/>')" class="padding-w-2 color-boldgray changecolorred link">尾页</span>
						</s:else>
					</s:if>
					
					<s:if test="pname != null">
						<s:if test="pageBean.page == 1">
							<span class="color-gray padding-w-2">首页</span>
							<span class="color-gray padding-w-2">上一页</span>
						</s:if>
						<s:else>
							<span onclick="searchByName('<s:property value="pname"/>', 1)" class="padding-w-2 color-boldgray changecolorred link">首页</span>
							<span onclick="searchByName('<s:property value="pname"/>', <s:property value="pageBean.page-1"/>)" class="padding-w-2 color-boldgray changecolorred link">上一页</span>
						</s:else>
						
						<s:iterator end="pageBean.pageCount" var="p" begin="1">
							<s:if test="pageBean.page == #p">
								<span class="color-red border-solid-red" style="padding:2px 6px;"><s:property value="#p"/></span>
							</s:if>
							<s:else>
								<span onclick="searchByName('<s:property value="pname"/>', <s:property value="#p"/>)" class="border-solid changecolorred changeborderred link" style="padding:2px 6px;"><s:property value="#p"/></span>
							</s:else>
						</s:iterator>
							
						<s:if test="pageBean.page == pageBean.pageCount">
							<span class="color-gray padding-w-2">下一页</span>
							<span class="color-gray padding-w-2">尾页</span>
						</s:if>
						<s:else>
							<span onclick="searchByName('<s:property value="pname"/>', <s:property value="pageBean.page+1"/>)" class="padding-w-2 color-boldgray changecolorred link">下一页</span>
							<span onclick="searchByName('<s:property value="pname"/>', <s:property value="pageBean.pageCount"/>)" class="padding-w-2 color-boldgray changecolorred link">尾页</span>
						</s:else>
					</s:if>
					
				</div>
			</s:if>
	
		</div>
	</div>
	<div class="clear"></div>
	
	<script type="text/javascript">
		function searchByName(name, page){
			openUrl('/product_findByPname?pname=' + encodeURIComponent(name) + '&page=' + page);
		}
	</script>
	
	<%@ include file="foot.jsp"%>
</body>
</html>
