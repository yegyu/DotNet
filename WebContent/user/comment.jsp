<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<div class="container-fluid">
<br>
<div class="row">

<textarea class="form-control" maxlength="50" cols="70px" rows="2px" style="font-size: 20px;" id="commentArea" placeholder="댓글을 입력하세요~!~!~!"></textarea><br>
 <button class="commentbtn btn my-3" style="position:relative; right: 0px" id="inputComment">댓글 입력</button>
</div>
<div>아이디 클릭 -> 친구 요청 </div>
 <div class="modal fade modal1" id="reqFr" tabindex="-1" role="dialog" aria-labelledby="reqFrLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="reqFrLabel">친구 요청</h5>
        <button type="button" class="close" data-dismiss="" aria-label="Close" id="closeFromSurFrModal">
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
<table width="100%">
		<thead >
		<tr >
			<th width="20%" id="${s_num }">ID</th>
			<th  width="55%">내용</th>
			<th width="30%">날짜</th>	
				
		</tr>
		</thead> 
		
		<tbody id="conBody">
		<c:forEach var="con" items="${getComm}">
		<tr>
			<td class="frfr" id="${con.mem_id }" data-toggle="modal" data-target="#reqFr">${con.mem_id }</td>
			<td class="${con.state }">${con.content }</td>
			
			<td ><fmt:formatDate value="${con.dt}" pattern="yyyy-MM-dd"/>  
			<span aria-hidden="true" id="${con.mem_id}" class="del" style="cursor: pointer;" data-toggle="modal" data-target="#dr">×</span>
			 </td>
		</tr>
		</c:forEach>
		</tbody>
</table>

</div>

<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript" src="bootstrap.bundle.js"></script>

<script>

$(document).ready(function(){
	$('#inputComment').on('click',function(){
		if(session == null || session == "") {
			$(".commentbtn").attr("disabled","true");
		}
		
	    com = {"content":$('#commentArea').val(), "s_num":'${s_num}'};
	    $.ajax({
	    	type:"POST",
	    	data:com,
	    	dataType:"json",
	    	url:"comm.do",
	    	success:function(){
// 	    		console.log(com[0].mem_id + " 입니다.")
// 	    		$("#conBody").children().remove();
// 	    		for(var i =0 ; i < com.length; i++){
// 	    			$("#conBody").append("<tr><td>" + com[i].mem_id + "</td><td>"+com[i].content+"</td><td>"+getFormatDate(new Date(com[i].dt))+'<span aria-hidden="true" id="'+com[i].mem_id+'" class="del" style="cursor: pointer;" data-toggle="modal" data-target="#dr">×</span></td></tr>')
// 	    		}
				//귀찮으면 무조건 reload 
				//modal 은 자리기억이 안되나???
				location.reload();
// 	    			forDelText();
	    	}
	    	
	    });
	});
	
})
forDelText();
function forDelText(){
	$('.-1').each(function(){
		$(this).text("삭제된 답변입니다.")
	});
	
};
$('.del').on("click",function(){
	var id = $(this).prop('id')
	if($(this).parent().siblings().eq(1).hasClass('-1')){
		alert('이미 삭제됐습니다.')
		return false
	}else{
		
	var s_num = '${s_num}';
	var content = $(this).parent().siblings().eq(1).text();
	if('${sessionScope.memId}' == id){
		var dt = { "s_num" : "${s_num}", "content" : content}
		console.log(dt)
		console.log(dt["dt"])
		$.ajax({
			data:dt,
			dataType:"text",
			url:"delComm.do",
			type:"post",
			success:function(dt){
					location.reload();
			}
		});
		
	}else{
		alert('본인아이디가 아닙니다.')
	}
		
	}
	
});
// $('.modal').attr("position","absolute");
// $('.modal').css({"overflow":"auto";"heigth":"500px"});
var zIndex;
$(document).on('show.bs.modal', '.modal', function () {
    zIndex = 1040 + (10 * $('.modal:visible').length);
    $(this).css('z-index', zIndex);
    setTimeout(function() {
        $('.modal-backdrop').not('.modal-stack').css('z-index', zIndex - 1).addClass('modal-stack');
    }, 0);
});
$(document).on('hidden.bs.modal', '.modal', function () {

    $('.modal:visible').length && $(document.body).addClass('modal-open');

});

//////////모달 위에 모달이 안정하게 뜨지는 않음...

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
			$("#reqMsg").val("");
			$('#reqFr').modal('toggle');
			zIndex-=10;
// 			$('.close').click();
// 			$('.modal-backdrop').remove();
		}
	})
}
var frid;
$('.frfr').on('mouseenter',function(){
	$('body').append('<div class="animated infinite bounce " id="showBit" style="position:fixed; top:50%; left:0%;"><h1>'+$(this).text()+'와<br>좋은 친구가<br> 되겠군요...<br>Click id </h1></div>')
})
$('.frfr').on('mouseleave',function(){
	$('#showBit').remove();
});
$('.frfr').on('click',function(){
	frid=$(this).attr('id')
	$('#idFuFr').val(frid).prop("readonly",true);
		$('.modal1').css('display','block');
		if($('.modal1').css('display') == "none"){
			$('.modal1').css('display','block');
		}
	
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
$('#closeFromSurFrModal').on('click',function(){
	$('#reqFr').modal('toggle');
});
</script>
<script>
var com ;
function getFormatDate(date){ var year = date.getFullYear();	//yyyy
var month = (1 + date.getMonth());	//M 
month = month >= 10 ? month : '0' + month;	//month 두자리로 저장 
var day = date.getDate();	//d 
day = day >= 10 ? day : '0' + day;	//day 두자리로 저장 
return year + '-' + month + '-' + day; }

var session = '${sessionScope.memId}';


</script>
