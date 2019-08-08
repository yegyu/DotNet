<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<link rel="stylesheet" href="/DotNet/bootstrap.css">
	
	<!-- bootstrap css -->
	<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
	 
	<!-- 네비게이션 바 아이콘용 CDN -->	
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
        integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">
        		
	<link
		href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap"
		rel="stylesheet">
		
	<!-- style_dotnet.css -->
	<link rel="stylesheet" type="text/css" href="/DotNet/style_dotnet.css" />
	
	<!-- css for this page -->
	<style type="text/css">
		/* 상단바 전용 css */
		a {
			color : black;
		}
	</style>
	
	
	<div class="navbar-collapse collapse w-100 order-1 order-md-0 "
		id="myNavbar">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item"><a class="nav-link mainboard"
				href="main.do?b_tp=1">메인&nbsp;&nbsp;&nbsp;</a></li>
			<li class="nav-item"><a class="nav-link subboard"
				href="main.do?b_tp=2">보조</a></li>
		</ul>
	</div>
	
	<div class="mx-auto">
		<a class="navbar-brand" href="main.do"><h1 id="logo">.Net</h1> </a>
	</div>
	<div class="navbar-collapse collapse w-100 order-3 " id="myNavbar">
		<ul class="navbar-nav ml-auto navbar-right">
		
		<c:choose>
			<c:when test="${not empty sessionScope.memId }">
				<li style="padding-top: 15px; padding-right: 10px;">
				${sessionScope.memId} 님
				</li>
				
				<li><a class="nav-link notboard" href="/DotNet/receiveMail.do"><i class="fas fa-portrait"></i>
                       My Page&nbsp;&nbsp;&nbsp;
                </a></li>
				
				
				<li><a class="nav-link notboard" href="main.do?logout=true"><i class="fas fa-user-circle"></i>
                     Logout&nbsp;&nbsp;&nbsp;
                </a></li>
			</c:when>
			<c:otherwise>
                <li><a class="nav-link notboard" href="/DotNet/login.do"><i class="far fa-user-circle"></i>
                     Login&nbsp;&nbsp;&nbsp;
                </a></li>
                
                <li><a class="nav-link notboard" href="/DotNet/signup.do"><i class="fas fa-user-plus"></i>
                         Sign Up&nbsp;&nbsp;&nbsp;
                </a></li>
			</c:otherwise>
		
		</c:choose>
			
			
			
		</ul>
	</div>
	
	