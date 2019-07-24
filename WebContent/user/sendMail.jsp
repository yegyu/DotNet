<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<thead>
	<tr >
		<th scope="col">
		<input type="checkbox" class="checkbox" id="topCheckS">
		</th>
		<th scope="col">
				번호
		</th>
		<th scope="col">받는 사람 </th>
		<th scope="col">제목</th>
		<th scope="col">날짜</th>
	
	</tr>
</thead>
	
<tbody>
	<c:if test="${mySendCnt != 0 }">
		<c:set var="cnt" value="${mySendCnt }"/>
		<c:forEach var="msgs" items="${getSendMsgs }">
		
		<tr class="sTable">
				<th><input type="checkbox" class="checkbox eachCheck" id="s${cnt}_${msgs.m_num}"></th>
				<th>${cnt }</th>
				<c:set var="cnt" value="${cnt -1 }"/>
				<th>${msgs.r_mem_id}</th>
				<th >${msgs.m_title }</th>
				<th>${msgs.m_date }</th>
			</tr>
			<tr class="sContent">
			<th>내용</th>
			<td colspan="3">${msgs.m_content }</td>
			</tr>
<%-- 			<tr class="sContent"><th>${msgs.m_content }</th></tr> --%>
			
		</c:forEach>
	</c:if>
</tbody>


