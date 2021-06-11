<%@ page language="java" pageEncoding="UTF-8"%>
<html>
	<title>后台管理系统</title>
	<head>
		<meta http-equiv="Content-Language" content="zh-cn">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  
<frameset rows="80,*,43" frameborder=0 border="0" framespacing="0">
  <frame src="${pageContext.request.contextPath}/admin/top.jsp" name="topFrame" scrolling="NO" noresize/>
  <frameset cols="280,*" frameborder="0" border="0" framespacing="0">
		<frame src="${pageContext.request.contextPath}/admin/left.jsp" name="leftFrame" noresize scrolling="YES"/>
		<frame src="${pageContext.request.contextPath}/admin/welcome.jsp" name="mainFrame"/>
  </frameset>
  <frame src="${pageContext.request.contextPath}/admin/bottom.jsp" name="bottomFrame" scrolling="NO"  noresize/>
</frameset>
</html>
