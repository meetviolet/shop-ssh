<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div id="orderDetailLayout" class="hidden" style="width:100%; min-height:200px; height:auto; position:fixed; top:20%; z-index:1001;">
	<div style="width:800px; min-height:60px; max-height:500px; overflow-y:auto; margin:0 auto; background:#ffffff; border-radius:8px; border:1px solid #e2e2e2;">
		<div class="width-all height-40 line-height-40 padding-h-5 border-bottom-solid">
			<div class="float-left width-450 text-right font-16 font-bold color-black">订单详情</div>
			<div onclick="closeDetail()" class="float-right width-50 text-center color-gray font-12 link">关闭</div>
		</div>
		<div id="orderDetailDiv" class="padding-w-10"></div>
	</div>
</div>
<script>
	function openDetail(){
		$('#layout-shadow').removeClass('hidden');
		$('#orderDetailLayout').removeClass('hidden');
	}
	function closeDetail(){
		$('#orderDetailDiv').html('');
		$('#layout-shadow').addClass('hidden');
		$('#orderDetailLayout').addClass('hidden');
	}
</script>

		