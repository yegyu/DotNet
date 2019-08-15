<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 사이드바  1-1 start-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .card-back {
        display: none;
    }
    .modal{
    overflow-y: auto;
}
</style>
<jsp:include page="../mypage.do"/>
<main class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">내 최근 참여 설문</h2>
		<hr>
		<h5>내 설문관리 > 내 최근 참여 설문</h5>
		<hr>
		<!-- 사이드바  1-1 end -->



<div class="container-fluid">
    <br>
    <c:forEach var="arrRow" items="${twoDArr }" varStatus="ri">
        <div class="row">
            <c:forEach var="arrCol" items="${arrRow }" varStatus="ci">
                <c:if test="${arrCol !=null }">
                    <c:set var="rand" value="${ Math.random() * 10 } " />

                    <div class="card card-front" id="f${ri.index}f${ci.index}"
                        style="width: 200px; margin-left: 30px; margin-right: 30px; margin-botton:30px">
                        <h1 align="center">${arrCol.id}</h1>
                        <fmt:parseNumber var="r" integerOnly="true" value="${rand}" />

                        <img class="card-img-top" src="/DotNet/defaultImg/${emo[r mod 3] }" alt="Card image"
                            style="width: 170px;height:180px;">
                        <div class="card-body">
                            <p> &nbsp;&nbsp;&nbsp;</p>
                                <%-- 							location :${arrCol.location } email : ${arrCol.email } r mod 3:${r mod 3 } emotion : ${emo[r mod 3]}</p> --%>
                                <button class="btn reqBtn" id="${arrCol.id } " data-toggle="modal" >친구 요청</button>
                        </div>
                    </div>

                </c:if>
            </c:forEach>

	<!-- 사이드바 2-2 start --> 
	</div>
	 </c:forEach>
</div>
<!-- 사이드바 2-2 end --> 
        </div>
        <br>
   
</div>
</main>
<div class="modal fade" id="rrr" tabindex="-1" role="dialog" aria-labelledby="reqFrLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reqFrLabel">친구 요청</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="reqMsg" class="col-form-label">아이디</label>
            <input type="text" class="form-control" id="idFuFr" >
          </div>
          <div class="form-group">
            <label for="reqMsg" class="col-form-label">인사글을 남겨보세요~~</label>
            <textarea rows="5" class="form-control" id="reqMsg"></textarea>
          </div>
          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" id="reqFrBtn">친구 요청</button>
      </div>
    </div>
  </div>
</div>

<script>


function reqFriend(data1){
	$.ajax({
		data:data1,
		type:"post",
		dataTyp:"text",
		url:"reqFrAsk.do",
		success:function(data){
			switch(data){
			case "0":alert("본인 아이디네요 ㅎㅎ");break;
			case "1":alert("이미 친구 요청 상태이네요 한번확인해 보세요");break;
			case "2":alert("현재 친구 상태입니다.");break;
			case "3":alert("어이쿠 현재 차단상태입니다. 자세한 사항은 문의해주세요");break;
			case "4":alert("친구 요청이 완료됐습니다. 요청 수락까지 기다려 주세요.");break;
			default :alert("알수 없는 결과내요 문의 주시면 고맙겠습니다.")
			}
			$('#rrr').modal('hide');
		}
	})
}
var frid;
	
	$('.reqBtn').on('click',function(){
		$('#rrr').modal('show');
		frid=$(this).attr('id');
		$('#idFuFr').val(frid);
		$('#idFuFr').prop("readonly",true);
	});
	$('#reqFrBtn').on('click',function(){
		if($('#reqMsg').val() ==""){			
			var confirmFrMsg = confirm('글을 남기지 않겠습니까?')
			if(confirmFrMsg){
				var data2 = {id : frid, title:"친구 요청" , contents:"친구 요청이 들어오셨어요 ㅎㅎㅎ" }
				reqFriend(data2)
				
			}else{
				return false;
			}
		
		}else{
			var data1 = {id : frid, title:"친구 요청" ,	 contents:$('#reqMsg').val() }
			reqFriend(data1);
		}
		
	});
</script>
</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->