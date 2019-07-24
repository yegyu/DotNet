<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">

	<title>drag & drop</title>
		<!-- 자바스크립트 -->
	<script src="/DotNet/survey/script_survey.js"></script>
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
        integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
 	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
	
	<!-- css -->
	
	<!-- style_dotnet.csa -->
	  
	<!-- BootStrap cdn 인터넷에서 끌어 사용-->
	<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
	<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
	<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
	<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>

	<link rel="stylesheet" href="bootstrap.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
	
	<!--MDL CDN  -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	
	
	
	
	<style>
	.card col-md-7{
		border: solid 2px #23E88F;
	}
		label{
		font-size: 20px;
	}
		img {
	  display: none;
	  height: 203px;
	  width: 192px;
	}
	.dad {
	  padding-top: 5px;
	  padding-bottom: 5px;
	  display: table-cell;
	  height: 260px;
	  width: 250px;
	  vertical-align: middle;
	  text-align: center;
	  color: #4A50FF;
	  background-color: #FFFFFF;
	  border: solid 2px #23E88F;
	  border-radius: 10px;
	  float: center;
	}
	.fixed-bottom{
	display: none;
	}
	
	a#MOVE_TOP_BTN { 
	    position: fixed; 
		left: 1500px; 
		bottom: 50px; 
	     display: none; 
	     z-index: 999; 
	}
	
	
	p{
	font-size: 30px;
	color : grey;
	font-family: 고딕체;
	font-style: strong;
	}

		#dadimg {
	  /* 	display: grid; */
	  /* 	grid-template-columns: 1fr 1fr 1fr  ;  */
	  padding: 10px;
	}
/* 	#card2, #card3, #card4, #card5 {
		display:none;
	} */
	</style>
</head>

<body>


	<!-- 상단 바 -->
	
	<nav class="navbar navbar-expand-md navbar-default">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->

    <br>
	<form class="form" action="uploadPro.do" method="post" enctype="multipart/form-data" id="imgform"
	name="uploadform" onsubmit="uploadcheck()">

		<div class="container">
			<div class="row justify-content-center">
					<div class="card col-md-7">
					
						<div class="col">
							<div class="mdl-textfield mdl-js-textfield">
								<input class="mdl-textfield__input mb-2" type="text" name="subject"> 
								<label class="mdl-textfield__label">테스트 제목을 입력해주세요</label>
							</div>
						</div>

						<div class="col">
							<div class="mdl-textfield mdl-js-textfield">
								<input id="hideP" class="mdl-textfield__input mb-2" type="text" name="point"> 
									<label class="mdl-textfield__label hideP">포인트 설정</label>
							</div>
						</div>

						<hr>
						<div class="col mb-4">
							<div class="dad" id="userActions11" ondragover="dragOver()">
								<img id="img11" alt="uploaded image placeholder"><p>미리보기</p>
								<input type="file" id="fileUpload11" name="upload11" multiple accept="image/*">
							</div>
						</div>
						
					</div>
			</div>

			<hr>
			<br>

			<c:set var="c" value="${1}"/>
	<c:forEach var="i" begin="${1}" end="${5}" varStatus="len">
		<div class="row justify-content-center">
			<div class="card col-md-7"  id="card${len.count}">
				<div class="card-header">
					<div class="mdl-textfield mdl-js-textfield">
						    <input class="mdl-textfield__input mb-2" type="text"  name="question${len.count}">
						    <label class="mdl-textfield__label">${len.count}번 질문을 입력해주세요</label>
					  </div>
						<hr>
				<!-- ////////////////1번질문 보기//////////////// -->
				<div class="card-body col-md-6">
						<div class="dad" id="userActions${c}" ondragover="dragOver()">
							<img id="img${c}" src="" alt="uploaded image placeholder">
							<p>이미지${c} </p>
							<input type="file" id="fileUpload${c}" name="upload${c}" multiple
								accept="image/*">
						</div>
				</div>
				<div class="card-body col-md-6">
						<div class="dad" id="userActions${c+1}">
							<img id="img${c+1}" src="" alt="uploaded image placeholder" />
							<p>이미지${c+1 }</p>
							<input type="file" id="fileUpload${c+1}" name="upload${c+1}" multiple
								accept="image/*" />
						</div>
					</div>
				</div>
			</div>
		</div>
	<c:set var="c" value="${c+2}"/>
</c:forEach>
	
		<!--  ///////////////////////////////////////-----카드 내용 끝 -------/////////////////////////////// -->


		<!-- ////// 추가 버튼 (반복문) 작성완료,취소 ///// -->
		
		
	<c:set var="c" value="${0}"/>
	<c:forEach var="i" begin="${1}" end="${5}" varStatus="len">
				<div class="row justify-content-center">
					<div class="card col-md-7" id="btn${len.count}">
						<div class="card-header">
							<div class="card-body">
								<div class="float-center">
									
								<div class="btn-group col-md-12" role="group" aria-label="항목추가/삭제" id="btn-group1">
									<input type="button" class="btn btn-secondary btn-light" name="toggle"
										id="toggle${len.count}" style="height: 50px;" value="항목 추가">
									
									<input type="button" class="btn btn-secondary" name="del"
										id="del${len.count}" style="height: 50px;" value="항목 삭제">
									</div>
									
									<hr>
										
									<div class="card-footer col-md-12">
										<div class="btn-group col-md-12" id="btn-group2">
											<button type="submit" class="btn btn-secondary btn-primary"
												form="imgform" style="height: 50px;">작성 완료!</button>
											<button type="reset" class="btn btn-secondary  btn-primary"
												form="imgform" style="height: 50px;" onclick="history.back()">작성 취소</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
	</form>

  
  <script type="text/javascript" src="/DotNet/survey/DAD1.js"></script>
  <script type="text/javascript">
	var cnt = 1
	jQuery("input[name=toggle]").on('click',function(){
// 		alert("cnt : " + cnt);
		if(cnt<5)
			cnt++	
	});
	jQuery("input[name=del]").on('click',function(){
// 		alert("cnt : " + cnt);
		if(cnt>0)
			cnt--
	});
	
	
	jQuery("button[type=submit]").on('click',function(){
		if(  jQuery("input[name=subject]").val()=="" || jQuery("input[name=point]").val() ==""){
			alert("제목, 포인트, 썸네일 이미지를 다시 확인해 주세요!!")
			return false
		}else if(typeof parseInt(jQuery("input[name=point]").val()) != "number" || isNaN(parseInt(jQuery("input[name=point]").val()))){
			alert("point 에 숫자를 넣어 주세요");
			return false
		}else if(cnt==1){
			if(jQuery("div.mdl-textfield.mdl-js-textfield.is-upgraded > input").eq(2).val()==""){
				alert("질문을 넣어주세요!!")
				return false;
			}else if(jQuery("#img1").attr('src') == "" ||jQuery("#img2").attr('src') == "" ){
				alert("이미지를 양쪽에 모두 넣어 주세요")
				return false;
			}
		}else if(cnt==2){
			if(jQuery("div.mdl-textfield.mdl-js-textfield.is-upgraded > input").eq(3).val()==""){
				alert("질문을 넣어주세요!!")
				return false;
			}else if(jQuery("#img3").attr('src') == "" ||jQuery("#img4").attr('src') == "" ){
				alert("이미지를 양쪽에 모두 넣어 주세요")
				return false;
			}
		}else if(cnt==3){
			if(jQuery("div.mdl-textfield.mdl-js-textfield.is-upgraded > input").eq(4).val()==""){
				alert("질문을 넣어주세요!!")
				return false;
			}else if(jQuery("#img5").attr('src') == "" ||jQuery("#img6").attr('src') == "" ){
				alert("이미지를 양쪽에 모두 넣어 주세요")
				return false;
			}
		}else if(cnt==4){
			if(jQuery("div.mdl-textfield.mdl-js-textfield.is-upgraded > input").eq(5).val()==""){
				alert("질문을 넣어주세요!!")
				return false;
			}else if(jQuery("#img7").attr('src') == "" ||jQuery("#img8").attr('src') == "" ){
				alert("이미지를 양쪽에 모두 넣어 주세요")
				return false;
			}
		}else if(cnt==5){
			if(jQuery("div.mdl-textfield.mdl-js-textfield.is-upgraded > input").eq(6).val()==""){
				alert("질문을 넣어주세요!!")
				return false;
			}else if(jQuery("#img9").attr('src') == "" ||jQuery("#img10").attr('src') == "" ){
				alert("이미지를 양쪽에 모두 넣어 주세요")
				return false;
			}
		}
	});
	
  </script>
  <script>
	jQuery("input[type=file]").attr("hidden",true);
	// 회원일 때는 포인트 입력 칸을 숨긴다.
	jQuery(document).ready(
		function(){
			var isAdmin = "${sessionScope.isAdmin}";
			if(isAdmin == 2) {
				var clone = jQuery("#hideP").children().clone();
				jQuery(".hideP").text("").append(clone);
				jQuery("input[name=point]").attr("hidden","true").attr("value",0);
			}
		}		
	);
  </script>
	
	<script>
	
	
	var c = 0;
	for(var i=2; i<6; i++){	
		jQuery('div#card1').show();
		jQuery('#del1').hide();
		jQuery('div#card'+i).hide();	
		jQuery('#btn'+i).hide();
	}

	jQuery('#toggle1').click(function(){
        jQuery('#btn1').hide( 'slow', function() {
            jQuery('#card2').show('slow', function() {
                jQuery('#toggle2').show('slow',function() {
                    jQuery('#btn2').show('slow', function() {
                    
    jQuery('#toggle2').click(function() {
        jQuery('#btn2').hide('slow',function() {
            jQuery('#card3').show('slow',function(){
                jQuery('#toggle3').show('slow', function(){
                    jQuery('#btn3').show('slow', function() {
                        
    jQuery('#toggle3').click(function() {
        jQuery('#btn3').hide('slow',function() {
            jQuery('#card4').show('slow',function(){
                jQuery('#toggle4').show('slow', function(){
                    jQuery('#btn4').show('slow', function() {
    
    jQuery('#toggle4').click(function() {
        jQuery('#btn4').hide('slow',function() {
            jQuery('#card5').show('slow',function(){
                jQuery('#toggle5').show('slow', function(){
                    jQuery('#btn5').show('slow', function() {
                        jQuery('#toggle5').hide();
                            
                    });}); });});});
                    });}); });});}); 
                    });}); });});});    
                    });}); });});});
	
	if(jQuery('#card2').hide('display') != "none"){
		jQuery('#del2').click(function(){jQuery('#card2').hide('slow', function(){jQuery("#btn2").hide(function(){jQuery('#btn1').show();});});
		});
	}
	if(jQuery('#card3').hide('display') != "none"){
		jQuery('#del3').click(function(){jQuery('#card3').hide('slow', function(){jQuery("#btn3").hide(function(){jQuery('#btn2').show();});});
		});
	}
	if(jQuery('#card4').hide('display') != "none"){
		jQuery('#del4').click(function(){jQuery('#card4').hide('slow', function(){jQuery("#btn4").hide(function(){jQuery('#btn3').show();});});
		});
	}
	if(jQuery('#card5').hide('display') != "none"){
		jQuery('#del5').click(function(){jQuery('#card5').hide('slow', function(){jQuery("#btn5").hide(function(){jQuery('#btn4').show();});});
		});
	}
	
	</script>
</body>
</html>
