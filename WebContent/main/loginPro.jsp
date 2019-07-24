<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${result == 0 }">
	<script type="text/javascript">
	<!--
		alert("아이디가 존재하지 않습니다.")
		 history.back();
	//-->
	</script>
</c:if>
<c:if test="${result == -1 }">
	<script type="text/javascript">
	<!--
		alert("비밀번호가 존재하지 않습니다.")
		 history.back();
	//-->
	</script>
</c:if>

<c:if test="${result==1 }">

<c:redirect url="main.do" />
</c:if>