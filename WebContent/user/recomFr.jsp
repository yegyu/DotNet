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
<div class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">추천 친구들</h2>
		<hr>
		<h5>내 친구 관리 > 추천 친구들</h5>
		<hr>
		<!-- 사이드바  1-1 end -->



<div class="container-fluid">
	<div class="grid">
	 	<div class="grid-sizer col-md-3"></div>
    	<c:forEach var="r" items="${recomFr }" varStatus="ri">
        	<div class="grid-item col-md-3 mb-4">
			      <div class="card">
			        <div class="card-header">
			          ${r.id }
			        </div>
			        <div class="card-body">
			       	 	<img class="card-img" src="/DotNet/defaultImg/fr1.gif">
			            <footer class="btn-footer">
			            	<button class="btn reqBtn" id="${r.id } " data-toggle="modal" >
			            		친구 요청
			            	</button>
			            </footer>
			        </div>
			      </div>
			   </div>
		</c:forEach>
	</div>
</div>
<!-- 사이드바 2-2 end --> 
        </div>
        <br>
   
</div>
</div>
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
	<script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>

<script>
$('.grid').masonry({
	  itemSelector: '.grid-item',
	  columnWidth: '.grid-sizer',
	  percentPosition: true
	});

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