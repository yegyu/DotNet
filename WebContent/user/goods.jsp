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
<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do"/>
<div class="page-content">
        <div class="container-fluid card">
<!--             <div class="row"> -->
	            <h2 class="mt-3">내 최근 참여 설문</h2>
	            <hr>
	            <h5>내 설문관리 > 내 최근 참여 설문</h5>
	            <hr>
<!--             </div> -->
            <div class="row">
                <!-- 사이드바  1-1 end -->
                <div class="col-md-6">
                    <div class="card" >
                        <div class="card-title">
                            <h2 align="center">상품 리스트</h2>
                            <hr>
                        </div>
                        <ul class="list-group list-group-horizontal" style="align-content: center">
                            <c:forEach var="goods" items="${goodslist}">
                                <li class="list-group-item  list-group-item list-group-item-action"
                                    id="${goods.g_name } ${goods.g_num }" style="width: 20%" value="${goods.g_point }">
                                    ${goods.g_name }</li>
                            </c:forEach>
                        </ul>
                        <br>
                        <br>

                        <div class="col">
                            <table>
                                <tr>
                                    <th>내 포인트</th>
                                    <td><input type="text" readonly="readonly" id="myPo" value="${point}"
                                            style="margin-left:;"><br></td>
                                </tr>
                                <tbody id="selgoods">

                                </tbody>
                                <tr>
                                    <th>결제 후</th>
                                    <td><input type="text" readonly="readonly" id="fuMy" ><br></td>
                                </tr>
                            </table>
                            <br>
                            <div class="btn-group">
                                <button value="" class="btn btn-primary" style="" id="doPay"
                                    onclick="checkPay()">결제하기</button>
                                &nbsp;&nbsp;&nbsp;
                                <button value="" class="btn btn-success" id="reset" onclick="reset()">초기화</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="shadow bg-white">
                        <h2 align="center">결제 순서</h2>
                        <ol>
                            <li>리스트의 상품을 선택합니다.</li>
                            <li>결제란에 수량을 적습니다.</li>
                            <li>결제후 포인트가 마이너스가 아니라면 결제 버튼을 누릅니다.(마이너스상태에서 결제는 되지 않습니다.)</li>
                            <li>결제가 완료됩니다.</li>
                        </ol>
                    </div>
                </div>


                <!-- 사이드바 2-2 start -->
            </div>
        </div>
    </div>
<!-- 사이드바 2-2 end --> 

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
					ob['g_num'+i] = $('.gc'+i).prop('id').split(" ")[1];
					ob['g_cnt'+i] = $('#gn'+i).val();
				}
				$("#fuMy").val($('#myPo').val() - sum);
				ob["myPo"] = $("#fuMy").val();
				ob['clen'] = clen;
				console.log(ob);
			},100);
		});
	});
});
</script>

</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->