<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="layout hidden" id="rulePop">
	<div style="width:500px; min-height:400px; height:auto; margin:0 auto; background:#ffffff; border-radius:8px; border:1px solid #e2e2e2;">
		<div class="layout-title">
			<div class="tip"></div>
			<div class="txt">服务协议</div>
			<div class="close color-gray changecolorboldgray" onclick="closeRulePop();">关闭</div>
			<div class="clear"></div>
		</div>
		
		<div class="margin-h-30 padding-w-15 color-boldgray max-height-400 overflow-ys">
		<p>该商城为西安交通大学创新港校区软件学院《软件工程综合训练》项目作业。</p>
		<%-- 
			<p style="text-indent:25px">本协议是您与本商城网站（含移动客户端）所有者就华为商城网站服务等相关事宜订立的契约，请您认真阅读并充分理解本服务协议，本协议构成对双方有约束力的法律文件。</p><br/>
			<p class="font-bold">第一条 服务条款的确认和接纳</p><br/>		
			<p style="text-indent:25px; font-weight:bold;">本协议的订立、执行、解释及争议的解决均应适用在中华人民共和国大陆地区适用之有效法律。如发生本协议与适用之法律相抵触时，则这些条款将完全按法律规定重新解释，而其它有效条款继续有效。如缔约方就本协议内容或其执行发生任何争议，双方应尽力友好协商解决，协商不成时，双方同意将纠纷或争议提交本协议签订地有管辖权的人民法院诉讼解决，本协议的签订地为中华人民共和国广东省深圳市龙岗区。</p><br/>
		--%>
		</div>
		
	</div>
</div>

<script type="text/javascript">
	function openRulePop(){
		$('#layout-shadow').removeClass('hidden');
		$('#rulePop').removeClass('hidden');
	}
	
	function closeRulePop(){
		$('#layout-shadow').addClass('hidden');
		$('#rulePop').addClass('hidden');
	}
</script>
