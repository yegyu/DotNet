<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.Graphics"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="javax.media.jai.JAI"%>
<%@page import="javax.media.jai.RenderedOp"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<!-- 자바스크립트 -->

<!-- JQuery -->
<!-- <script type="text/javascript" src="/DotNet/jquery-3.4.1.js"></script> -->
<!-- <script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>

BootStrap cdn 인터넷에서 끌어 사용
<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script> -->



<!-- 상단 바 -->

<!-- 	<nav class="navbar navbar-expand-md navbar-default"> -->
<%-- 		<jsp:include page="../mainNav.do" flush="false"></jsp:include> --%>
<!-- 	</nav> -->
<!-- 상단 바  끝-->
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>결과</title>
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap"
	rel="stylesheet">
<!-- style_dotnet.csa -->
<link rel="stylesheet" type="text/css" href="style_dotnet.css" />


<style>
html, body{
	background-color: white;
}
.row {
	position: relative;
}
.col{
/* 	width:100%; */
}
/* img:hover{ */
/* 	border: 2px solid black; */
/* } */
img {
	top: 180px;
	width : 40%
	max-width: 100%;
	position: fixed;
	display: none;
	position: fixed;
}

.q {
/* color:white; */
	/* 	position: fixed; */
	display: none;
	color: black;
	top: 100px;
	z-index: 10;
}


.bottom {
	position: fixed;
	bottom: 0px;
	right: 50%;
}

#sBtn {
	height : 53px;
}

</style>
</head>
<body>
<h1 align="center" id="${two.s_num}">설문번호 : ${two.s_num}</h1>
<br>
<!-- 추가~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ id = intro -->
<div class="container-fluid mt-5" id="intro">
	<div class="row justify-content-center">
		<div class="form-group row w-50">
			<label class="col-sm-2 col-form-label text-right">이름</label>
			<div class="col-sm-8">
				<c:if test="${sessionScope.memId eq null}">
					<input type="text" class="form-control"  name="name" id="noMem"
						placeholder="이름을 입력해주세요" form="choiceInfo" ><!--    -->
				</c:if>
				<c:if test="${sessionScope.memId ne null}">
					<div class="alert alert-success" role="alert">
						${sessionScope.memId} 님 환영합니다.</div>
				</c:if>
			</div>
			<button type="button" class="btn" id="sBtn">시작!!</button>
		</div>
	</div>
</div>
<!-- 추가~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ id = startTwo-->
<div id="startTwo">

	<c:set var="c" value="${0}" />
	<c:set var="size" value="${0}" />
	<c:forEach var="i" items="${qList}" varStatus="ii">
		<c:if test="${i ne null}">
			<h1 align="center" class="q">${i}</h1>
			<div class="row justify-content-center" >
				<div class="${ii.count} col " >
					<c:set var="size" value="${ii.count}" />
					<img src="/DotNet/save/${iList[c]}" border="0" class="float-right"
						height="70%"  name="1" style="height:;width:;padding-left:auto">
				</div>
				<div class="${ii.count} col">
					<img src="/DotNet/save/${iList[c+1]}" border="0" 
						height="70%"  name="2" style="height:;width:">
	
					<c:set var="c" value="${c+2}" />
				</div>
			</div>
		</c:if>
	</c:forEach>
	
	<div class="bottom">
		<input type="button" value="완료" id="cbtn" hidden>
		<form action="uploadResult.do" method="post" name="choiceInfo" id="choiceInfo">
			<c:forEach var="ii" begin="${1}" end="${size}">
				<input type="hidden" name="q${ii}" class="qList" >
			</c:forEach>
			<input type="hidden" name="s_num" value="${two.s_num}"> <input
				type="hidden" name="point" value="${boardDto.point }">
		</form>
	
		<a href="main.do" class="tomain">메인으로</a>
	</div>
</div>
<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript" src="bootstrap.bundle.js"></script>

<script>
/////////////추가!!!!!!!!!?//////////////////
$(document).ready(function(){
	$("#startTwo").hide();
	$('#intro').show();
	$("#sBtn").on('click', function(){
		if($('input[name=name]').val() == ""){
			alert("이름을 입력해 주세요!!");
			return false;
		}else{
			$('#startTwo').show();
			$('#intro').hide();
		}
	});
	$("img").on( {
		"mouseover" : function(){
							$(this).css("border", "solid 3px #6666ff");
						},
		"mouseleave" : function(){
							$(this).css("border", "hidden")
						}
		}
	
		
	);
	
});
/////////////추가!!!!끝끝끝끝끝끝!!!?//////////////////
// 	var iList = [];
// 	var qList = [];
// 	for (var i = 0; i < $("img").length; i++) {
// 		iList.push($("img").eq(i).attr('src'));
// 	}
// 	for (var i = 0; i < $(".q").length; i++) {
// 		qList.push($(".q").eq(i).text());
// 	}
	var qlen = $(".q").length;
	var i1 = 0;
	var i2 = 1;
	var qn = 0;
	var img = $('img');
	var q = $('.q');
	// 		test(0,1,0)
	function show(i1, i2, q) {
		img.eq(i1).fadeIn();
		img.eq(i2).fadeIn();
		$('.q').eq(q).show();

	}
	function hide(i1, i2, q) {
		img.eq(i1).fadeOut();
		img.eq(i2).fadeOut();
		$('.q').eq(q).hide();

	}
	$(document).ready(function() {

		show(0, 1, 0);
		img.on('click', function() {
			img.not($(this)).animate({
				top : '+=1000px'
			}).fadeOut(function() {
				img.css('top', '180px')
			});
			$(this).animate({
				left : '25%'
			});
			hide(i1, i2, qn);
			i1 += 2, i2 += 2, qn += 1;
// 			console.log(i1 + " , " + i2 + "  , " + qn)
			show(i1, i2, qn);
			if (qn == qlen) {
				var snum = $('h1').prop('id')
				var data = { cnt : clickCnt , s_num : snum, type : "2" , id :$('#noMem').val()};
				$.ajax({
					url:"clickLog.do",
					type:"post",
					data:data,
					dataType:"text",
					success:function(data){
						/// 광클시 에러 --> 처음으로 되돌리기
						
					}
													
				});
				setTimeout(function() {
					$("#cbtn").click();
				}, 2000);
			}
		});

	});
</script>
		<script>
			var clickCnt = 0;
			$('body, html').on('click',function(){
				clickCnt++;
			});
		</script>
<script>
	var q_num = 0;
	$(document).ready(
			function() {
				$("img").mouseenter(function() {
					// 					$(this).css("opacity", "0.7");
				});
				$("img").mouseleave(function() {
					// 					$(this).css("opacity", "1");
				});
				$("img").click(function() {
					// 					$(this).fadeOut(100).fadeIn(100).animate({
					// 						opacity : '1'
					// 					});
					q_num = $(this).parent().attr("class").split(" ")[0];
					// 선택정보 저장
					localStorage.setItem("q" + q_num, $(this).attr("name"));
				});
				$("#cbtn").click(
						function() {
							var params = document.choiceInfo;
							var size = "${size}"
// 							alert("size = " + size);
							for (var i = 1; i <= size; i++) {
								$("input[name=q" + i + "]").attr("value", localStorage.getItem("q" + i));
								
							}
							if($('.qList').length != localStorage.length){
								alert("클릭를 조금 교양있게 해주셔야 반영이 됩니다 ^^");
								var result = confirm('다시 하시겠습니까??\n ok(확인)->처음, cancel(취소)->메인');
								if(result){
									localStorage.clear();
									location.reload();
								}else{
									localStorage.clear();
									location.href = "main.do"
								}

							}else{
								params.submit();
								localStorage.clear();
							}
						});

				// 메인으로 가는 경우
				$(".tomain").on("click", function() {
					localStorage.clear();
				});
				// 설문 취소를 누를 경우
				jQuery("input:reset").click(function(){
					if(confirm("설문을 그만하시겠습니까?")){
						localStorage.clear();
						history.back();
					}
				});
			});
</script>
</body>
</html>
