<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>		
	<!--  Bootstrap  -->
	<link rel="stylesheet" href="/DotNet/css/bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script type="text/javascript" src="/DotNet/js/bootstrap.bundle.js"></script>
	
	<!--MDL CDN  -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
<style>
th{
	text-align : center;
	font-size : 20px;
}

th#content{
	height : 200px;
	background:#EAEAEA;
	
}

 th#head {
	background:#EAEAEA;
	font-size: 18px;
	color: black;
	text-align:center;
}
th#title{
	font-size: 17px;
	text-align:center;
}

</style>
<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do"/>
<main class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">기업 문의/신청 관리</h2>
		<hr>
		<h5>기업문의/신청 > 기업문의/신청 관리</h5>
		<hr>
		<!-- 사이드바  1-1 end -->

<table class="mdl-data-table mdl-js-data-table mdl-data-table mdl-shadow--2dp">
  <thead>
    <tr>
		<th id="head" class="mdl-data-table__cell--non-numeric" style="width:15%">문의유형</th>
		<th id="head" class="mdl-data-table__cell--non-numeric" style="width:10%">작성자</th>
		<th id="head" class="mdl-data-table__cell--non-numeric" style="width:15%">기업명</th>
		<th id="head" class="mdl-data-table__cell--non-numeric text-center" style="width:50%;"> 제 목 </th>
		<th id="head" class="mdl-data-table__cell--non-numeric"style="width:10%">문의상태</th>
    </tr>
  </thead>
<c:if test="${getQuestion == ''}">
	<tr>
		<th style="text-align:center;" colspan="5">
			[아직 작성된 문의가 없습니다...]
		</th>
	</tr>
</c:if> 
<c:if test="${getQuestion != ''}">
<c:set var="c" value="0"/>
	<c:forEach var="asks" items="${getQuestions}">
		  <tbody>
 			<tr>
				<th id="title" class="mdl-data-table__cell--non-numeric">[${asks.co_type}]</th>
				<th id="title" class="mdl-data-table__cell--non-numeric">${asks.a_name}</th>
				<th id="title" class="mdl-data-table__cell--non-numeric">${asks.co_name}</th>
				<th id="title"><div class="text-center"><a id="show-dialog" href="" style="color:black;" data-toggle="modal" data-target="#content">${asks.co_title}</a></div></th>
				<th id="title" class="mdl-data-table__cell--non-numeric">${asks.co_read}</th>
<%-- 				<th><fmt:formatDate value="${asks.w_date}" pattern="yyyy년 MM월 dd일 hh:mm" /></th> --%>
			</tr>
		  </tbody>
		<c:set var="c" value="${c+1}"/>
</c:forEach>
</c:if>
  
</table>

		<!-- 사이드바 2-2 start --> 
	</div>
</div>
</main>
<!-- 사이드바 2-2 end --> 

  <dialog class="mdl-dialog">
    <h4 class="mdl-dialog__title">Allow data collection?</h4>
    <div class="mdl-dialog__content">
      <p>
        ${asks.co_content}
      </p>
    </div>
    <div class="mdl-dialog__actions">
      <button type="button" class="mdl-button">Agree</button>
      <button type="button" class="mdl-button close">Disagree</button>
    </div>
  </dialog>

  <script>
    var dialog = document.querySelector('dialog');
    var showDialogButton = document.querySelector('#show-dialog');
    if (! dialog.showModal) {
      dialogPolyfill.registerDialog(dialog);
    }
    showDialogButton.addEventListener('click', function() {
      dialog.showModal();
    });
    dialog.querySelector('.close').addEventListener('click', function() {
      location.reload();
    });
  </script>
