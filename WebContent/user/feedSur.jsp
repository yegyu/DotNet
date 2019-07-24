<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>피드설문</title>
		
		<!-- responsive meta tag -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- bootstrap css -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
		<!-- setting -->
		<%@ include file="/survey/setting_survey.jsp" %>
		
	</head>
	<body>
		<!-- 상단 바 -->
		<nav class="navbar navbar-expand-md navbar-default" style="margin-bottom:0px">
			<jsp:include page="../mainNav.do" flush="false"></jsp:include>
		</nav>
		<!-- 상단 바  끝-->
		
		
		
		<div class="container">
			<h2> ${title} </h2>
			<div class="row mt-5">
				<c:forEach begin="1" end="4" varStatus="i">
					<div class="col w-25">
						<div class="card${i.current}" id="${i.current}">
							<div class="front">
									<img height="100%" width="100%" alt="..." src="/DotNet/defaultImg/${folder_name}/feed${i.current}.jpg">
							</div>
							<div class="back text-center">
								<h4>${content[i.current-1]}</h4>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="row mt-5">
				<c:forEach begin="5" end="8" varStatus="i">
					<div class="col">
						<div class="card${i.current}" id="${i.current}">
							<div class="front">
									<img height="100%" width="100%" alt="..." src="/DotNet/defaultImg/${folder_name}/feed${i.current}.jpg">
							</div>
							<div class="back text-center">
								<h4>${content[i.current-1]}</h4>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		
		
		<!-- bootstrap js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
		<!-- for card flip -->
		<script src="https://cdn.rawgit.com/nnattawat/flip/master/dist/jquery.flip.min.js"></script>
		
		<!-- script for this page -->
		<script type="text/javascript">
		//<--
			$(document).ready(
				function(){
					var height = $(".row:first").height();
					
					$("[class*=card]").flip({
						axis : 'y',
						trigger : 'hover'
					});
					$("[class*=card]").height(height).on(
						"click",
						function(){
							var choose = $(this).attr("id");
							location.href = "feedSurPro.do?card=" + choose + "&feed_type=" + ${feed_type};
						}
					);
					$("h4").css("padding-top", "30%");
					
				}		
			);
		//-->
		</script>
	</body>
</html>