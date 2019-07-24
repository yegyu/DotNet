<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>설문선택페이지</title>
		
		<!-- bootstrap CDN -->
		<link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css">
		<script src='//unpkg.com/jquery@3/dist/jquery.min.js'></script>
		<script src='//unpkg.com/popper.js@1/dist/umd/popper.min.js'></script>
		<script src='//unpkg.com/bootstrap@4/dist/js/bootstrap.min.js'></script>
		
		<!-- jquery -->
		<script
		src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
		
		<!-- 이벤트 처리 -->
		<script type="text/javascript">
		//<!--
			$(document).ready(
				function(){
					$("#card1").on(
						"click",
						function(){
							location.href="upload.do";
						}		
					);
				}
			);
			$(document).ready(
					function(){
						$("#card2").on(
							"click",
							function(){
								location.href="fiveMake.do";
							}		
						);
					}
				);
			$(document).ready(
				function(){
					$("#card3").on(
						"click",
						function(){
							location.href="eightMake.do";
						}		
					);
				}
			);
		//-->
		</script>
	</head>
	<body>
		<div class="card-deck">
		  <div class="card" id="card1">
		    <img src="/DotNet/defaultImg/two.jpg" class="card-img-top" alt="양자택일">
		    <div class="card-body">
		      <h5 class="card-title">양 자 택 일</h5>
		      <p class="card-text">둘 중에 하나만 선택할 수 있다! 당신의 선택은?</p>
		    </div>
		  </div>
		  <div class="card" id="card2">
		    <img src="/DotNet/defaultImg/five.jpg" class="card-img-top" alt="오지선다">
		    <div class="card-body">
		      <h5 class="card-title">오 지 선 다</h5>
		      <p class="card-text">내가 원하는 건 뭘까? 얼마나 원할까? 선택해보세요!</p>
		    </div>
		  </div>
		  <div class="card" id="card3">
		    <img src="/DotNet/defaultImg/eight.jpg" class="card-img-top" alt="8문8답">
		    <div class="card-body">
		      <h5 class="card-title">8 문 8 답</h5>
		      <p class="card-text">나는 뭘 원하고 친구들은 그런 나를 알아줄까? 테스트해보세요!</p>
		    </div>
		  </div>
		</div>
	</body>
</html>