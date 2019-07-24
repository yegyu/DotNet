<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<script type="text/javascript">
			
		switch(${s_tp_num}){
		case 2 : location.href = "uploadSur.do?s_num=" + ${s_num}; break;
		case 5 : location.href = "fiveSur.do?s_num=" + ${s_num}; break;
		case 8 : location.href = "eightSur.do?s_num=" + ${s_num}; break;
		}
		</script>
		
	</body>
</html>