<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
	pageEncoding="UTF-8"%>
<%@ include file="setting_user.jsp"%>
<script src="${project_user}/script_user.js"></script>

<meta charset="UTF-8">
<!-- <link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
 -->
<style>
th {
	text-align: center;
}
</style>

<body>
	<div class="container">
		<!--메인 게시판 리스트 -->
		<center>
			<h4>${memId}님의 게시글</h4>
		</center>
		<br>
		<table class="table table-hover text-center">
			<thead>
				<tr>
					<th>${str_sur_type}</th>
					<th>${str_title}</th>
					<th>${str_part_date}</th>
				</tr>
			</thead>

			<c:if test="${cnt == 0}">
				<tr>
					<td colspan=3>${msg_list}</td>
				</tr>
			</c:if>

			<c:forEach var="boardDto" items="${surveys}">
				<c:if test="${cnt != 0 and boardDto.writer == memId }">
					<tbody>
						<tr>
							<td align="center">${type}
							<c:set var="type" value="${boardDto.s_tp_num}" />
							</td>
							<td align="center">${boardDto.subject}</td>
							<td align="center"><fmt:formatDate
									value="${boardDto.s_date}" type="both"
									pattern="yyyy-MM-dd HH:mm" /></td>
						</tr>
					</tbody>
				</c:if>
			</c:forEach>
		</table>


	</div>
</body>