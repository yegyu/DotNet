<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="table">
<table class="table">
	<tr>
		<th>아이디</th>
		<th>성별</th>
		<th>나이대</th>
		<th>포인트</th>
		<th>회원가입일</th>
		<th>상태</th>
		<th></th>
	</tr>
	<c:forEach var="mem" items="${memList }" >
		<tr>
			<td>${mem.id }</td>
				<c:if test="${mem.gender == 0 }">
			<td>여자</td>
			</c:if>
			<c:if test="${mem.gender == 1}">
				<td>남자</td>
			</c:if>
			<td>${mem.age }</td>
			<td>${mem.point }</td>
			<td>${mem.signup_date }</td>
			
<%-- 			<c:if test="${mem.user_state ==0 }"> --%>
<!-- 				<td>회원</td> -->
<%-- 			</c:if>		 --%>
<%-- 			<c:if test="${mem.user_state ==1 }">	 --%>
<!-- 				<td>차단됨</td> -->
<%-- 			</c:if> --%>
			<td>
				<c:if test="${mem.user_state == 0 }">
				<button class="btn" name="stop" id="${mem.id}" value="1">중지</button>
				</c:if>
				<c:if test="${mem.user_state == 1 }">
				<button class="btn" name="recover" id="${mem.id}" value="0">회복</button>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</table>
</div>
<script>
var id ={};
var json = {};
$(document).ready(function(){
	$("button[name=stop]").on('click',function(){
		id["id"] = $(this).prop('id');
		id["state"] = $(this).val();
		json = {"json" : JSON.stringify(id)}
		console.log(json)
		$(this).text("회복");
		$(this).prop('name','recover');
		$(this).val(0);
		$.ajax({
			data:json,
			dataType:"text",
			url:"stopMem.do",
			type:"POST",
			success:function(data){
				console.log("stop mem succes " + data)
				$(this).text("회복");
				$(this).prop('name','recover');
				$(this).val(0);
			},
			error:function(){
				console.log("stop member fail")
				
			}
		})
	})
	$("button[name=recover]").on('click',function(){
		id["id"] = $(this).prop('id');
		id["state"] = $(this).val();
		json = {"json" : JSON.stringify(id)}
		console.log(json)
		$(this).text("중지");
		$(this).prop('name','stop');
		$(this).val(1);
		$.ajax({
			data:json,
			dataType:"text",
			url:"recoverMem.do",
			type:"POST",
			success:function(data){
				console.log("recover mem succes " + data)
				$(this).text("중지");
				$(this).prop('name','stop');
				$(this).val(1);
			},
			error:function(){
				console.log("recover member fail")
				
			}
		})
	})

});

</script>