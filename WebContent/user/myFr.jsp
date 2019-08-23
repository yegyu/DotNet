<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<style>
    .card-back {
        display: none;
    }
    
    .card-front:hover{
    	border : 2px solid rgba(227, 179, 255, 0.938) ;
    }



</style>
<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do" />
<div class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">내 친구 관리</h2>
		<hr>
		<h5>내 친구 관리 > 친구신청 현황</h5>
		<hr>
		<!-- 사이드바  1-1 end -->
		
		

<div class="container-fluid">
	<div class="grid">
	 	<div class="grid-sizer col-md-3"></div>
    	<c:forEach var="r" items="${getRealFrBtn }" varStatus="ri">
        	<div class="grid-item col-md-3 mb-4">
			      <div class="card">
			        <div class="card-header">
			          ${r }
			        </div>
			        <div class="card-body">
			       	 	<img class="card-img" src="/DotNet/defaultImg/fr1.gif">
			            <footer class="btn-footer">
			            	<button class="btn rejBtn" id="${r }"  >
			            		차단
			            	</button>
			            </footer>
			        </div>
			      </div>
			   </div>
		</c:forEach>
	</div>
</div>
</div>
 </div>
</div>
<!-- 사이드바 2-2 end --> 
 <script type="text/javascript" src="/DotNet/js/jquery-3.4.1.js"></script>
<script type="text/javascript" src="/DotNet/js/bootstrap.bundle.js"></script>
<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
 
<script>
$('.grid').masonry({
	  itemSelector: '.grid-item',
	  columnWidth: '.grid-sizer',
	  percentPosition: true
	});
$(document).ready(function(){
	var btnob = {"id":null , "btn" : "rejBtn"};
	$(".rejBtn").on('click',function(){
		btnob.id = $(this).prop('id');
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
// 	$('.card-body > button').on('click',function(){
// 		if ($(this).hasClass("rejBtn")){
// 			btnob.id = $(this).prop('id');
// 			btnob.btn = "rejBtn";
// 		}else if ($(this).hasClass("accBtn")){
// 			btnob.id = $(this).prop('id');
// 			btnob.btn = "accBtn";
// 		}else if($(this).hasClass("reqBtn")){
// 			btnob.id = $(this).prop('id');
// 			btnob.btn = "reqBtn";
// 		}
		
// 		var data = {"fr" : JSON.stringify(btnob)};
// 		console.log(data);
// 		$.ajax({
// 			type:'POST',
// 			dataType:'json',
// 			data:data,
// 			url:"frBtn.do",
// 			success:function(data){
// 				location.reload();
// 			},
// 			error:function(){
// 				alert("error");
// 			}
			
// 		});
		
// 	});
			
});
</script>
</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->