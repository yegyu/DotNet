<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting_user.jsp"%>
<script type="text/javascript" src="/JQueryEx/jquery-3.4.1.js"></script>
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
h4.count, h4.text{
	color : red;
}
</style>
</head>



<body>


	<!-- Image card -->
	<form name="surveyDetail" class="text-center">
	<div class="text-left">
	설문번호 : ${s_num}
		<div class="container text-center">
			<div class="row">
					<div class="col-md-12 mt-5" style="background-color : #CBE83C">
						<h1>${subject}</h1>
						<p class="mb-2">조회수 : ${hits} &nbsp;&nbsp;&nbsp; 참여수 : ${parts}</p>
					</div>
					<div class="col-md-12">
					<hr>
				</div>
				<c:set var="c" value="${0}" />
				<c:set var="t" value="${0 }"/>
				<c:set var="l" value="${0 }"/>
				<c:forEach var="i" items="${qList}" varStatus="len">
					<c:if test="${i ne null}">
							<div class="col-md-12 text-center">	

								<hr>	
								<h4>Q.${len.count} ${i}</h4>
								<hr>
							</div>

							<div class="col-md-6">
								<div class="card" >
									<img src="/DotNet/save/${iList[c]}" style="cursor: hand;" id="card${c}"
										class="card-img-top">
									<!--div.card-body>h3+p-->
									<div class="card-body">
									
										<h4>사람들의 선택</h4>
										<h4 class="count"></h4>
										<h5 class="text" id="text${t}">${countList[c] } 명</h5>
										
									</div>
								</div>
							</div>
 
							<div class="col-md-6">
								<div class="card" id="card${c+1}">
									<img src="/DotNet/save/${iList[c+1]}" style="cursor: hand;" id="card${c+1}"
										class="card-img-top">
									<!--div.card-body>h3+p-->
									<div class="card-body">
										
										<h4>사람들의 선택</h4>
										<h4 class="count"></h4>
										<h5 class="text" id="text${t+1}">${countList[c+1]}명</h5>
										
										
									</div>
								</div>
							</div> 
							<c:set var="l" value="${l+2}" />
							<c:set var="c" value="${c+2}" />
							<c:set var="t" value="${t+2}" />
							
					</c:if>
				</c:forEach><!-- 카드 반복문 -->


			</div>
		</div>
		</div>
	</form>
	
	<script type="text/javascript">
	//<--
		$(document).ready(
			function(){
				var selList = ${selList};
				var cList =  ${countList};
				var size =  ${size};
				var count = $( "h4.count");
				
				var c = 0;
				var t = 0;
				 for(var i=0; i < size; i++) {
					if(selList[i] == 1){
						
						var card = "img#card" + c;
						var text = "h5#text" + t;
						
							$( card ).css("border", "5px solid  red");
							$( text ).css("color", "red" );
							
							
					} else if(selList[i] == 2 ) {
						
						var card = "img#card" + (c+1);
						var text = "h5#text" + (t+1) ;

						
							$( card ).css("border", "5px solid  red");
							$( text ).css("color", "red" );
							
					} 
					c = c+2;
					t = t+2;
				} 
			}		
		);
	//-->
	</script>
</body>
