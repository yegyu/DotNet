<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 사이드바  1-1 start-->
<jsp:include page="/mypage.do"/>
<div class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">회원활동 관리</h2>
		<hr>
		<h5>사이트 관리 > 회원활동 관리</h5>
		<hr>
		<!-- 사이드바  1-1 end -->
<div class="table">
  <div class="form-group row">
    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg">회 원 검 색</label>
    <div class="col-sm-8">
      <input type="text" class="form-control form-control-lg" id="searchInput" placeholder="회원 이름을 검색하세요">
    </div>
    <div class="col-auto my-1">
      <button type="button" class="btn btn-primary" id="searchButton">검색</button>
    </div>
  </div>	
<table class="table">
<thead>
	<tr class="infoRow">
		<th>아이디</th>
		<th>성별</th>
		<th>나이대</th>
		<th>포인트</th>
		<th>회원가입일</th>
		<th>상태</th>
	</tr>
</thead>
<tbody class="membersRow">
	<c:forEach var="mem" items="${memList }" >
		<tr >
			<td>${mem.id }</td>
			<td>
				<c:if test="${mem.gender == 2 }">
					여자
				</c:if>
				<c:if test="${mem.gender == 1}">
					남자
				</c:if>
			</td>
			<td>${mem.age }</td>
			<td>${mem.point }</td>
			<td>${mem.signup_date }</td>
			
			<td>
				<c:if test="${mem.userState == 0 }">
				<button class="btn memMng" name="stop" id="${mem.id}" value="1">중지</button>
				</c:if>
				<c:if test="${mem.userState == 1 }">
				<button class="btn memMng" name="recover" id="${mem.id}" value="0">회복</button>
				</c:if>
			</td>
		</tr>
	</c:forEach>
</tbody>
</table>
</div>
		<!-- 사이드바 2-2 start --> 
		
	</div>
	
</div>
</div>
<!-- 사이드바 2-2 end --> 
<script>
var id ={};
var json = {};
function stopMem(json){
	$.ajax({
		data:json,
		dataType:"text",
		url:"stopMem.do",
		type:"POST",
		success:function(data){
			console.log("stop mem succes " + data)
			$("#" + id["id"]).text("회복");
			$("#" + id["id"]).prop('name','recover');
			$("#" + id["id"]).val(0);
		}
	})
}
function recoverMem(json){
	$.ajax({
		data:json,
		dataType:"text",
		url:"recoverMem.do",
		type:"POST",
		success:function(data){
			console.log("recover mem succes " + data)
			$("#" + id["id"]).text("중지").prop('name','stop').val(1);
			
		}
	})
}
$(document).ready(function(){
	$(".memMng").on('click',function(){
		id["id"] = $(this).prop('id');
		id["state"] = $(this).val();
		json = {"json" : JSON.stringify(id)}
		console.log(json);
		//ajax
		if($(this).val() == "1"){
			stopMem(json);
		}else{
			recoverMem(json);
		}
	})
	
	// 회원검색
	$("#searchButton").on('click',
        function () {
            var data = { 
            	"search": $("#searchInput").val()
            };
            $.ajax({
                type: "POST",
                dataType: "json",
                data: data,
                url: "searchMember.do",
                success: function (data) {
                    $(".membersRow").children().remove();
                    for(var i = 0 ; i < data.length; i++){
                    	var gender = null;
                    	var button = null;
                    	if(data[i].gender == 1) {
                    		gender = "남자";
                    	} else {
                    		gender = "여자";
                    	}
                    	if(data[i].user_state == 0) {
                    		button = '<button class="btn" name="stop" id="${mem.id}" value="1">중지</button>';
                    	} else {
                    		button = '<button class="btn" name="recover" id="${mem.id}" value="0">회복</button>';
                    	}
	                    $(".membersRow").append(
	 						    '<tr>'+
		 						    '<td>'+
		 						 		data[i].id +
		 						    '</td>'+
		 						    '<td>'+
		 						    	gender +
		 						    '</td>'+
		 						    '<td>'+
		 						    	data[i].age +
		 						    '</td>'+
		 						    '<td>'+
		 						    	data[i].point +
		 						    '</td>'+
		 						    '<td>'+
	 						    		data[i].signup_date +
	 						    	'</td>'+
	 						    	'<td>' +
	 						    		button +
	 						    	'</td>' +
	 						    '</tr>'               	
	                    );
                    }
                },
                error: function (e) {
                    alert(e + "error");
                }
            });
        });

});

</script>

</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->