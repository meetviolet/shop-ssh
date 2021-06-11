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
		<div class="height-40 line-height-40 color-white text-center font-bold font-16">一级分类管理</div>
		<div class="height-30 line-height-30 margin-top-30 text-right font-14">
			<span id="openAddBut" onclick="openAddBut()" class="back-orange color-white changebackboldorange border-radius-3 link" style="padding:5px 10px;">添加一级分类</span>
			<span id="closeAddBut" onclick="closeAddBut()" class="hidden back-orange color-white changebackboldorange border-radius-3 link" style="padding:5px 10px;">取消添加</span>
		</div>
		
		<form id="addForm" action="${pageContext.request.contextPath}/admincategory_save.action" method="post">
			<div id="addDiv" class="hidden height-30 line-height-30 padding-h-10">
				<span class="color-boldgray">分类名称：</span>
				<input id="addName" type="text" name="cname" class="width-220 height-30 line-height-30 padding-left-10 border-solid border-radius-3 color-boldgray font-yahei">
				<span id="addBut" onclick="add()" class="margin-left-30 line-height-30 back-blue color-white changebackboldblue border-radius-3 font-14 link" style="padding:5px 10px;">确定</span>
			</div>
		</form>
		
		<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab" class="margin-top-10">
			<tr>
			  <th align="center" valign="middle" class="borderright">编号</th>
			  <th align="center" valign="middle" class="borderright">一级分类名称</th>
			  <th align="center" valign="middle">操作</th>
			</tr>
			<s:iterator var="c" value="cList" status="status">
				<tr class="changebackmingray">
					<td align="center" valign="middle" class="borderright borderbottom">
						<s:property value="#status.count"/>
					</td>
		        	<td align="center" valign="middle" class="borderright borderbottom">
			        	<form id="catagoryForm_<s:property value="#c.cid"/>" action="${pageContext.request.contextPath}/admincategory_update.action" method="post">
			        		<span id="category_<s:property value="#c.cid"/>"><s:property value="#c.cname"/></span>
			        		<input type="hidden" name="cid" value="<s:property value="#c.cid"/>"/>
			        		<input id="editCategory_<s:property value="#c.cid"/>" type="text" name="cname" value="<s:property value="#c.cname"/>" class="hidden width-220 height-30 line-height-30 padding-left-10 border-solid border-radius-3 color-boldgray font-yahei">
		        		</form>
		        	</td>
		        	<td align="center" valign="middle" class="borderbottom">
		        		<div id="editBut_<s:property value="#c.cid"/>">
		        			<a onclick="edit(<s:property value="#c.cid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">编辑</a>
			        		<span class="color-mingray padding-w-5">|</span>
			        		<a onclick="del(<s:property value="#c.cid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">删除</a>
		        		</div>
		        		<div id="saveBut_<s:property value="#c.cid"/>" class="hidden">
		        			<a onclick="save(<s:property value="#c.cid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">保存</a>
			        		<span class="color-mingray padding-w-5">|</span>
			        		<a onclick="cancel(<s:property value="#c.cid"/>)" href="javascript:void(0)" target="mainFrame" onFocus="this.blur()" class="add">取消</a>
		        		</div>
		        	</td>
				</tr>
			</s:iterator>
    	</table>
    	
	</div>
	
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
			$('#editCategory_' + id).removeClass('hidden');
			$('#saveBut_' + id).removeClass('hidden');
		}
		// 保存
		function save(id){
			var name = $('#editCategory_' + id).val();
			if(isNull(name)){
				alert('分类名称不能为空！');
				return;
			}
			$('#catagoryForm_' + id).submit();
		}
		// 删除
		function del(id){
			if(id > 0){
				if(confirm('是否确认删除该记录？')){
					openUrl('/admincategory_delete.action?cid=' + id);
				}	
			}
		}
		// 取消
		function cancel(id){
			$('#editCategory_' + id).addClass('hidden');
			$('#saveBut_' + id).addClass('hidden');
			$('#category_' + id).removeClass('hidden');
			$('#editBut_' + id).removeClass('hidden');
		}
	</script>

</body>
</html>

