<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
		<meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
		<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
        <title>Circle Hover Effects with CSS Transitions</title>
        <meta name="description" content="Circle Hover Effects with CSS Transitions" />
        <meta name="keywords" content="circle, border-radius, hover, css3, transition, image, thumbnail, effect, 3d" />
        <meta name="author" content="Codrops" />
        <link rel="shortcut icon" href="../favicon.ico"> 
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
		<link rel="stylesheet" type="text/css" href="css/common.css" />
        <link rel="stylesheet" type="text/css" href="css/style6.css" />
		<link href='http://fonts.googleapis.com/css?family=Open+Sans:300,700' rel='stylesheet' type='text/css' />
		<script type="text/javascript" src="js/modernizr.custom.79639.js"></script> 
		<!--[if lte IE 8]><style>.main{display:none;} .support-note .note-ie{display:block;}</style><![endif]-->
    </head>
    <body>
        <div class="container">
		
			<!-- Codrops top bar -->
            <div class="codrops-top">
                <a href="http://tympanus.net/Development/AnimatedResponsiveImageGrid/">
                    <strong>&laquo; Previous Demo: </strong>Animated Responsive Image Grid
                </a>
                <span class="right">
                    <a href=" http://tympanus.net/codrops/2012/08/08/circle-hover-effects-with-css-transitions/">
                        <strong>Back to the Codrops Article</strong>
                    </a>
                </span>
                <div class="clr"></div>
            </div><!--/ Codrops top bar -->
			
			<header>
			
				<h1><strong>Circle</strong> Hover Effects</h1>
				<h2>Pretty hover effects on circles with CSS Transitions</h2>
				
				<nav class="codrops-demos">
					<a href="index.html">Demo 1</a>
					<a href="index2.html">Demo 2</a>
					<a href="index3.html">Demo 3</a>
					<a href="index4.html">Demo 4</a>
					<a href="index5.html">Demo 5</a>
					<a class="current-demo" href="index6.html">Demo 6</a>
					<a href="index7.html">Demo 7</a>
				</nav>
				
				<div class="support-note"><!-- let's check browser support with modernizr -->
					<!--span class="no-cssanimations">CSS animations are not supported in your browser</span-->
					<span class="no-csstransforms">CSS transforms are not supported in your browser</span>
					<!--span class="no-csstransforms3d">CSS 3D transforms are not supported in your browser</span-->
					<span class="no-csstransitions">CSS transitions are not supported in your browser</span>
					<span class="note-ie">Sorry, only modern browsers.</span>
				</div>
				
			</header>
			
			<section class="main">
			
				<ul class="ch-grid">
					<li>
						<div class="ch-item ch-img-1">				
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-1"></div>
									<div class="ch-info-back">
										<h3>Services Image</h3>
										<p>by Gumball Creative <a href="http://drbl.in/eFDk">View on Dribbble</a></p>
									</div>	
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-2">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-2"></div>
									<div class="ch-info-back">
										<h3>Heart</h3>
										<p>by Brian Hurst <a href="http://drbl.in/eQva">View on Dribbble</a></p>
									</div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<div class="ch-item ch-img-3">
							<div class="ch-info-wrap">
								<div class="ch-info">
									<div class="ch-info-front ch-img-3"></div>
									<div class="ch-info-back">
										<h3>Art Print</h3>
										<p>by Tad Carpenter <a href="http://drbl.in/eNTe">View on Dribbble</a></p>
									</div>
								</div>
							</div>
						</div>
					</li>
				</ul>
				
			</section>
        </div>
    </body>
</html>
<%-- <html>
	<head>
		<meta charset="UTF-8">
		<title>오지선다 친구생각 확인하기</title>
		
		<!-- bootstrap css -->
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<!-- responsive(반응형)을 위한 meta -->
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		
		<!-- setting file -->
		<%@ include file="setting_survey.jsp" %>
		
		<!-- css for this page -->
		<style type="text/css">
			.row {
				border : 1px solid white transparent;
			}
			.container img {
				width : 60em;
				height : 45em;
			}
		</style>
	</head>
	<body>
		<!-- 상단 바 -->
		<nav class="navbar navbar-expand-md navbar-default">
			<jsp:include page="../mainNav.do" flush="false"></jsp:include>
		</nav>

		<div class="container">
		  <div class="row justify-content-center my-5">
		    <div class="col-8">
		    	<h2>각 질문을 선택해 친구의 생각을 알아보세요!</h2>
		    </div>
		  </div>
		  <div class="row justify-content-start my-5 py-1">
		    <div class="col-4">
		      <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus"
		 		data-placement="bottom"  data-content="${resultList[0]}">${fiveList[0].q_content}</a>
		    </div>
		    
		  </div>
		  <div class="row justify-content-center my-5 py-1">
		    <div class="col-4"></div>
		    <div class="col-4">
		      <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus"
		 		data-placement="right" data-content="${resultList[1]}">${fiveList[1].q_content}</a>
		    </div>
		  </div>
		  <div class="row justify-content-end my-5 py-1">
		    <div class="col-4">
		      <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus"
		 		data-placement="right" data-content="${resultList[2]}">${fiveList[2].q_content}</a>
		    </div>
		    <div class="col-4"></div>
		  </div>
		  <div class="row justify-content-around my-5 py-1">
		    <div class="col-4">
		      <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus"
		 		data-placement="bottom" data-content="${resultList[3]}">${fiveList[3].q_content}</a>
		    </div>
		    <div class="col-4"></div>
		  </div>
		  <div class="row justify-content-between my-5 py-1">
		    <div class="col-4"></div>
		    <div class="col-4">
		      <a tabindex="0" class="btn btn-lg btn-danger" role="button" data-toggle="popover" data-trigger="focus"
		 		data-placement="top" data-content="${resultList[4]}">${fiveList[4].q_content}</a>
		    </div>
		  </div>
		  <img src="/DotNet/defaultImg/think.jpg" class="mx-auto d-block" alt="생각하는 남자">
		</div>
		
		<!-- bootstrap js -->
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		
		<script type="text/javascript" src="/DotNet/bootstrap.min.js"></script>
		<!-- script for this page -->
		<script type="text/javascript">
			//popover 초기 필수 설정
			$(function () {
				  $('[data-toggle="popover"]').popover();
				  $('.popover-dismiss').popover({
					  trigger: 'focus'
					});
			})
			$(document).ready(
				function(){
					$("a[data-content='']").hide();
					
				}		
			);
			
		</script>
	</body>
</html> --%>