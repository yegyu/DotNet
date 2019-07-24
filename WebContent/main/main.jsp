<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting_main.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="description" content="">
		<meta name="author" content="">
		<title>.NET Sample</title>
		
		
		<!-- bootstrap CDN -->
		<link rel="stylesheet" href="bootstrap.css">
		<link href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
		
		<!-- style_dotnet.css -->
		<link rel="stylesheet" type="text/css" href="style_dotnet.css" />
		<link rel="stylesheet" type="text/css" href="mainCss.css" />
		
		
		<style>
		.fixed-bottom{
		display: none;
		}
		
		a#MOVE_TOP_BTN { 
		    position: fixed; 
			left: 1500px; 
			bottom: 50px; 
		     display: none; 
		     z-index: 999; 
		}
		
		#postsCarousel > div > div > div.carousel-item.active > div
		{
			border: transparent;
		}
		button#searchButton{
		position:relative;
		border:0px;
		bottom: 10px;
		background-color:transparent;
		
		}
		.search_input {
			position:relative;
			bottom:35px;
			color: white;
			font-size: 20px;
			border: 0;
			outline: 0;
			background: transparent;
			line-height: 40px;
			padding: 0 10px;
			width: 450px;
			
		
		}
		#no_search{
		display: none;
		}
		#write_btn {
			height : 45px;
			width : 100px;
			margin : 10px;
			
		}
		
		</style>
	</head>

	<!-- 상단 바 -->
	
	<nav class="navbar navbar-expand-md navbar-default">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->

	<section class="container p-t-3">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<h1 align="center">오늘의 퀴즈</h1>
				</div>
			</div>
	
			<hr>
			<br>
		</div>
	</section>




	<!-- 슬라이드 영역 -->
	<section class="carousel slide" data-ride="carousel" id="postsCarousel">
	
	    <div class="container carousel-inner">
	        <div class="row">
	
	            <div class="carousel-item active ">
		            <div class="card-deck">
		                <c:forEach var="col" items="${todaysurs}" begin="0" end="2" varStatus="index">
							
		                    <div class="card zoom text-center" >
		                        <div class="card-img-top card-img-top-250">
		                            <c:if test="${empty col.thumb_path}">
		                                <a href="sur.do?s_num=${col.s_num}&s_tp_num=${col.s_tp_num}" class="fancybox" rel="ligthbox"> 
		                                	<img src="/DotNet/defaultImg/default.jpg" class="img-fluid " alt="">
		                                </a>
		                            </c:if>
		                            <c:if test="${!empty col.thumb_path }">
		                                <a href="sur.do?s_num=${col.s_num}&s_tp_num=${col.s_tp_num}" class="fancybox" rel="ligthbox"> 
		                                	<img src="/DotNet/save/${col.thumb_path}" class="img-fluid " alt="">
		                                </a>
		                            </c:if>
		                        </div>
		                        <div class="card-block p-t-2">
		                            <h6 class="small text-wide p-b-2">포인트:${col.point}</h6>
		                            <h2>
		                                <a href>
		                                	${col.subject}<br>참여자수 : ${col.partnum}<br>조회수 : ${col.hits}<br>
		                                </a>
		                            </h2>
		                        </div>
		                    </div>
		                    
		                </c:forEach>
		            </div>
	            </div>
				
	            <div class="carousel-item ">
	            	<div class="card-deck">
		                <c:forEach var="col" items="${todaysurs }" begin="3" end="5" varStatus="index">
		                    <div class="card zoom text-center">
		                        <div class="card-img-top card-img-top-250">
		                            <c:if test="${empty col.thumb_path }">
		                                <a href="sur.do?s_num=${col.s_num}&s_tp_num=${col.s_tp_num}" class="fancybox" rel="ligthbox"> <img src="/DotNet/defaultImg/default.jpg"
		                                        class="img-fluid " alt="">
		                                </a>
		                            </c:if>
		                            <c:if test="${!empty col.thumb_path  }">
		                                <a href="sur.do?s_num=${col.s_num}&s_tp_num=${col.s_tp_num}" class="fancybox" rel="ligthbox"> <img src="/DotNet/save/${col.thumb_path}"
		                                        class="img-fluid " alt="">
		                                </a>
		                            </c:if>
		                        </div>
		                        <div class="card-block p-t-2">
		                            <h6 class="small text-wide p-b-2">포인트:${col.point}</h6>
		                            <h2>
		                                <a href>
											${col.subject}<br>참여자수 : ${col.partnum}<br>조회수 : ${col.hits}<br>
		                                </a>
		                            </h2>
		                        </div>
		                    </div>
		                </c:forEach>
	                </div>
	            </div>
	
	        </div>
	    </div>
	</section>
	<!-- 슬라이드 끝 -->

	<!-- 슬라이드 버튼 -->
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-xs-12 text-md-center lead ">
				<a class="btn btn-outline-secondary prev" href="" title="left"><i
					class="fa fa-lg fa-chevron-left"><span
						class="glyphicon glyphicon-chevron-left" style="margin-top: 15px"></span></i></a>
				<a class="btn btn-outline-secondary next" href="" title="right"><i
					class="fa fa-lg fa-chevron-right"><span
						class="glyphicon glyphicon-chevron-right" style="margin-top: 15px"></span></i></a>
			</div>
		</div>
		<hr>
	</div>
	<br>
	<br>
	<!-- 슬라이드 버튼  끝-->
	
	<!--검색 창과 dropdown  -->
	<input type="hidden" name="b_tp_num" value="${b_tp}">
	<div class="container h-100">
		<!-- 	<div class="row"> -->
		<div class="d-flex justify-content-center h-100">
			<div class="searchbar">
				<input class="search_input" type="text" name="searchInput" id="searchInput"
					placeholder="Search..."> <button id="searchButton"><i
					class="glyphicon glyphicon-search" id="i_search" ></i></button>
			</div>
			<div class="form-group">
				<!-- 			<label for="sel1">정렬</label>  -->
				<select class="form-control selectpicker" id="align" name="align" >
	
					<option value="recent" >최신순</option>
					<option value="partnum" >조회순</option>
					<option value="hits">인기순</option>
					<option value="point">포인트순</option>
				</select>
			</div>
			
			<a id="write_btn" class="btn btn-outline-secondary" href="surveyMakeSelect.do" style="padding-top : 15px" >글쓰기</a>
		</div>
		<div class="d-flex justify-content-center h-100">
			<div id="no_search" ><h2>검색결과가 없습니다.</h2></div>
		</div>
	</div>
	<br>

	<!-- up 이동 -->
	<div class="fixed-bottom">
	<a href="" class="btn btn-info btn-lg">
		<span class="glyphicon glyphicon-chevron-up" id="MOVE_TOP_BTN"></span> TOP
	</a>
	</div>
	<br>
	

	<!-- Ajax 영역 -->
	<div class="container">
		<div class="container" id="board">
			<div class="article-feed">
				<article class="article" id="top">
				</article>
			</div>
			<br> <br>
			<!-- card deck end -->
		</div>
		<!--test board end  -->
	</div>


<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript" src="bootstrap.bundle.js"></script>
<script type="text/javascript" src="script_main.js"></script>
	<script>
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 700) {
	        	$(".fixed-bottom").fadeIn();
	//             $('#MOVE_TOP_BTN').fadeIn();
	        } else {
	        	$(".fixed-bottom").fadeOut();
	//             $('#MOVE_TOP_BTN').fadeOut();
	        }
	    });
	    
	    $("#MOVE_TOP_BTN").click(function() {
	        $('html, body').animate({
	            scrollTop : 0
	        }, 1000);
	        
	        return false;
	    });
	});
	//for 슬라이드
	(function($) {
		"use strict";
		// manual carousel controls
		$('.next').click(function() {
			$('.carousel').carousel('next');
			return false;
		});
		$('.prev').click(function() {
			$('.carousel').carousel('prev');
			return false;
		});
		$('.carousel').carousel({
			interval : 4000
		});
	})(jQuery);
	
	(function () {
	
		  $(".zoom").hover(function () {
	
		    $(this).addClass('transition');
		  }, function () {
	
		    $(this).removeClass('transition');
		  });
		})();
	
	$("document").ready(function(){
		$('html, body').animate({
	        scrollTop : 0
	    }, 100);
		
	});	
	$("#searchInput").keyup(function(e){
		if(e.which == 13){
			$("#searchButton").click();
		}else{
			$("#no_search").hide("slow");
		}
		
	})
	
	//글쓰기 제약
	$(document).ready(
		function(){
		$("#write_btn").on(
			"click",
			function(e){
				var id = '${sessionScope.memId}';
				var isAdmin = '${sessionScope.isAdmin}';
				
				//alert("id : " + id + " isAdmin : " + isAdmin);
				if(id == null || id == "") {
					alert("로그인 후 이용하세요");
					e.preventDefault();
				}
			}
		);		
	});
	
	
	</script>


</html>


