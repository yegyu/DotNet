<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<thead>
	<tr>
		<th scope="col">
		<input type="checkbox" class="checkbox" id="topCheckR">
		</th>
		<th scope="col">번호</th>
		<th scope="col">보낸 사람 </th>
		<th scope="col">제목</th>
		<th scope="col">날짜</th>
		
	</tr>
</thead>
<tbody>
	<c:if test="${myReceiveCnt != 0 }">
		<c:set var="cnt" value="${myReceiveCnt }"/>
		<c:forEach var="msgs" items="${recevieMsgs }">
			<tr class="rTable">
				<th><input type="checkbox" class="checkbox eachCheck" id="r${cnt}_${msgs.m_num}"></th>
				<th>${cnt }</th>
				<c:set var="cnt" value="${cnt -1 }"/>
				<th>${msgs.s_mem_id}</th>
				<th>${msgs.m_title }</th>
				<th>${msgs.m_date }</th>
			</tr>
			<tr class="rContent">
			<th>내용</th>
			<td colspan="3">${msgs.m_content }</td>
			</tr>
		</c:forEach>
	</c:if>
</tbody>
