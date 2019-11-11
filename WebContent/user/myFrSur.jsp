<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link rel="stylesheet" href="bootstrap.css">
</head>
<body>
	<jsp:include page="/mypage.do" />
	<div class="page-content" id="mpc">
		<div class="container-fluid	">
			<div class="card col-md-12">
				<h1 class="my-4 font-weight-bold">- 친구들의 활동</h1>
				<hr>

				<c:forEach var="lib" items="${frLib }" varStatus="idx">


					<c:if test="${fn:length(lib.value) gt 0 }">
						<div id="${lib.key }" class="carousel slide " data-ride="slide">
						
<!-- 							<div class="mt-5"> -->
<!-- 								<ol class="carousel-indicators " style="margin-bottom: -15px;"> -->
<%-- 									<c:if test="${fn:length(lib.value) gt 3}"> --%>
<!-- 										<li data-target="#${lib.key }" data-slide-to="0" -->
<!-- 											class="active" style="background-color: rgb(196, 171, 204)" ></li> -->
<!-- 										<li data-target="#${lib.key }" data-slide-to="1" -->
<!-- 											style="background-color: rgb(196, 171, 204)"></li> -->
<%-- 									</c:if> --%>
<!-- 								</ol> -->
<!-- 							</div> -->
							<div class="container">
							<br>
								<h4>${lib.key }의 활동</h4>
								<hr>
								<div class="carousel-inner">

									<div class="carousel-item active">
										<div class="row ">
											<c:forEach var="sur" items="${lib.value}" begin="0" end="2">

												<div class="d-flex col-md-4 justify-content-center">
													<div class="thumbnail">
														<a href="uploadSur.do?s_num=${sur.s_num }"> <c:if
																test="${not empty sur.thumb_path }">
																<img src="/DotNet/save/${sur.thumb_path }" alt="Lights"
																	style="height: 300px; width: 301px;">
															</c:if> <c:if test="${ empty sur.thumb_path }">
																<img src="/DotNet/defaultImg/default.jpg" alt="Lights"
																	style="height: 300px; width: 301px;">
															</c:if>
														</a>
														<div>
															<h4>${sur.subject }</h4>
															<h4>조회수 : ${sur.hits} &nbsp;&nbsp; 포인트 : ${sur.point }</h4>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
									<c:if test="${fn:length(lib.value) gt 3 }">
										<div class="carousel-item ">
											<div class="row ">
												<c:forEach var="sur" items="${lib.value}" begin="3" end="5">
													<div class="d-flex col-md-4 justify-content-center">
														<div class="thumbnail">
															<a href="uploadSur.do?s_num=${sur.s_num }"> <c:if
																	test="${not empty sur.thumb_path }">
																	<img src="/DotNet/save/${sur.thumb_path }" alt="Lights"
																		style="height: 300px; width: 301px;">
																</c:if> <c:if test="${ empty sur.thumb_path }">
																	<img src="/DotNet/defaultImg/default.jpg" alt="Lights"
																		style="height: 300px; width: 301px;">
																</c:if>
															</a>
															<div>
																<h4>${sur.subject }</h4>
																<h4>조회수 : ${sur.hits} &nbsp;&nbsp; 포인트 :
																	${sur.point }</h4>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
										</div>
									</c:if>
								</div>

								
							</div>
							<a class="carousel-control-prev prev " href="" id = "${lib.key }"
									role="button" data-slide="prev"> <span
									class="carousel-control-prev-icon" aria-hidden="true"
									style="background-color: rgb(196, 171, 204, 0.3); width: 100px; height: 100px;"></span>
									<span class="sr-only">Previous</span>
								</a> <a class="carousel-control-next next " href="" id = "${lib.key }"
									role="button" data-slide="next"> <span
									class="carousel-control-next-icon" aria-hidden="true"
									style="background-color: rgb(196, 171, 204, 0.3); width: 100px; height: 100px;"></span>
									<span class="sr-only">Next</span>
								</a>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="jquery-3.4.1.js"></script>
	<script type="text/javascript" src="bootstrap.bundle.js"></script>

<script>
$('.next').click(function() {
	var carouselId = $(this).attr('id')
	console.log(carouselId)
	$('#'+carouselId).carousel('next');
	return false;
});
$('.prev').click(function() {
	var carouselId = $(this).attr('id')
	$('#'+carouselId).carousel('prev');
	return false;
});
</script>

</body>
</html>