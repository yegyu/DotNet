<%@page import="main.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_user.jsp" %>
<script src="${project_user}script_user.js"></script>

<h2> ${page_modify} </h2>

<c:if test="${result == 0}">
	<script type="text/javascript">
		<!--
		alert( modifyerror );
		//-->
	</script>		
	<meta http-equiv="refresh" content="0; url=main.do">
</c:if>
<c:if test="${result != 0}">
	<c:redirect url="main.do"/>
</c:if>	











