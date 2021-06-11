<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s" %>
<html>
<head>
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/public.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/css/common.css" />
	<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath }/admin/css/css.css" />
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
		<div class="height-40 line-height-40 color-white text-center font-bold font-16">商品添加</div>

		<form id="productForm" action="${pageContext.request.contextPath}/adminproduct_save.action" method="post" enctype="multipart/form-data">
			<table width="100%" border="0" cellspacing="0" cellpadding="0" id="main-tab" class="margin-top-10">
				<tr class="border-bottom-solid">
				  	<td align="center" valign="middle" class="borderright font-boldgray font-16 font-bold" style="width:15%">商品名称：</td>
				  	<td align="center" valign="middle" class="borderright bordebottom" style="width:35%">
				  		<input id="pname" type="text" name="pname" placeholder="请输入商品名称" class="width-220 height-30 line-height-30 padding-left-10 border-solid border-radius-3 color-boldgray font-yahei">
				  	</td>
				  	<td align="center" valign="middle" class="borderright bordebottom font-boldgray font-16 font-bold" style="width:15%">所属二级分类</td>
				  	<td align="center" valign="middle" class="borderright bordebottom" style="width:35%">
				  		<select name="categorySecond.csname" class="width-220 height-30 line-height-30 border-solid border-radius-3 color-boldgray font-yahei">
							<s:iterator value="csList" var="cs">
								<option value=<s:property value="#cs.csname"/>><s:property value="#cs.csname"/></option>
							</s:iterator>
						</select>
				  	</td>
				</tr>
				<tr class="border-bottom-solid">
				  	<td align="center" valign="middle" class="borderright bordebottom font-boldgray font-16 font-bold" style="width:15%">市场价格：</td>
				  	<td align="center" valign="middle" class="borderright bordebottom" style="width:35%">
				  		<input id="market_price" type="text" name="market_price" placeholder="请输入市场价格" class="width-220 height-30 line-height-30 padding-left-10 border-solid border-radius-3 color-boldgray font-yahei">
				  	</td>
				  	<td align="center" valign="middle" class="borderright bordebottom font-boldgray font-16 font-bold" style="width:15%">商城价格：</td>
				  	<td align="center" valign="middle" class="borderright bordebottom" style="width:35%">
				  		<input id="shop_price" type="text" name="shop_price" placeholder="请输入商城价格" class="width-220 height-30 line-height-30 padding-left-10 border-solid border-radius-3 color-boldgray font-yahei">
				  	</td>
				</tr>
				<tr class="border-bottom-solid">
				  	<td align="center" valign="middle" class="borderright font-boldgray font-16 font-bold" style="width:15%">是否热门：</td>
				  	<td align="center" valign="middle" class="borderright" style="width:35%">
				  		<span class="vertical-middle"><input type="radio" name="is_hot" value="1" class="vertical-middle" style="margin:0 5px;" checked="checked">是</span>
				  		<span class="margin-left-10 vertical-middle"><input type="radio" name="is_hot" value="0" class="vertical-middle" style="margin:0 5px;">否</span>
				  	</td>
			  		<td align="center" valign="middle" class="borderright font-boldgray font-16 font-bold" style="width:15%">商品图片：</td>
				  	<td align="center" valign="middle" class="borderright" style="width:35%">
				  		<span onclick="uploadPic()" class="ui-upload">上传图片</span>
						<span id="uploadPicFileName" class="margin-left-10 color-gray"></span>
						<input onchange="uploadPicChange()" id="uploadPicFile" name="upload" type="file" class="hidden">
				  	</td>
				</tr>
				<tr class="border-bottom-solid">
				  	<td align="center" valign="middle" class="borderright font-boldgray font-16 font-bold" style="width:15%">商品描述:</td>
				  	<td align="center" valign="middle" class="borderright" colspan="3">
				  		<div class="padding-10">
				  			<textarea id="pdesc" name="pdesc" class="line-height-30 padding-left-10 padding-top-10 padding-bottom-10 border-solid border-radius-3 color-boldgray font-yahei" placeholder="请输入商品描述" style="width:90%; height:70px;"></textarea>
				  		</div>
				  	</td>
				</tr>
				<tr class="border-bottom-solid height-50 line-height-50">
				  	<td align="center" valign="middle" colspan="4" class="borderright font-boldgray font-16 font-bold">
				  		<button onclick="submitFrom();" type="button" class="width-70 height-30 line-height-28 font-yahei border-none border-radius-3 back-blue color-white link">确定</button>
				  		<button type="reset" class="width-70 height-30 line-height-28 margin-left-10 font-yahei border-none border-radius-3 back-blue color-white link">重置</button>
				  		<button onclick="history.go(-1)" type="button" class="width-70 height-30 line-height-28 margin-left-10 font-yahei border-none border-radius-3 back-blue color-white link">返回</button>
				  	</td>
				</tr>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function uploadPic(){
			$('#uploadPicFile').click();
		}
		
		function uploadPicChange(){
			var currFile = $('#uploadPicFile').val();
			var name = splitString(currFile.substring(currFile.indexOf("-") + 1), 30);
			$('#uploadPicFileName').html(name);
		}
	
		function submitFrom(){
			var name = $('#pname').val();
			if(isNull(name)){
				alert("商品名称不能为空！");
				return;
			}
			
			var marketPrice = $('#market_price').val();
			if(isNull(marketPrice)){
				alert("市场价格不能为空！");
				return;
			}
			if(!isDouble(marketPrice)){
				alert("市场价格格式错误！");
				return;
			}
			
			var shopPrice = $('#shop_price').val();
			if(isNull(shopPrice)){
				alert("商城价格不能为空！");
				return;
			}
			if(!isDouble(shopPrice)){
				alert("商城价格格式错误！");
				return;
			}
			
			var file = $('#uploadPicFile').val();
			if(isNull(file)){
				alert("商品图片不能为空！");
				return;
			}
			if(!checkUpLoadFile(file)){
				return;
			}
			
			var desc = $('#pdesc').val();
			if(isNull(desc)){
				alert("商品描述不能为空！");
				return;
			}
			
			$('#productForm').submit();
		}
		
		
		function checkUpLoadFile(fileName){
			var n = fileName.lastIndexOf(".");
			var s1 = fileName.substring(n + 1, fileName.length);
			if (!(s1 == "png" || s1 == "jpg" || s1 == "jpeg" || s1 == "bmp" || s1 == "gif")){
				 alert("请上传jpg,jpeg,bmp,png,gif格式的图片");  
				$('#file').val('');
				return false;
			} else {
				return true;
			}
		}
	</script>
</body>
</html>