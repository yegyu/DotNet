<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>friendFeed</title>
	<!-- bootstrap css -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		  <div class="row">
			  <div class="col">
				<div class="row p-1 justify-content-center">
					<div class="col-sm-4">
						<div class="card text-center realCard">
						  <img id="feedImg1" src="" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">성격</h5>
						    <p class="card-text">${map.personality[map.selectList[0]-1]}</p>
						  </div>
						</div>
					</div>
					<div class="col-sm-4">
						<div class="card text-center realCard">
						  <img id="feedImg2" src="" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">취미</h5>
						    <p class="card-text">${map.hobby[map.selectList[1]-1]}</p>
						  </div>
						</div>
					</div>
				</div>
				<div class="row p-1 justify-content-center">
					<div class="col-sm-8">
						<div class="card text-center">
						  <img id="feedImg3" src="" class="card-img-top" alt="...">
						  <div class="card-body">
						    <h5 class="card-title">이상형</h5>
						    <p class="card-text">${map.sexual[map.selectList[2]-1]}</p>
						  </div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-2">
				<div class="list-group">
				  <a href="#" class="list-group-item list-group-item-action active">
				    ${map.id}님의 친구
				  </a>
				  <c:forEach var="friend" items="${map.friendList}">
					  <a href="#" class="list-group-item list-group-item-action friend">${friend}</a>
				  </c:forEach>
				</div>
			</div>
		  </div>	
	</div>
	
	<!-- bootstrap js -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript">
		//<!--
			$(document).ready(
				function(){
					var selectList = ${map.selectList};
					var folder_name = new Array();
					folder_name[0] = "${map.folder_name[0]}";
					folder_name[1] = "${map.folder_name[1]}";
					folder_name[2] = "${map.folder_name[2]}";
					
					for(var i = 0; i < 3; i++){
						if(selectList[i] != null) {
							$("#feedImg"+(i+1)).attr("src", "/DotNet/defaultImg/"+folder_name[i]+"/feed"+selectList[i]+".jpg");
						} else {
							$("#feedImg"+(i+1)).attr("src", "/DotNet/defaultImg/plus.png");
						}
					}
					
					$(".realCard").height($(this).parent().height());
					
					$('.friend').on('click', function(){
						var url="friendFeed.do?Friend=" + $(this).text();
						console.log(url);
						window.open(url,'결과 테이블',"width=1200, height=760, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
						
					});
				}		
			);
		//-->
	</script>
</body>
</html>