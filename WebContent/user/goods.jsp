<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
input {
	border: 0;
	border-bottom: 1px solid rgb(82, 82, 82);
	outline: 0;
	text-align: right;
}
</style>
<br><br>
<title>ohbh</title>
<div class="container" style=" width:500px;margin-left:0px;float:left">
<div class="shadow bg-white" style="padding:50px; width:500px;">
<h2 align="left">
상품 리스트
</h2>
<ul class="list-group list-group-horizontal" style="align-content: center">
	<c:forEach var="goods" items="${ goodslist}">
		<li class="list-group-item  list-group-item list-group-item-action" id = "${goods.g_name } ${goods.g_num }" style="width:20%" value="${goods.g_point }">${goods.g_name }</li>
	</c:forEach>
  
 
</ul>
<br><br>
<div class="row">

	<div class="col">
	<table >
		<tr>
			<th>
			내 포인트
			</th>
			<td>
		      <input type="text" readonly="readonly" id="myPo" value="${point}" style="margin-left: ;" ><br>
			</td>
		</tr>
		<tbody id="selgoods">

		</tbody>
		<tr>
			<th>
			결제 후 
			</th>
			<td>
	           <input type="text" readonly="readonly" id="fuMy" style="margin-left:;" ><br>
			</td>
		</tr>
	</table>
		<br>
		<div class="row float-center">
			<button value="" class="btn" style="" id="doPay" onclick="checkPay()">결제하기</button>&nbsp;&nbsp;&nbsp;
			<button value="" class="btn" id="reset" onclick="reset()">초기화</button>
		</div>
		</div>

	</div>
</div>
</div>
<div class="container" style="margin-left:600px;">
<div class="shadow bg-white" style="padding:50px; width:500px;">
<h2 align="center">결제 순서</h2>
<ol>
	<li>리스트의 상품을 선택합니다.</li>
	<li>결제란에 수량을 적습니다.</li>
	<li>결제후 포인트가 마이너스가 아니라면 결제 버튼을 누릅니다.(마이너스상태에서 결제는 되지 않습니다.)</li>
	<li>결제가 완료됩니다.</li>
</ol>
</div>
</div>
<!-- 			<th> -->
<!-- 			<input type="text" readonly="readonly" id="good1" style="margin-left: auto;">&nbsp;&nbsp;<input type="text" id="gn" placeholder="수량"  style="width: 50px"> -->
<!-- 			<button class="btn" type="reset" value="" style="width:60px;">취소</button><br> -->
<!-- 			</th> -->
<script>
var cnt = 0;
var sum = 0;
var ob = {};
var rob ={};
var goodsOb = {};
var clen = 0
function checkPay(){
	if( $('#fuMy').val()  < 0){
		alert("결제 포인트 초과!!")
		return false;
	}else{
			goodsOb["goods"]=JSON.stringify(ob)
			console.log(goodsOb)
		$.ajax({
			type:"POST",
			dataType:"text",
			data: goodsOb,
			url:"pay.do",
			success:function(data){
				console.log("paymet ajax 성공" + data)
				location.reload();
			},
			error: function () {
				console.log("payment ajax 실패")
			}
		});
	}
};
function reset(){
		$('.gn').val("");
		$('#fuMy').val($('#myPo').val());
		ob={};
		rob={};
		clen = 0;
// 		 $('#selgoods').children().remove();
}

$(document).ready(function(){

	$('.list-group-item').on('click',function(){
		
		$("#selgoods").append('<tr><th>'+$(this).prop("id").split(" ")[0]+'</th><td><input type="text" readonly="readonly" class = "gc' + ' gc'+ cnt +'" id="'+ $(this).prop("id") + '" style="margin-left:;" align="right">&nbsp;&nbsp;<input type="text" class="gn" id="gn'+ cnt +'" placeholder="수량"  style="width: 50px;margin-left:;" align="right">개</td></tr>')
		$(".gc"+cnt).val($(this).val())
		cnt++;
		$(this).off('click');
		clen = $('input.gn').length;
		
		$("input.gn").on('keyup',function(){
			setTimeout(function(){
				sum=0;
				for(var i = 0 ; i < clen; i++){
					sum+=$('.gc'+i).val() * $('#gn'+i).val();
// 					ob['g_name'+i] = $('.gc'+i).prop('id').split(" ")[0];
					ob['g_num'+i] = $('.gc'+i).prop('id').split(" ")[1];
// 					ob['g_point'+i] = $('.gc'+i).val();
					ob['g_cnt'+i] = $('#gn'+i).val();
// 					rob['']
// 					rob[$('.gc'+i).prop('id').split(" ")[1]]=$('#gn'+i).val();
				}
			
				$("#fuMy").val($('#myPo').val() - sum);
				ob["myPo"] = $("#fuMy").val();
				ob['clen'] = clen;
// 				rob["myPo"] = $("#fuMy").val();
// 				rob['clen'] = clen;
				
				console.log(ob);
			},100);
		});
		
	});


		
	
});
	



	
</script>