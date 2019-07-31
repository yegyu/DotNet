<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>arthur</title>
</head>
<body>
	<div class="col table">
		
		<!-- 		<div class="table"> -->
		<table class="table ">
			<thead>
				<tr>
					<th style="width: 10%">상품이름</th>
					<th style="width: 10%">포인트</th>
					<th style="width: 10%">개수</th>
					<th style="width: 20%">사용자 아이디</th>
					<th style="width: 20%">날짜</th>
					<th style="width: 20%"></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="st" items="${memPoPay }">
					<tr id="${st.t_num}">
						<td>${st.g_name }</td>
						<td>${st.g_point }</td>
						<td>${st.g_cnt}</td>
						<td>${st.mem_id}</td>
						<td>${st.t_date}</td>
						<c:if test="${st.tst_num ==0}">
							<td><button class="btn req" id="${st.t_num }">요청 수락</button></td>
						</c:if>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script>
		$(document).ready(function(){
			$('.btn.req').on('click', function(){
				var dt = {t_num:$(this).prop('id')}
				console.log(dt);
				$.ajax({
					data:dt,
					type:"POST",
					dataType:"text",
					url:"adminPay.do",
					success:function(data){
						console.log('ajax 성공, t_num' + data)
						$("tr#"+data).remove();
					},
					error:function(){
						console.log('ajax 실패')
					}
				})
			});
		});
	</script>
</body>
</html>