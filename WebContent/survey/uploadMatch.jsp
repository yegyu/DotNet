<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>양자택일 친구 결과보기</title>
		
		<!-- bootstrap css -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<!-- responsive(반응형)을 위한 meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- setting file -->
		<%@ include file="setting_survey.jsp" %>
		
		<!-- css for this page -->
		<style type="text/css">
			img {
				width : 48rem;
				height : 35rem;
			}
			.colwidth {
				width : 50rem;
			}
		</style>
	</head>
	
	<body>
		<!-- 상단 바 -->
		<nav class="navbar navbar-expand-md navbar-default">
			<jsp:include page="../mainNav.do" flush="false"></jsp:include>
		</nav>
	
		<div class="container mt-5">
			<c:set var="index" value="${0}"/>
			<c:forEach begin="1" end="${info.size}" varStatus="i">
				<div class="row">
					<div class="col-3 mt-5">
						<a class="btn btn-primary" data-toggle="collapse" href="#collapse${i.count}"
							 role="button" aria-expanded="false" aria-controls="collapse${i.count}">
							${resultList[index]}
						</a>
					</div>
					<div class="col mt-5">
						<div class="collapse colwidth" id="collapse${i.count}">
							<div class="card card-body">
								<img src="/DotNet/save/${resultList[index+1]}" alt="..">
							</div>
						</div>
					</div>
				</div>
				<c:set var="index" value="${index+2}"/>
			</c:forEach>
		</div>
		
		<!-- bootstrap js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
	</body>
</html>