<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>8문 8답 맞추기</title>
		
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
		
		
		<!-- 캐로슬(슬라이딩) - 질문 및 보기 -->
		<div id="eightCarousel" class="carousel slide" data-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active">
				    <!-- 이름입력(기본화면) -->
				    <div class="container-fluid mt-5">
			  			<div class="row justify-content-center">
							<div class="form-group row w-50">
								<label class="col-sm-2 col-form-label text-right">이름</label>
								<div class="col-sm-10">
									<input type="text" class="form-control" name="name" placeholder="이름을 입력해주세요">
								</div>
							</div>
						</div>
			  		</div>
				</div>
				<!-- 2~8번 질문 슬라이드 만드는 for문 -->
				<c:set var="size" value="${0}"/>
				<c:forEach var="eight" items="${eightList}" varStatus="i">				
					<div class="carousel-item">
						<div class="container-fluid mt-5 Qbox" id="${i.count}">
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
		
		<!-- Modal -->
		<div class="modal fade" id="Mymodal" tabindex="-1" role="dialog" aria-labelledby="MymodalTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="MymodalTitle">당신은 친구에 대해 이만큼 알고있어요!</h5>
		      </div>
		      <div class="modal-body">
		      	<!-- 맞춘개수 : ? -->
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" name="toMain">메인으로</button>
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>
			
		<!-- 버튼 모음 -->
		<div class="row justify-content-center">
			
			<button type="button" class="btn btn-outline-primary m-3" name="confirm">확인</button>
			<!-- <button type="button" class="btn btn-outline-primary m-3" name="prevButton">이전</button>
			<button type="button" class="btn btn-outline-primary m-3" name="nextButton">다음</button> -->
		</div>
		
		<!-- bootstrap js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
		<!-- event for this page -->
		<script type="text/javascript">
		//<!--
			
			jQuery(document).ready(
				function(){
					// 슬라이드 자동으로 넘어가는 것 방지
					jQuery("#eightCarousel").carousel('pause');
					
					jQuery("button[name=confirm]").on(
						"click",
						function(){
							jQuery("#eightCarousel").carousel("next");
							jQuery(this).hide();
						}
					);
					$("button[name=toMain]").on(
							"click",
							function(){
								location.href = "main.do";
							}
						);
					var selectList = ${selectList};
					var i = 0;
					var cnt = 0;
					//alert(${size});
					jQuery(".sel").on(
						{
						"mouseenter" : function(){
											jQuery(this).css("opacity", "0.6");
										},
						"mouseleave" : function(){
											jQuery(this).css("opacity", "1");
										},
						"click" : function(){
											
											if(selectList[i] == jQuery(this).attr("id")) {
												jQuery(this).addClass("bg-success");
												cnt++;
											} else {
												jQuery(this).addClass("bg-danger");
											}
											setTimeout(
									  		function(){
									  			i++;
									  			if(i == ${size}){
									  				jQuery(".modal-body").append("맞춘개수 : " + cnt);
													jQuery("#Mymodal").removeClass("fade").modal("show");
												} else {
										  			jQuery("#eightCarousel").carousel("next");
												}
								  			},300
								  		);
							}
						}
					);
					
				}		
			);
		//-->
		</script>
	</body>
</html>