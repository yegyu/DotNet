<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="bootstrap.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">

<title>Insert title here</title>
<style>
@media(max-length:700px){}
</style>
</head>
<body >
<!-- 상단 바 -->
	<nav class="navbar navbar-expand-md navbar-default"
		style="margin-bottom: 0px">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->
	<br>

	<div class="container">
		<hidden id = ${num }>
		<h3 align="center" id="num" >${num} 번 질문  </h3>	
		<div class="form-group">
			<div class="row">
				<div class="col-md-6">
					<label for="title" >제목</label>
					<input type="text" class="form-control" id="title" readonly="readonly" value="${ask.title }">
				</div>
				<div class="col-md-2">
					<label for="id">작성자</label>
					<input type="text" class="form-control" id ="id" readonly="readonly" value="${ask.id }">
				</div>
				<div class="col-md-3">
					<label for="passwd" id="lPasswd">질문 비밀번호 </label>
					
					<input type="password" class="form-control" id="passwd" placeholder="비밀번호 입력후 수정">
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-md-8">
					<label for="contents">내용</label>
					<textarea class="form-control" id="contents" rows="6" readonly="readonly">${ask.contents }</textarea>
					<br>
					<hr>
				</div>
				<div class="col-md-2">
					<button type="button" class="btn"  id="modi" style="margin-top:100px">수정</button>
				</div>
				
			</div>
		<br>
    	<div class="row" >
			<div class="col-md-8">
				<textarea class="form-control" maxlength="1000" cols="70px" rows="2px" style="font-size: 20px;" id="replyText" placeholder="답변"></textarea>
				<br>
			 </div>
			 <div class="col-md-2">
				<button class="btn" style="position:relative; right: 0px" id="replyBtn">답글 입력</button>
			 </div>
		</div>
<!-- 		<i class="fas fa-power-off" ></i> : 초기화 버튼<br> -->
		<div class="row">
			<div class="col-md-12">
				<div class="table">
					<table>
						<thead>
						<tr>
							<th style="width:60px">번호</th>
							<th style="width:130px">Good & Bad</th>	
							<th style="width:130px" id="${s_num }">ID</th>
							<th  style="width:700px;">답변 내용</th>
							<th style="width:210px">날짜</th>
								
						</tr>
						</thead>
						<tbody id="reBody">
						
						<c:forEach var="re" items="${replys}">
						<tr>
							<td class='tdRnum' id='${re.rnum }'>${re.rnum }</td>
							<td ><i class="far fa-thumbs-up good">${re.good }</i> <i class="far fa-thumbs-down bad">${re.bad }</i> </td><!-- <i class="fas fa-power-off" name="${re.good }_${re.bad }"></i> -->
							<td class="frfr" id="${re.id }" data-toggle="modal" data-target="#reqFr">${re.id }</td>
							<td class="${re.rState }">${re.reply }</td>
							<td><fmt:formatDate value="${re.rDate}" pattern="yyyy-MM-dd hh:mm:ss"/> 
							<span aria-hidden="true" id="del_${re.rnum }" class="del" style="cursor: pointer;" data-toggle="modal" data-target="#dr">×</span> 
							</td>
							
						</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
 </div>
 <div class="modal fade" id="reqFr" tabindex="-1" role="dialog" aria-labelledby="reqFrLabel" aria-hidden="true">
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

<div class="modal fade" id="dr" tabindex="-1" role="dialog" aria-labelledby="drl" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="drl">비밀번호</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <input type="password" class="form-control" id="delP" >
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn " id="delBtn">삭제</button>
      </div>
    </div>
  </div>
</div>
<label class="mr-sm-2 mb-0 sr-only" id="hidid">${id }</label>

	<script type="text/javascript" src="jquery-3.4.1.js"></script>
	<script type="text/javascript" src="bootstrap.bundle.js"></script>
<script>
$('.-1').each(function(){
	$(this).text("삭제된 답변입니다.")
});
var th ;
var rid;
$('.del').on('click',function(){
	if($(this).parent().siblings().eq(3).hasClass('-1')){
		alert('이미 삭제된 답글입니다.');
		return false;
	}
	th = $(this).parent().siblings().eq(0).text();
	rid = $(this).parent().siblings().eq(2).text()
	if(rid != '${sessionScope.memId}'){
		alert('본인 아이디가 아닙니다.')
		$("#dr").modal("hide")
		
		return false;
	}
});
$('#delBtn').on('click',function(){
		var d = {passwd:$('#delP').val() , "num": num , rnum:th};
		$.ajax({
			url:"delR.do",
			data:d,
			dataType:"text",
			type:"post",
			success:function(d){
				if(d == "1"){
					location.reload();
// 					$('#delP').val("");
// 					console.log($('#'+rnum).siblings().eq(2))
// 					$('#'+th).siblings().eq(2).text("삭제된 답변입니다.");
// 					$("#dr").modal("hide");
// 					$('.modal-backdrop').removeClass('show');
				}else if(d == "-1"){
					alert("비밀번호가 일치하지 않습니다.")
				}
			}
		});

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
// 			$('#reqFr').modal('toggle');
			$('.close').click();
			$('.modal-backdrop').remove();
		}
	})
}
var frid;
	$('.frfr').on('mouseenter',function(){
		$(this).css('cursor','pointer')
	})
	$('.frfr').on('mouseleave',function(){
		$(this).css('cursor','default')
	});
	$('.frfr').on('click',function(){
		frid=$(this).attr('id')
		$('#idFuFr').val(frid).prop("readonly",true);
		
	});
	$('#reqFrBtn').on('click',function(){
		if($('#reqMsg').val() ==""){			
			var confirmFrMsg = confirm('글을 남기지 않겠습니까?')
			if(confirmFrMsg){
				var data2 = {id : frid, title:"친구 요청" , contents:"친구 요청이 들어오셨어요 ㅎㅎㅎ" };
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
<!-- 스크롤 위치 쿠키에 저장 -->

  <script>
  // 질문번호,답글번호=good,bad
  // 6gb5=1gb0
  //쿠키들의 배열
	var cookies =  document.cookie.split(';')

	var ob = {}
	var numArr = [];
	var numArrIndex = 0;
	var gFlag = 0;
	var bFlag = 0;
	var rnum;
	var num =parseInt($('hidden').eq(0).prop('id'));
	var arrr =[];
	var arrr = [];
	var d;
  	var setCookie = function(name, value, exp) {
	  var date = new Date();
	  date.setTime(date.getTime() + exp*24*60*60*1000);
	  document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
	};
	
	
	function checkGB(){
// 		var re = new RegExp('/^ {'+num+'}'+'[gb]/')
// 		var newArr =cookies.filter(function(i,ind,arr){
// 		    	return !!~i.search(re);
// 		    });
// 		console.log(newArr);
// 		newArr.forEach(function(item,index, array){
// 			var c = cookies[index].split('=');
// // 			[num , rnum]
// 			var numRnum = c[0].split('gb');
// // 			[good , bad]
// 			var gbgb = c[1].split("gb");
// // 			if(numRnum[0] == ' '+ num ){
// 				//질문 답글 번호가 같은 것
// 				if($('.tdRnum').eq(j).text()== numRnum[1]){
// 					var d = $('.tdRnum').eq(j).next().children();
// 					j++;
// 					console.log(j)
// 					if(gbgb[0]==1){
// 						//gFlag == 1
// 						d.eq(0).css('color','gold')
// 					}else if(gbgb[1]==1){
// 						//bFlag ==1 
// 						d.eq(1).css('color','gold')
// 					}
// 				}			
// // 			}
// 		})
		var j = 0 ;
		 for(var i = 0 ; i < $('.tdRnum').length ; i++){arrr[i] = $('.tdRnum').eq(i).text()}
		for(var i =0;i < cookies.length; i++){
			//c 는 배열들의 집합['num gb rnum','good gb bad']
			var c = cookies[i].split('=');
// 			[num , rnum]
			var numRnum = c[0].split('gb');
// 			[good , bad]
			var gbgb = c[1].split("gb")
			
			//질문번호가 같은것
			if(numRnum[0] == ' '+ num ){
				//질문 답글 번호가 같은 것
				if(arrr.includes(numRnum[1])){
					d = $('#'+numRnum[1]).next().children();//;
// 					j++;
					if(gbgb[0]==1){
						//gFlag == 1
						d.eq(0).css('color','gold')
					}else if(gbgb[1]==1){
						//bFlag ==1 
						d.eq(1).css('color','gold')
					}
				}	
				
			}
		}
	};
	
	 function SetDivPosition()
	 {
	  var intY = document.body.scrollTop;
	  document.cookie = "yPos=!~"+intY+"~!";
	 }
 
	if($('#reBody').children().length == 0){
		$('div.table').append('<br><br><h1 class="animated infinite bounce">첫 답변을 해주세요 ^^</h1>')
	}else{
		$('div.table > h1').remove();
	}
	
	//Good & Bad & pointer Func
	function forGoodBad(){
		$('.far, .fas').on('mouseenter',function(){
			$(this).css({"font-size":"20px"})
		});
		$('.far, .fas').on('mouseleave',function(){
			$(this).css("font-size","17px")
		});
		$('.fas').on('click',function(){
			var g = $(this).attr('name').split("_")[0]
			$(this).siblings().eq(0).text(g)
			var b = $(this).attr('name').split("_")[1]
			$(this).siblings().eq(1).text(b)
			ob = {};
			numArr = [];
			numArrIndex = 0;
		});
		
		//ajax good
		$('i.far').on('click',function(){
			rnum = $(this).parent().siblings().eq(0).text();
			
// 			if(!numArr.includes(eval(num))){
				ob[rnum] ={};
// 				console.log("0")
// 				numArr[numArrIndex] = eval(num);
// 				numArrIndex++;
				ob[rnum]["good"] = 0; ob[rnum]['bad'] = 0; ob[rnum]['gFlag'] = 0; ob[rnum]['bFlag'] = 0 ;
// 			}
			var firstCookie = true;
			//  num=1gb0
			for(var i = 0 ; i < document.cookie.split(';').length ; i++){
				var r = document.cookie.split(';')[i].split('='); 
				if(r[0]  == ' '+num+'gb'+rnum ){
					var g = r[1].split('gb')[0];
					var b = r[1].split('gb')[1];
// 					console.log("if 문 안의 쿠키 g : " + g + ",b " + b)
					ob[rnum]['gFlag'] =eval( g);
					ob[rnum]['bFlag'] = eval(b);
// 					console.log('ob[num][gflag] : ' + ob[rnum]['gFlag'] + ", bFlag : "+ob[rnum]['bFlag'])
					firstCookie =false;// 아래서 쓰임 cookie set 할떼
					break;
				}
			}
// 					console.log('ob[num][gflag] : ' + ob[rnum]['gFlag'] + ", bFlag : "+ob[rnum]['bFlag'])
			
			if($(this).hasClass('good')){
				if(ob[rnum].gFlag == 1){
// 					console.log("1")
					good = eval($(this).text()) - eval(1);
					bad = eval($(this).next().text());
					ob[rnum]['gFlag'] = 0;
					ob[rnum]['bFlag'] = 0;
					$(this).text(good);
					$(this).css("color","black")
					
					//ob[num]['gFlag'] == 0 이다
					//이미 bad를 누른 상태 --> change
				}else if(ob[rnum]['bFlag'] == 1){ 
// 					console.log("2")
					good = eval($(this).text()) + eval(1);
					bad = eval($(this).next().text()) - eval(1);
					ob[rnum]['gFlag'] = 1;
					ob[rnum]['bFlag'] = 0;
					$(this).text(good);
					$(this).next().text(bad);
					$(this).css('color','gold');
					$(this).next().css('color','black')
					
					
					//둘다 아직 안눌렀다.
				}else{
// 					console.log("3")
// 					console.log(ob[rnum].gFlag)
					good = eval($(this).text()) + eval(1);
					bad = eval($(this).next().text());
					ob[rnum]['gFlag'] = 1;
					ob[rnum]['bFlag'] = 0;
					$(this).text(good);
					$(this).css('color','gold');

				}
				
				//hasClass('bad') == true
			}else{
				if(ob[rnum]['bFlag'] == 1){
// 					console.log("4")
					bad = eval($(this).text()) - eval(1);
					good = eval($(this).prev().text()) ;
					ob[rnum]['bFlag'] = 0;
					ob[rnum]['gFlag'] = 0;
					$(this).text(bad);
					
					$(this).css("color",'black');
					//ob[num]['bFlag'] == 0 이다
					//이미 good를 누른 상태 --> change
				}else if(ob[rnum]['gFlag'] == 1){ 
// 					console.log("5")
					bad = eval($(this).text()) + eval(1);
					good = eval($(this).prev().text()) - eval(1);
					ob[rnum]['bFlag'] = 1;
					ob[rnum]['gFlag'] = 0;
					$(this).text(bad);
					$(this).prev().text(good);
					$(this).css('color','gold')
					$(this).prev().css("color",'black');
					
					//둘다 아직 안눌렀다.
				}else{
// 					console.log("6")
					bad = eval($(this).text()) + eval(1);
					good = eval($(this).prev().text());
					ob[rnum]['bFlag'] = 1;
					ob[rnum]['gFlag'] = 0;
					$(this).text(bad);
					$(this).css('color','gold')
				}
			}
// 			console.log(ob)
			
// 			setCookie 
// 			setCookie(num+'gb'+rnum,  ob[rnum]['gFlag'] + "gb" + ob[rnum]['bFlag'],  365);
			if(setCookie(num+'gb'+rnum,  ob[rnum]['gFlag'] + "gb" + ob[rnum]['bFlag'],  365)){
				console.log("set cookie!!")
			}
			ob[rnum]["good"] = good; ob[rnum]['bad'] = bad; 
		
			
			ob[rnum]["num"] = num;
			
			var dt = {"gb" : JSON.stringify(ob) };
			console.log(dt)
			$.ajax({
				data:dt,
				dataType:"text",
				type:"post",
				url:"goodBad.do",
				success:function(data){
					console.log("좋아요 성공 : " + data)
					
				}
				
			});
		});
	};
	checkGB();
	forGoodBad();
	
function formatDate(date) {
		
		var m = eval(date.getMonth()+1);
			m = m >=10 ? m:'0'+m;
		var d = date.getDate();
			d = d>=10? d:'0'+d;
		var h = date.getHours();
			h = h>=10?h:'0'+h;
		var mi = date.getMinutes();
			mi =mi>=10?mi:'0'+mi;
		var s = date.getSeconds();
			s = s>=10?s:'0'+s;
	
		  return date.getFullYear() + '-' + 
		    m  + '-' + 
		    d + ' ' + 
		    h + ':' + 
		    mi + ':'+
		    s;
		}
	var aid = 	$('#hidid').text();
	$(document).ready(function(){
		
		//reply
		$("#replyBtn").on('click',function(){
			if(aid == ""){
				alert("회원만 답변 가능 ㅎㅎ");
				return false;
			}else if($("#replyText").val() =="" ){
				alert("글을 입력해 주세요^^");
				return false;		
			}else{
				var dt = {num : $('#num').text().split(' ')[0],id : aid , reply : '<pre>' + $('#replyText').val() + '</pre>'}
				console.log("reply input data : "+dt.num+" ," + dt.id + " ," + dt.reply)
				$.ajax({
					data:dt,
					dataType:"json",
					type:"post",
					url:"reply.do",
					success:function(re){
						console.log(re.id + " 입니다.")
// 			    		$('.row').children('.spinner-border').remove();
// 			    		$("#reBody").children().remove();
// 			    		var reArr = [];
// 			    		for(var i =0 ; i < re.length; i++){
// 			    			reArr[i] = $("<tr><td>"+re[i].rnum+"</td><td>" +
// 			    					"<i class='far fa-thumbs-up'></i>"+re[i].good  +" <i class='far fa-thumbs-down'></i>" +re[i].bad +"</td>"+
// 			    					"</td><td>" + re[i].id + 
// 			    					"</td><td>"+re[i].reply+"</td><td>"+formatDate(new Date(re[i].rDate))+
// 			    					"</td></tr>").hide().fadeIn(1000);
// 			    			$("#reBody").append(reArr[i]);
// 			    		}
						getReNow = $("<tr><td>"+re.rnum+"</td><td>" +
			    					"<i class='far fa-thumbs-up good'>"+re.good  +"</i>  <i class='far fa-thumbs-down bad' >" +re.bad + " </i> </td>"+
			    					"</td><td>" + re.id + 
			    					"</td><td>"+re.reply+"</td><td>"+formatDate(new Date(re.rDate))+
			    					"</td></tr>").hide().fadeIn(1000);
			    			$("#reBody").prepend(getReNow);
			    		$('div.table > h1').remove();
			    		var power = $('<h1>답변은 큰 힘이 됩니다. ^^</h1>').addClass("animated infinite bounce");
			    		$('div.table').prepend(power);
			    		setTimeout(function(){
			    			$('div.table > h1').removeClass().addClass('animated fadeOutUp');
			    		},2000);
			    		
			    		setTimeout(function(){
			    			$('div.table > h1').remove();
			    		},3000);
			    		
// 			    		SetDivPosition();
			    		setTimeout(function(){
			    			location.reload();
			    		},3000)
			    		//forGoodBad();
					}
					
					
				});
			}
			
			
		});
		
		
		//modify 
		$("#modi").on('click',function(){
			if($('#contents').attr("readonly") == "readonly"){
				alert('수정할 수 없습니다.')
				return false;
			}else{
				
				
				var dt = {num : $('#num').text().split(' ')[0], title: $("#title").val() , contents: $("#contents").val() }
				console.log("modi ajax data : " +dt)
				$.ajax({
					data:dt,
					dataType:"text",
					type:"post",
					url:"modiAsk.do",
					success:function(rs){
						if(rs ="1"){
							alert("질문 수정 완료!!!!!!!");
							$("#passwd").val("");
							$('#contents').attr("readonly" ,true);
							$('#title').attr("readonly",true);
							
						}
						
					}
				});
			}
		});
		
		
		
		//passwd validation
		$("#passwd").on('keyup',function(){
			var dt = {passwd:$(this).val(), num : $('#num').text().split(' ')[0]}
// 			console.log(dt)
			$.ajax({
				data:dt,
				dataType:"text",
				type:"post",
				url:"APC.do",
				success:function(rs){
// 					console.log("rs : " + rs + " , typeof rs" + typeof rs)
					if(rs == "true"){
						$("#lPasswd").children().remove()
						$("#lPasswd").append('<i class="fas fa-check-circle"></i>');
						$('#contents').attr("readonly" ,false);
						$('#title').attr("readonly",false);
						
					}else if(rs == "false"){
						$("#lPasswd").children().remove()
						$("#lPasswd").append('<i class="fas fa-times"></i>');
						$('#contents').attr("readonly" ,true);
						$('#title').attr("readonly",true);
					}
				}
			});
		});
	});
	
	
	</script>
	<!-- 스크롤 위치 기억하여 뿌려주기 시작 -->
<script language="javascript" for="plan6" event="onload">

//plan6이라는 frame이 onload될때 스크립트를 실행.

 var strCook = document.cookie;//저장된 쿠키 값을 받아온다.
 if(strCook.indexOf("!~")!=0) {
  var intS = strCook.indexOf("!~");
  var intE = strCook.indexOf("~!");
  var strPos = strCook.substring(intS+2, intE);//스크롤 위치를 구한다.
  document.body.scrollTop = strPos;//스크롤 위치를 적용시킨다.
  }
 document.plan6.resizeFrame(this);
</script>


</body>
</html>