<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting_user.jsp"%>
<head>
<script src="${project_user}script_user.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>

<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

<link rel="stylesheet" type="text/css" href="./css/main.css">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
	integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
	crossorigin="anonymous">

<style>
img {
	max-width: 100%;
	max-height: 100%;
}

.card-img-top {
	height: 300px;
	width: 100%;
}

.separator {
    background: #FFBE05;
    margin-top: 80px;
    padding: 21px;
    text-align: center;
    color: #fff;
}

.disc{
	background: #EB743B;
    color: #fff;
}
</style>

<title> 내가 작성한 설문 결과</title>
</head>
<body>
	
	<!-- Image card -->
	<form name="surveyDetail" class="text-center">
	<div class="text-left">
	설문번호 : ${s_num}
		<div class="container text-center">
			<div class="row">
					<div class="col-md-12">
						<h1 class="separator">${subject}</h1>
						<br> <h5 class="disc">조회수 : ${hits} &nbsp;&nbsp;&nbsp; 참여수 : ${parts}</h5>
					</div>
					<div class="col-md-12">
					<hr>
				</div>
				<c:set var="c" value="${0}" />
				<c:forEach var="i" items="${qList}" varStatus="len">
					<c:if test="${i ne null}">
							<div class="col-md-12 text-center">
								<hr>
								<h3>Q.${len.count} ${i}</h3>
								<hr>
							</div>
							<div class="col-md-6">
								<div class="card">
									<img src="/DotNet/save/${iList[c]}" style="cursor: hand;"
										class="card-img-top">
									<!--div.card-body>h3+p-->
									<div class="card-body">
										<h4 class="text">선택횟수 : ${test1[c] }</h4>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card">
									<img src="/DotNet/save/${iList[c+1]}" style="cursor: hand;"
										class="card-img-top">
									<!--div.card-body>h3+p-->
									<div class="card-body">
										<h4 class="text">선택횟수 :  ${test1[c+1]} </h4>
									</div>
								</div>
							</div>
							<c:set var="c" value="${c+2}" />
					</c:if>
				</c:forEach><!-- 카드 반복문 -->

			</div>
		</div>
		</div>
	</form>
</body>
