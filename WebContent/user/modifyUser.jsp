<%@page import="main.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_user.jsp" %>

<!DOCTYPE html>
<html>
<head>
</head>
<body>
 <jsp:include page="../mypage.do" />
<div class="page-content">
<div class="container-fluid">
<form name="passwdform" method="post" action="modifyUserView.do"
	onsubmit="return passwdcheck()">
	<table>
		<tr>
			<th colspan="2"> ${msg_passwd} </th>
		</tr>
		<tr>
			<th> ${str_passwd} </th>
			<td> 
				<input autofocus class="input" type="password" name="passwd" maxlength="15">
			</td>	
		</tr>
		<tr>
			<th colspan="2">
				<input class="inputbutton btn" type="submit" value="${btn_mod}">
				<input class="inputbutton btn" type="button" value="${btn_mod_cancel}"
					onclick="location='main.do'">
			</th>
		</tr>
	</table>
</form>
</div>
</div>
<script src="${project_user}/script_user.js"></script>
</body>

</html>





