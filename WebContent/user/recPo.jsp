<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do"/>
<div class="page-content">
<div class="container-fluid">
	<div class="card col-md-10">
		<h2 class="mt-3">내 포인트 사용/적립내역</h2>
		<hr>
		<h5>내 포인트 관리 > 내 포인트 사용/적립내역</h5>
		<hr>
		<!-- 사이드바  1-1 end -->
<div class="container-fluid">
	<br> <br> <label  style="float:right;position:relative;left:-100px;font-size: 20px"> 현재 포인트 <input type="text"
		readonly="readonly" value="${point}">
	</label>
	<br><br>

	<div class="row ">
		<div class="col" >
		<h3>얻은 포인트</h3>
		<div class="table" style="height:430px;">
			<table class="table ">
				<thead>
					<tr>
						<th  style="width:10%">포인트</th>
						<th  style="width:50%">내용</th>
						<th  style="width:20%">날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="po" items="${getPoList }">
					<tr>
						<td>+${po.point }</td>
						<td>설문번호(${po.s_num })&nbsp;&nbsp;&nbsp;
						${po.subject }</td>
						<td>${po.s_date }</td>
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
			</div>
		</div>
		
		<div class="col">
		<h3>사용 포인트 현황</h3>
		<div class="table" style="height:430px;">
			<table class="table ">
				<thead>
					<tr>
						<th  style="width:20%">상품이름</th>
						<th  style="width:15%">포인트</th>
						<th  style="width:10%">개수</th>
						<th  style="width:20%">날짜</th>
						<th  style="width:20%">상태</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="st" items="${stList }">
					<tr>
						<td>${st.g_name }</td>
						<td>${st.g_point }</td>
						<td>${st.g_cnt}</td>
						<td>${st.t_date}</td>
						<c:if test="${st.tst_num ==0}">
							<td>배송 준비중</td>
						</c:if>
						<c:if test="${st.tst_num == 1 }">
							<td>배송 완료</td>
						</c:if>
						
					</tr>
				</c:forEach>
					
				</tbody>
			</table>
			</div>
		</div>
	</div>

		<!-- 사이드바 2-2 start --> 
	</div>
</div>
</div>
<!-- 사이드바 2-2 end -->
</div>
</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->
