<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>8문 8답 설문</title>
		
		<!-- bootstrap css -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<!-- responsive(반응형)을 위한 meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- setting file -->
		<%@ include file="setting_survey.jsp" %>
		
	</head>
	<body>
		<!-- 상단 바 -->
		<nav class="navbar navbar-expand-md navbar-default">
			<jsp:include page="../mainNav.do" flush="false"></jsp:include>
		</nav>
		
		<form action="eightResult.do" method="post" name="choiceInfo">	
		<!-- 캐로슬(슬라이딩) - 질문 및 보기 -->
		<div id="eightCarousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="carousel-item active">
				    <!-- 이름입력(기본화면) -->
				    <div class="container-fluid mt-5">
			  			<div class="row justify-content-center">
							<div class="form-group row w-50">
								<label class="col-sm-2 col-form-label text-right">이름</label>
								<div class="col-sm-10">
									<c:if test="${sessionScope.memId eq null}">
										<input type="text" class="form-control" name="name" placeholder="이름을 입력해주세요">
									</c:if>
									<c:if test="${sessionScope.memId ne null}">
										<div class="alert alert-success" role="alert">
										  ${sessionScope.memId} 님 환영합니다.
										</div>
									</c:if>
								</div>
							</div>
						</div>
			  		</div>
				</div>
				<!-- 2~8번 질문 슬라이드 만드는 for문 -->
				<c:set var="size" value="${0}"/>
				<c:forEach var="eight" items="${eightList}" varStatus="i">				
					<div class="carousel-item">
						<div class="container-fluid mt-5 Qbox" id="q${i.count}">
				  			<div class="row justify-content-center">
								<div class="form-group row w-75">
									<label class="col-sm-2 col-form-label text-right">Q${i.count}</label>
									<div class="col-sm-10">
										<div class="alert alert-primary" role="alert">
											${eight.q_content}
										</div>
									</div>
								</div>
							</div>
				  			<div class="row justify-content-center">
							    <div class="form-group row w-75">
								    <label class="col-sm-2 col-form-label text-right">1</label>
								    <div class="col-sm-10">
								    	<div class="alert alert-secondary sel" role="alert" id="1">
								    		${eight.sel1_content }
								    	</div>
								    </div>
								</div>
								<div class="form-group row w-75">
								    <label class="col-sm-2 col-form-label text-right">2</label>
								    <div class="col-sm-10">
								    	<div class="alert alert-secondary sel" role="alert" id="2">
								    		${eight.sel2_content }
								    	</div>
								    </div>
								</div>
								<div class="form-group row w-75">
								    <label class="col-sm-2 col-form-label text-right">3</label>
								    <div class="col-sm-10">
								    	<div class="alert alert-secondary sel" role="alert" id="3">
								    		${eight.sel3_content }
								    	</div>
								    </div>
								</div>
								<div class="form-group row w-75">
								    <label class="col-sm-2 col-form-label text-right">4</label>
								    <div class="col-sm-10">
									    <div class="alert alert-secondary sel" role="alert" id="4">
								    		${eight.sel4_content }
								    	</div>
								    </div>
								</div>
				  			</div>
				  		</div>
					</div>
					<c:set var="size" value="${i.count}"/>
				</c:forEach>
			</div>
		</div>
			
		<!-- form 시작 태그는 비회원 이름 받아오는것 때문에 위에 위치함 -->
			<!-- 버튼 모음 -->
			<div class="row justify-content-center">
				<button type="button" class="btn btn-outline-primary m-3" name="prevButton">이전</button>
				<input type="submit" class="btn btn-outline-primary m-3" value="설문완료">
				<input type="reset" class="btn btn-outline-primary m-3" value="설문취소">
				<button type="button" class="btn btn-outline-primary m-3" name="nextButton">다음</button>
			</div>
			<!-- 숨겨서 넘길 값들 -->
			<c:forEach var="ii" begin="1" end="${size}">
				<input type="hidden" name="q${ii}">
			</c:forEach>
			<input type="hidden" name="s_num" value="${s_num}">
			<input type="hidden" name="s_tp_num" value="8">
			<input type="hidden" name="point" value="${boardDto.point}">
		</form>
		
		<!-- bootstrap js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
		<!-- event for this page -->
		<script type="text/javascript">
		//<!--
			
			jQuery(document).ready(
				function(){
					// 설문페이지 들어오면 설문시간 측정 시작
					var start = new Date();
					var startTime = start.getTime();
					// 슬라이드 자동으로 넘어가는 것 방지
					jQuery("#eightCarousel").carousel('pause');
					
					// 이전, 다음 버튼 누르면 넘어가도록
					jQuery("button[name=prevButton]").on(
						"click",
						function(){
							jQuery("#eightCarousel").carousel('prev');
						}
					);
					jQuery("button[name=nextButton]").on(
						"click",
						function(){
							jQuery("#eightCarousel").carousel('next');
						}
					);
					jQuery(".sel").on(
						{
						"mouseenter" : function(){
											jQuery(this).css("opacity", "0.6");
										},
						"mouseleave" : function(){
											jQuery(this).css("opacity", "1");
										},
						"click" : function(){
									  var num = jQuery(this).attr("id");
									  var q_num = jQuery(this).parents(".Qbox").attr("id");
									  if(localStorage.getItem(q_num) == null) {
										  jQuery(this).addClass("bg-success");
										  localStorage.setItem(q_num, num); 
										  jQuery("#eightCarousel").carousel("next");
									  } else {
										  jQuery(this).parents(".Qbox").find(".sel").removeClass("bg-success");
										  jQuery(this).addClass("bg-success");
										  localStorage.setItem(q_num, num);
										  jQuery("#eightCarousel").carousel("next");
									  }
								  }
						}
					);
					// 설문완료 누를시 
					jQuery("input:submit").click(function() {
						var params = document.choiceInfo;
						var size = ${size}
						var flag = 0;
						if($("input[name=name]").val() == "") {
							alert("이름을 작성해주세요");
							return false;
						} 
						for(var i=1; i <= size; i++) {
							if(localStorage.getItem("q"+i) == null) {
								flag = 1;
							}
						}
						if (flag == 1){
							alert("질문에 모두 답해주세요");
							return false;
						} else {
							for(var i=1; i <= size; i++) {
								$("input[name=q"+i+"]").attr("value", localStorage.getItem("q"+i));
							}
							var end = new Date();
							var endTime = end.getTime();
							var differTime = (endTime - startTime)/1000;	// 특정 시점이후 지난 시간이라서 거꾸로 빼야 됨
							var snum = $('h1.snum').prop('id')
							var data = { cnt : clickCnt , s_num : snum, type : "5", id : $('#noMem').val(), surveyTime : differTime};
							$.ajax({
								url:"clickLog.do",
								type:"post",
								data:data,
								dataType:"text",
								success:function(data){
									if(data == "1"){
										params.submit();
										localStorage.clear();
										$('form[name=choiceInfo]').submit();
									}
									
								}
																
							});
						}
					});
					// 설문 취소를 누를 경우
					jQuery("input:reset").click(function(){
						if(confirm("설문을 그만하시겠습니까?")){
							localStorage.clear();
							history.back();
						}
					});
					// 메인로고를 눌렀을 경우
					$(".tomain").on("click", function() {
						localStorage.clear();
					});
					// 클릭수 측정
					var clickCnt = 0;
					$('body').on('click',function(){
						clickCnt++;
					});
				}		
			);
		//-->
		</script>
	</body>
</html>