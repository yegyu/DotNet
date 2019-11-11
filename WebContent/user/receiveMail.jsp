<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do" />
<main class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">받은 메세지함</h2>
		<hr>
		<h5>내 메세지 관리 > 받은 메세지함</h5>
		<hr>
		<button class="btn" id="trash" style="margin:10px">쪽지 삭제</button>
		
		<!-- 사이드바  1-1 end -->
		<!-- 사이드바 2-2 start -->
		<table class="table">
			<thead>
				<tr>
					<th scope="col"><input type="checkbox" class="checkbox"
						id="topCheckR"></th>
					<th scope="col">번호</th>
					<th scope="col">보낸 사람</th>
					<th scope="col">제목</th>
					<th scope="col">날짜</th>

				</tr>
			</thead>
			<tbody>
				<c:if test="${myReceiveCnt != 0 }">
					<c:set var="cnt" value="${myReceiveCnt }" />
					<c:forEach var="msgs" items="${recevieMsgs }">
						<tr class="rTable">
							<th><input type="checkbox" class="checkbox eachCheck"
								id="r${cnt}_${msgs.m_num}"></th>
							<th>${cnt }</th>
							<c:set var="cnt" value="${cnt -1 }" />
							<th>${msgs.s_mem_id}</th>
							<th>${msgs.m_title }</th>
							<th><fmt:formatDate value="${msgs.m_date}"
									pattern="yyyy년 MM월 dd일 hh:mm" /></th>
						</tr>
						<tr class="rContent">
							<th>내용</th>
							<td colspan="3">${msgs.m_content }</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>


</div>
</main>
<!-- 사이드바 2-2 end --> 

</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->