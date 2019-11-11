<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../mypage.do"></jsp:include>
<div class="page-content">
<div class="container-fluid">
<div class="card col-md-12">
		<h2 class="mt-3">친구 신청, 요청 상태</h2>
		<hr>
		<h5>내 친구 관리 > 친구신청, 요청 상태</h5>
		<hr>
	<div class="grid">
	 	<div class="grid-sizer col-md-3"></div>
    	<c:forEach var="r" items="${accId }" varStatus="ri">
        	<div class="grid-item col-md-3 mb-4">
			      <div class="card">
			        <div class="card-header">
			          ${r}
			        </div>
			        <div class="card-body">
			       	 	<img class="card-img" src="/DotNet/defaultImg/fr1.gif">
			            <footer class="btn-footer">
			            <div class="row">
			            	<button class="btn accBtn" id="${r }"  >
			            		수락
			            	</button>&nbsp;
			            	<button class="btn  rejBtn" id="${r }">차단</button>
		            	</div>
			            </footer>
			        </div>
			      </div>
			   </div>
		</c:forEach>
		<c:forEach var="r" items="${waitId }" varStatus="ri">
        	<div class="grid-item col-md-3 mb-4">
			      <div class="card">
			        <div class="card-header">
			          ${r}
			        </div>
			        <div class="card-body">
			       	 	<img class="card-img" src="/DotNet/defaultImg/fr1.gif">
			            <footer class="btn-footer">
			            	 <button class="btn waitBtn" id="">요청 대기</button>
			            </footer>
			        </div>
			      </div>
			   </div>
		</c:forEach>
	</div>
</div>
</div>
</div>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>

<script>
$('.grid').masonry({
	  itemSelector: '.grid-item',
	  columnWidth: '.grid-sizer',
	  percentPosition: true
});
$(document).ready(function(){
	var btnob = {"id":null , "btn" : null};
	$(".btn").on('click',function(){
		btnob.id = $(this).prop('id');
		if ($(this).hasClass("rejBtn")){
			btnob.id = $(this).prop('id');
			btnob.btn = "rejBtn";
		}else if ($(this).hasClass("accBtn")){
			btnob.id = $(this).prop('id');
			btnob.btn = "accBtn";
			alert("친구 요청이 되었습니다~!~!\n축하합니다.")
		}
		
		var data = {"fr" : JSON.stringify(btnob)};
		$.ajax({
			type:'POST',
			dataType:'json',
			data:data,
			url:"frBtn.do",
			success:function(data){
				location.reload();
			}
		});
	});
});
</script>
		
</body>
</html>