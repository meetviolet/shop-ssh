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

	<div class="width-800 margin-auto-w padding-top-40">
		<div class="height-40 line-height-40 color-white text-center font-bold font-16">二级分类管理</div>
		<div class="height-30 line-height-30 margin-top-30 text-right font-14">
			<span id="openAddBut" onclick="openAddBut()" class="back-orange color-white changebackboldorange border-radius-3 link" style="padding:5px 10px;">添加二级分类</span>
			<span id="closeAddBut" onclick="closeAddBut()" class="hidden back-orange color-white changebackboldorange border-radius-3 link" style="padding:5px 10px;">取消添加</span>
		</div>
		
		<form id="addForm" action="${pageContext.request.contextPath}/adminsecond_store.action" method="post">
			<div id="addDiv" class="hidden height-30 line-height-30 padding-h-10">
				<span class="color-boldgray">二级分类名称：</span>
				<input id="addName" type="text" name="csname" class="width-220 height-30 line-height-30 padding-left-10 border-solid border-radius-3 color-boldgray font-yahei">
				
				<span class="margin-left-10 color-boldgray">所属一级分类：</span>
				<select name="category.cid" class="width-220 height-30 line-height-30 border-solid border-radius-3 color-boldgray font-yahei">
					<s:iterator value="cList" var="c">
						<option value="<s:property value="#c.cid"/>"><s:property value="#c.cname"/></option>
					</s:iterator>
				</select>
				
				<span id="addBut" onclick="add()" class="margin-left-30 line-height-30 back-blue color-white changebackboldblue border-radius-3 font-14 link" style="padding:5px 10px;">确定</span>
			</div>
		</form>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab" class="margin-top-10">
			<tr>
			  <th align="center" valign="middle" class="borderright">编号</th>
			  <th align="center" valign="middle" class="borderright">二级分类名称<span class="padding-w-5">|</span>所属一级分类</th>
			  <th align="center" valign="middle">操作</th>
			</tr>
			<s:iterator var="cs" value="pageBean.proList" status="status">
				<tr class="changebackmingray">
					<td align="center" valign="middle" class="borderright borderbottom">
						<s:property value="#status.count"/>
					</td>
		        	<td align="center" valign="middle" class="borderright borderbottom">
		        		<form id="catagoryForm_<s:property value="#cs.csid"/>" action="${pageContext.request.contextPath}/adminsecond_update.action" method="post">
			        		<input type="hidden" name="csid" value="<s:property value="#cs.csid"/>"/>
			        		
			        		<span id="category_<s:property value="#cs.csid"/>" class="padding-right-10"><s:property value="#cs.csname"/></span>
			        		<input id="editCategory2_<s:property value="#cs.csid"/>" type="text" name="csname" value="<s:property value="#cs.csname"/>" class="hidden width-220 height-30 line-height-30 padding-left-10 margin-right-10 border-solid border-radius-3 color-boldgray font-yahei">
				        	<select name="category.cid" class="width-220 height-30 line-height-30 border-solid border-radius-3 color-boldgray font-yahei">
								<s:iterator value="cList" var="c">
									<option value="<s:property value="#c.cid"/>" <s:if test="#cs.category.cid == #c.cid">selected</s:if>><s:property value="#c.cname"/></option>
								</s:iterator>
							</select>
						</form>
		        	</td>
		        	
		        	<td align="center" valign="middle" class="borderbottom">
		        		<div id="editBut_<s:property value="#cs.csid"/>">
		        			<a onclick="edit(<s:property value="#cs.csid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">编辑</a>
			        		<span class="color-mingray padding-w-5">|</span>
			        		<a onclick="del(<s:property value="#cs.csid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">删除</a>
		        		</div>
		        		<div id="saveBut_<s:property value="#cs.csid"/>" class="hidden">
		        			<a onclick="save(<s:property value="#cs.csid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">保存</a>
			        		<span class="color-mingray padding-w-5">|</span>
			        		<a onclick="cancel(<s:property value="#cs.csid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">取消</a>
		        		</div>
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
					<span onclick="openUrl('/adminsecond_findAll.action?page=1')" class="padding-w-2 color-boldgray changecolorred link">首页</span>
					<span onclick="openUrl('/adminsecond_findAll.action?page=<s:property value="pageBean.page-1"/>')" class="padding-w-2 color-boldgray changecolorred link">上一页</span>
				</s:else>
				
				<s:iterator end="pageBean.pageCount" var="p" begin="1">
					<s:if test="pageBean.page == #p">
						<span class="color-red border-solid-red" style="padding:2px 6px;"><s:property value="#p"/></span>
					</s:if>
					<s:else>
						<span onclick="openUrl('/adminsecond_findAll.action?page=<s:property value="#p"/>')" class="border-solid changecolorred changeborderred link" style="padding:2px 6px;"><s:property value="#p"/></span>
					</s:else>
				</s:iterator>
					
				<s:if test="pageBean.page == pageBean.pageCount">
					<span class="color-gray padding-w-2">下一页</span>
					<span class="color-gray padding-w-2">尾页</span>
				</s:if>
				<s:else>
					<span onclick="openUrl('/adminsecond_findAll.action?page=<s:property value="pageBean.page+1"/>')" class="padding-w-2 color-boldgray changecolorred link">下一页</span>
					<span onclick="openUrl('/adminsecond_findAll.action?page=<s:property value="pageBean.pageCount"/>')" class="padding-w-2 color-boldgray changecolorred link">尾页</span>
				</s:else>
			</div>
		</s:if>
    	
	</div>


	<%-- <a href="${pageContext.request.contextPath}/adminsecond_edit.action?csid=<s:property value="#cs.csid"/>"> </a> --%>

	<script type="text/javascript">
		// 打开div添加
		function openAddBut(){
			$('#openAddBut').addClass('hidden');
			$('#closeAddBut').removeClass('hidden');
			$('#addDiv').fadeIn();
		}
		
		// 关闭div添加
		function closeAddBut(){
			$('#closeAddBut').addClass('hidden');
			$('#openAddBut').removeClass('hidden');
			$('#addDiv').fadeOut();
		}
	
		// 添加
		function add(){
			var name = $('#addName').val();
			if(isNull(name)){
				alert('分类名称不能为空！');
				return;
			}
			$('#addForm').submit();
		}
		
		// 编辑
		function edit(id){
			$('#category_' + id).addClass('hidden');
			$('#editBut_' + id).addClass('hidden');
			$('#editCategory2_' + id).removeClass('hidden');
			$('#saveBut_' + id).removeClass('hidden');
		}
		// 保存
		function save(id){
			var name = $('#editCategory2_' + id).val();
			if(isNull(name)){
				alert('二级分类名称不能为空！');
				return;
			}
			$('#catagoryForm_' + id).submit();
		}
		// 删除
		function del(id){
			if(id > 0){
				if(confirm('是否确认删除该记录？')){
					openUrl('/adminsecond_delete.action?csid=' + id);
				}	
			}
		}
		// 取消
		function cancel(id){
			$('#editCategory2_' + id).addClass('hidden');
			$('#saveBut_' + id).addClass('hidden');
			$('#category_' + id).removeClass('hidden');
			$('#editBut_' + id).removeClass('hidden');
		}
	</script>
	
</body>
</html>

