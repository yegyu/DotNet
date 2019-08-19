<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>feedSurPro</title>
	</head>
	<body>
		<script type="text/javascript">
		var result = ${result};
		if(result) {
			alert("신청이 완료 됐습니다.")
			location.href = "main.do?b_tp=3";
		} else {
			alert("문의사항 등록 실패");
		}
		</script>
	</body>
</html>