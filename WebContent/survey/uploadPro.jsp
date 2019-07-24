<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>uploadPro</title>
		<%@ include file="setting_survey.jsp" %>
	</head>
	<body>
		<c:if test="${ins_sur_result eq 1}">
			<script type="text/javascript">
				alert("설문등록성공");
			</script>
		</c:if>
		<c:if test="${ins_two_result eq 1}">
			<script type="text/javascript">
				alert("설문내용 등록성공");
			</script>
		</c:if>
		<c:redirect url="main.do"/>
	</body>	
</html>