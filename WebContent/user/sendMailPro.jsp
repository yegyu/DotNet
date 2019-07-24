<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${checkId != 1 }">
	<script type="text/javascript">
	alert("아이디가 존재하지 않습니다.")
	console.log("아이디 존재 안함")
</script>
<c:if test="${1 == sessionScope.isAdmin }">
		<c:redirect url="admin.do"/>
	</c:if>
	<c:if test="${2 == sessionScope.isAdmin }">
		<c:redirect url="mypage.do"/>
	</c:if>
<%-- 	<c:redirect url="mypage.do" /> --%>
</c:if>
<c:if test="${insertMsgRs == 1 }">
	
	<script>

		alert("전송 성공!!");
		console.log("아이디 존재")

	</script>
<%-- 	<c:redirect url="admin.do"/> --%>
	<c:if test="${1 == sessionScope.isAdmin }">
		<c:redirect url="admin.do"/>
	</c:if>
	<c:if test="${2 == sessionScope.isAdmin }">
		<c:redirect url="mypage.do"/>
	</c:if>
</c:if>
<c:if test="${insertMsgRs != 1}">
<script>
		alert("전송 실패!!");
	</script>
	<c:if test="${1 == sessionScope.isAdmin }">
		<c:redirect url="admin.do"/>
	</c:if>
	<c:if test="${2 == sessionScope.isAdmin }">
		<c:redirect url="mypage.do"/>
	</c:if>
	
</c:if>