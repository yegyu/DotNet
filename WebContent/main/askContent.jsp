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

</style>
</head>
<body onscroll="SetDivPosition()">
<!-- 상단 바 -->
	<nav class="navbar navbar-expand-md navbar-default"
		style="margin-bottom: 0px">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->
	<br>

	<div class="container">
		
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
							<th style="width:5%">번호</th>
							<th style="width:11%">Good & Bad</th>	
							
							<th style="width:10%" id="${s_num }">ID</th>
							<th  style="width:45%">답변 내용</th>
							<th style="width:20%">날짜</th>
								
						</tr>
						</thead>
						<tbody id="reBody">
						
						<c:forEach var="re" items="${replys}">
						<tr>
							<td>${re.rnum }</td>
							<td><i class="far fa-thumbs-up good">${re.good }</i> <i class="far fa-thumbs-down bad">${re.bad }</i> </td><!-- <i class="fas fa-power-off" name="${re.good }_${re.bad }"></i> -->
							<td>${re.id }</td>
							<td>${re.reply }</td>
							<td><fmt:formatDate value="${re.rDate}" pattern="yyyy-MM-dd hh:mm:ss"/>  </td>
						</tr>
						</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
 </div>
<label class="mr-sm-2 mb-0 sr-only" id="hidid">${id }</label>





	<script type="text/javascript" src="jquery-3.4.1.js"></script>
	<script type="text/javascript" src="bootstrap.bundle.js"></script>

<!-- 스크롤 위치 쿠키에 저장 -->

  <script>


	
 function SetDivPosition()
 {
  var intY = document.body.scrollTop;
  document.cookie = "yPos=!~"+intY+"~!";
 }
 </script>
	<script>
	if($('#reBody').children().length == 0){
		$('div.table').append('<br><br><h1 class="animated infinite bounce">첫 답변을 해주세요 ^^</h1>')
	}else{
		$('div.table > h1').remove();
	}
	var ob = {}
	var numArr = [];
	var numArrIndex = 0;
	var gFlag = 0;
	var bFlag = 0;
	//Good & Bad & pointer Func
	function forGoodBad(){
		$('.far, .fas').on('mouseenter',function(){
			$(this).css({"cursor":"pointer","color":"gold"})
		});
		$('.far, .fas').on('mouseleave',function(){
			$(this).css("color","black")
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
		var num;
		//ajax good
		$('i.far').on('click',function(){
			
			num = $(this).parent().siblings().eq(0).text();
			if(!numArr.includes(eval(num))){
				ob[num] ={};
				console.log("0")
				numArr[numArrIndex] = eval(num);
				numArrIndex++;
				ob[num]["good"] = 0; ob[num]['bad'] = 0; ob[num]['gFlag'] = 0; ob[num]['bFlag'] = 0 ;
			}
			console.log(ob[num]['gFlag'])
			if($(this).hasClass('good')){
				if(ob[num]['gFlag'] == 1){
					console.log("1")
					good = eval($(this).text()) - eval(1);
					bad = eval($(this).next().text());
					ob[num]['gFlag'] = 0;
					ob[num]['bFlag'] = 0;
					$(this).text(good);
					
					//ob[num]['gFlag'] == 0 이다
					//이미 bad를 누른 상태 --> change
				}else if(ob[num]['bFlag'] == 1){ 
					console.log("2")
					good = eval($(this).text()) + eval(1);
					bad = eval($(this).next().text()) - eval(1);
					ob[num]['gFlag'] = 1;
					ob[num]['bFlag'] = 0;
					$(this).text(good);
					$(this).next().text(bad);
					
					
					//둘다 아직 안눌렀다.
				}else{
					console.log("3")
					console.log
					good = eval($(this).text()) + eval(1);
					bad = eval($(this).next().text());
					ob[num]['gFlag'] = 1;
					ob[num]['bFlag'] = 0;
					$(this).text(good);
				}
				
				//hasClass('bad') == true
			}else{
				if(ob[num]['bFlag'] == 1){
					console.log("4")
					bad = eval($(this).text()) - eval(1);
					good = eval($(this).prev().text()) ;
					ob[num]['bFlag'] = 0;
					ob[num]['gFlag'] = 0;
					$(this).text(bad);
					//ob[num]['bFlag'] == 0 이다
					//이미 good를 누른 상태 --> change
				}else if(ob[num]['gFlag'] == 1){ 
					console.log("5")
					bad = eval($(this).text()) + eval(1);
					good = eval($(this).prev().text()) - eval(1);
					ob[num]['bFlag'] = 1;
					ob[num]['gFlag'] = 0;
					$(this).text(bad);
					$(this).prev().text(good);
					
					//둘다 아직 안눌렀다.
				}else{
					console.log("6")
					bad = eval($(this).text()) + eval(1);
					good = eval($(this).prev().text());
					ob[num]['bFlag'] = 1;
					ob[num]['gFlag'] = 0;
					$(this).text(bad);
				}
			}
			ob[num]["good"] = good; ob[num]['bad'] = bad; 
			console.log(ob);
		});
	};
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
			    		
			    		SetDivPosition();
			    		forGoodBad();
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