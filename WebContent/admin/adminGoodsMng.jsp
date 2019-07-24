<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
    
<br><br>
<div class="row">

<div class="col">
<h2>상품 등록</h2>
<input type="text" class="form-control" id="addGoods">
<h2>포인트 입력</h2>
<input type="text" class="form-control" id="addGoodsPoint" placeholder="숫자를 입력하세요">
</div>
<div class="col">
<button class="btn" id="addGoodsBtn">추가하기</button>
</div>
</div>
<br>
<div class="container-fluid" >
<div class="shadow p-3 mb-5 bg-white rounded" style="width:50%;" id="goodsList">
<br>
<h2>상품 목록(클릭시 삭제)</h2>
<br>
<c:forEach var ="g" items="${GoodsList }">
<button class="btn goods" id="${ g.g_name}" value="${g.g_point }">${g.g_name }</button>&nbsp;&nbsp;&nbsp;
</c:forEach>
</div>
</div>
<script>
var delGood={}

var addGood = {};
$(document).ready(function(){
	$(".goods").on('click',function(){
		delGood['g_name'] = $(this).prop('id')
		console.log(delGood)
		$(this).remove();
		$.ajax({
			data:delGood,
			type:"POST",
			url:"delGood.do",
			dataType:"text",
			success:function(data){
				console.log("del good success" + data)
			},
			error:function(){
				console.log("del good fail")
			}
		});
		
	});
	$('#addGoodsBtn').on('click',function(){
		$('#goodsList').append('<button class="btn goods" id="'+$('#addGoods').val()+'" value="'+$('#addGoodsPoint').val() +'">'+ $('#addGoods').val()+'</button>&nbsp;&nbsp;&nbsp;')
		addGood['g_name'] = $('#addGoods').val();
		addGood['g_point'] = $('#addGoodsPoint').val();
		console.log(addGood)
		$.ajax({
			type:"POST",
			url:"addGood.do",
			dataType:"text",
			data:addGood,
			success:function(data){
				console.log("addGood success" + data);
				$(".goods").on('click',function(){
					delGood['g_name'] = $(this).prop('id')
					console.log(delGood)
					$(this).remove();
					$.ajax({
						data:delGood,
						type:"POST",
						url:"delGood.do",
						dataType:"text",
						success:function(data){
							console.log("del good success" + data)
						},
						error:function(){
							console.log("del good fail")
						}
					});
					
				});
			},
			error:function(){
				console.log("addGood fail");
			}
		})
	});
});
</script>