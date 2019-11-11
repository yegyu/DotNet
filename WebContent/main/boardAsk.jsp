<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.css">
<style>
/* div.table { */
/* 	height: 600px; */
/* 	overflow: auto; */
/* } */
</style>
<head>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
</head>
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

		<div class="row">
			<div class="col-sm-8">
				<h1 align="center" class=" animated rubberBand delay-0.5s">물어보세요 .Net (총 질문 : ${asksCnt })</h1>
			</div>
			<div class="col-sm-1">
				<button type="button" class="btn" id="askA" data-toggle="modal"
					data-target="#askModal" >문의하기</button>
			</div>
			<div class="col-sm-1">
				<a href="askComp.do"><button type="button" class="btn" >기업 문의</button></a>
					
			</div>
		</div>
		<br>
		<div class="table">
			<table class="table table-bordered">
				<tr>
					<th width="8%">글 번호</th>
					<th width="50%">제목</th>
					<th width="15%">아이디</th>
					<th width="20%">날짜</th>
					<th width="8%">조회수</th>
				</tr>
				<tbody id="askBody">
					<c:if test="${asks != null }">
<%-- 						<c:set var="l" value="${asksCnt}"/> --%>
						<c:forEach var="el" items="${asks }">
						
							<tr class=${el.aState }>
								<th>${el.num }</th>
								<th>
									<a href="askContent.do?num=${el.num }" class="${el.secret}">${el.title}</a>
								</th>
								<th>${el.id}</th>
								<th>${el.aDate}</th>
								<th>${el.views}</th>
							</tr>
<%-- 							<c:set var="l" value="${l -1 }"/> --%>
						</c:forEach>
					</c:if>
				</tbody>
			</table>
		</div>
	</div>

	<div class="modal fade" id="askModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">질문 창</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="askForm">
						<div class="form-group">
							<label for="askTitle" class="col-form-label">제목</label>
							<input type="text" class="form-control" id="askTitle">
						</div>
						<c:if test="${sessionScope.memId == null }">
							<label for="askId" class="col-form-label">아이디</label>
							<input type="text" class="form-control" id="askId" placeholder="비회원용 아이디" required>
						</c:if>
						<div class="form-group">
							<label for="askPasswd" class="col-form-label">비밀번호</label>
							<div class="row">
								<div class="col-sm-6">
									<input type="password" class="form-control" id="askPasswd" placeholder="비밀번호를  입력해주세요">
								</div>
								<div class="col-sm-4 my-auto mx-auto">
									<h5 align="center">비밀글 선택</h5>
								</div>
								<div class="col-sm-2">
									<input type = "checkbox" class="form-control" id="SecretCheck">
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="askContents" class="col-form-label">내용</label>
							<textarea class="form-control" id="askContents"></textarea>
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="askSubmit" type="button" class="btn btn-primary" data-dismiss="" onclick="return checkAsk()" >작성완료</button>
					<input type="reset" class="btn btn-secondary" form="askForm">
						
				</div>
			</div>
		</div>
	</div>
	<!-- 비밀글 들어가기 위한 (비밀번호 입력)모달 -->
	<div class="modal fade" id="secPasswdModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title animated bounceInDown" id="exampleModalLongTitle">비밀번호가 일치해야 볼 수 있습니다.</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="secForm">
						<div class="form-group">
							<label for="askPasswd" class="col-form-label">비밀번호</label>
							<input type="password" class="form-control" id="secPasswd" placeholder="비밀번호를  입력해주세요">
						</div>
					</form>
				</div>
				<div class="modal-footer">
					<button id="secSubmit" type="button" class="btn btn-primary" data-dismiss="" onclick="" >확인</button>
					<input type="reset" class="btn btn-secondary" form="secForm">
						
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="js/jquery-3.4.1.js"></script>
	<script type="text/javascript" src="js/bootstrap.bundle.js"></script>
	<label class="mr-sm-2 mb-0 sr-only" id="hidid">${id }</label>
	<script>
	
	//관리자는 비밀글안보이고 바로 free-pass 없음.
	function adminForSecAsk(){
		if($('#hidid').text() == 'admin'){
			$('a.1').removeClass('1').addClass('0');
		}	
	}
	
	var dataS;
	var numS;
	//num 받기 위한
	function secFunc(){
		$('a.0').on('click',function(){
			numS = $(this).parent().siblings().eq(0).text();
		});
		$("a.1").on('click',function(){
			numS = $(this).parent().siblings().eq(0).text();
			
// 			$(this).attr('href','')
// 			$("#secPasswdModal").modal()
			
		});
		//비밀글 비밀번호 check and pass or not in modal
		$('#secSubmit').on('click',function(){
			if($('#secPasswd').val() == ""){
				alert("비밀번호를 확인해 주세요");
				return false;
			}else{
			 	
				dataS = { secPasswd : $('#secPasswd').val() , num :eval( numS)}
			 	console.log(dataS.secPasswd +" , " + dataS.num);
			 	$.ajax({
			 		data:dataS,
			 		type:"post",
			 		url:"secretPass.do",
			 		dataType:"text",
			 		success:function(check){
			 			if(check == "true"){
			 				location.href = "askContent.do?num=" + dataS.num;
			 			}else{
			 				alert("비밀번호가 일치하지 않아요 ㅠㅠ")
			 				return false;
			 			}
			 		}
			 	});
			}
		});
	}
	

	// 아이디에 비회원 띄우기
	function noMem(){ $('tr.1').each(function(d,item){
			if($(item).children().eq(2).text().indexOf('비회원') == -1){
				$(item).children().eq(2).append(' (비회원)')
			}
		});
	}
	// 비밀글 누를 시 modal
	function sec(){ 
		$('a.1').each(function(d,i){
			$(this).text('비밀글')	
			$(this).on('click',function(){
				$('#secPasswdModal').modal()
				return false;
			});
		});
	}
	adminForSecAsk();
	sec();
	secFunc();
	noMem();
	
	let rownum = 0;
	let end = 0;
	//무한 스크롤 용
	$(function(){
		$(window).scroll(function(){
			let $window = $(this);
			let scrollTop = $window.scrollTop();
			let windowHeight = $window.height();
			let documentHeight = $(document).height();
// 				console.log("documentHeight : " + documentHeight + " , scollTop : " + scrollTop + " , windowHeight : "+ windowHeight	);
				if(scrollTop + windowHeight + 10 > documentHeight){
					if( $('#askBody > tr:last-child() > th:nth-child(1)').text() != "1"){
						rownum +=10;
						var dt = {rn : rownum.toString()};
						//크게 의미가 없음
// 						$('div.table').append('<div class="d-flex justify-content-center"><div class="spinner-grow text-primary" role="status"></div> '
// 								  +'<div class="spinner-grow text-secondary" role="status"></div>'
// 								  +'<div class="spinner-grow text-success" role="status"></div>'
// 								  +'<div class="spinner-grow text-danger" role="status"></div>'
// 								  +'<div class="spinner-grow text-warning" role="status"></div>'
// 								  +'<div class="spinner-grow text-info" role="status"></div>'
// 								  +'<div class="spinner-grow text-light" role="status"></div>'
// 								  +'<div class="spinner-grow text-dark" role="status"></div>'
// 								  +'</div>')
						$.ajax({
							data:dt,
							type:"post",
							dataType:"json",
							url:"loadAsks.do",
							success:function(data){
// 								$('div.d-flex').remove();
//								하나씩 나오게 그러나 너무 스크롤이 느림
// 								$("#askBody").append('<tr class="'+data.aState+'"><th>'+data.num+'</th><th><a href="askContent.do?num='+data.num+'"  >  '+data.title+'</a></th>'+
// 										'<th>'+data.id+'</th>'+
// 										'<th>'+formatDate(new Date(data.aDate))+'</th><th>'+data.views+'</th></tr>').addClass('animated fadeInRightBig');
// 								var list = $('<tr class="'+data.aState+'"><th>'+data.num+'</th><th><a href="askContent.do?num='+data.num+'"  >  '+data.title+'</a></th>'+
// 												'<th>'+data.id+'</th>'+
// 												'<th>'+formatDate(new Date(data.aDate))+'</th><th>'+data.views+'</th></tr>').addClass('animated fadeInRightBig');
// 								$("#askBody").append(list);
							var list =[] ;
							for(var i = 0 ; i < data.length; i++){
								list[i] = $('<tr class="'+data[i].aState+'"><th>'+data[i].num+'</th><th><a href="askContent.do?num='+data[i].num+'" class="'+data[i].secret+'" >  '+data[i].title+'</a></th>'+
										'<th>'+data[i].id+'</th>'+
										'<th>'+formatDate(new Date(data[i].aDate))+'</th><th>'+data[i].views+'</th></tr>').hide().fadeIn(2000);//fadeInRightBig  addClass('animated fadeIn delay-1s')
								$("#askBody").append(list[i]);
							}
							adminForSecAsk();
							SetDivPosition();
							noMem();
							sec();
							secFunc();
							
						}
					});
				}else{
					if(end == 0){
						$('div.table').append('<br><h1 align="center" class="animated infinite pulse ">질문 끝 <br> 질문이 있으시면 더 작성해주세요^^</h1><br>');
						end++;							
					}
				}
			}
		});
			
	});
	</script>
	<script>
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
	
	//질문 modal 에서
	var memId = "${sessionScope.memId}"
	function checkAsk(){
		if($("#askTitle").val() =="" ){
			alert("제목을 입력하세요");
			return false;
		} else if($("#askPasswd").val() == ""){
			alert("비밀번호를 입력해 주세용~!~!");
			return false;
		} else if($("#askContents").val() == ""){
			alert("내용을 입력하세요");
			return false;
		}else {
			 if( memId == "" ){
				if($("#askId").val() == ""){
					alert("아이디를 입력하세요");
				return false;
				
				}
			 }
			
			alert("질문 작성 완료")
			$("#askSubmit").attr("data-dismiss","modal");
			
			
			var dt = {title:$("#askTitle").val(), passwd : $("#askPasswd").val() ,contents:  $("#askContents").val() ,id :$('#askId').val(), secret:$('#SecretCheck').prop("checked")}
			// 질문을 입력하고 바로 문의 게시판에 띄우는 ajax
			$.ajax({
				data:dt,
				type:"post",
				dataType:"json",
				url:"boardAskAjax.do",
				success:function(data){
						$("#askBody").prepend('<tr class="'+data.aState+'"><th>'+data.num+'</th><th><a href="askContent.do?num='+data.num+'" class="'+data.secret+'" >  '+data.title+'</a></th>'+
						'<th>'+data.id+'</th>'+
						'<th>'+formatDate(new Date(data.aDate))+'</th><th>'+data.views+'</th></tr>')
// 						$('.1').eq(0).children().eq(2).append('(비회원)'); 
						noMem();
						sec();
						$("#askForm")[0].reset();
						// 하나가 추가 됐으니 (추가 후 무한 스크롤 시 글 번호 중복됨)
						rownum++;
						SetDivPosition()
				}
			})
		}
		}

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

<!-- 스크롤 위치 쿠키에 저장 -->

  <script>

 function SetDivPosition()
 {
  var intY = document.body.scrollTop;
  document.cookie = "yPos=!~"+intY+"~!";
 }
 SetDivPosition();
 
// if(boardtype == 3){
	$(".askboard").html("<h4> ...Net 질문 </h4>");
// }
    $(".subboard").on(
            "click",
            function(){
                sessionStorage.setItem("boardtype", "2");
            }
        );
        $(".mainboard").on(
            "click",
            function(){
                sessionStorage.setItem("boardtype", "1");
            }
        );
        $(".askboard").on(
            "click",
            function(){
                sessionStorage.setItem("boardtype", "3");
            }
        );
        $("#logo").on(
            "click",
            function(){
                sessionStorage.setItem("boardtype", "1");
            }    
        );
 </script>
</body>
</html>