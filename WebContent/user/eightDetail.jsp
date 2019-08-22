<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
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

	<link rel="stylesheet" href="/DotNet/css/bootstrap.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
	
	<!--MDL CDN  -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>

	<title>설문 선택 정보(eight)</title>

	<style>
	h4{
	margin-bottom: 5px;
    margin-top: 4px;
	}
	</style>
</head>


	<body>
	
		<div class="container-fluid mt-5 mb-5">
		<div class="row justify-content-center">
			<div class="card col-md-12">

				<div class="card-header text-center">
					<h3 class="card-title">테스트 제목 : ${subject}</h3>
					<p>글번호 : ${s_num}   조회수 : ${hits} 참여수 : ${parts }</p>
				</div>

				<div class="row">
					
					<c:set var="t" value="${0 }"/>
					<c:forEach var="e"  end="${8}" varStatus="i" items="${eightList}" >
						<div class="col-sm-3 mt-2 mb-2">
						
							<div class="card text-dark bg-light">
								<div class="card-header bg-primary text-center text-light">
									<h4>${e.q_content}</h4>
								</div>
								<div class="card-body w-100">
									<!--Starting list group here -->
									<div class="list-group" id="question${i.count}">
									
										<a href="#" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action list-group-item-primary">
											${e.sel1_content}<span class="badge badge-primary badge-pill">${counter[t]}</span></a>
											
										<a href="#" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action list-group-item-primary">
											${e.sel2_content} <span class="badge badge-primary badge-pill">${counter[t+1]}</span></a>
											
										<a href="#" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action list-group-item-primary">
											${e.sel3_content}<span class="badge badge-primary badge-pill">${counter[t+2]}</span></a>
											
										<a href="#" class="list-group-item d-flex justify-content-between align-items-center list-group-item-action list-group-item-primary">
											${e.sel4_content}<span class="badge badge-primary badge-pill">${counter[t+3]}</span></a>
											
										<c:set var="t" value="${t+4 }"/>
										
									</div>
									<!--Ends here -->
								</div>

							</div>
							
						</div>
					</c:forEach>
				</div>
				<!-- end row1 -->


				</div>
			</div>
		</div>
		</body>
	
</html>