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

 th.head {
	background:#EAEAEA;
}
</style>

<table class="mdl-data-table mdl-js-data-table mdl-data-table--selectable mdl-shadow--2dp">
  <thead>
    <tr>
		<th class="mdl-data-table__cell--non-numeric" style="width:15%">문의유형</th>
		<th class="mdl-data-table__cell--non-numeric" style="width:10%">작성자</th>
		<th class="mdl-data-table__cell--non-numeric" style="width:15%">기업명</th>
		<th class="mdl-data-table__cell--non-numeric" style="width:40%"> 제 목 </th>
		<th class="mdl-data-table__cell--non-numeric"style="width:20%">문의상태</th>
    </tr>
  </thead>
<c:set var="c" value="0"/>
	<c:forEach var="asks" items="${getQuestions}">
		  <tbody>
 			<tr>
				<th class="mdl-data-table__cell--non-numeric">${asks.co_type}</th>
				<th class="mdl-data-table__cell--non-numeric">${asks.a_name}</th>
				<th class="mdl-data-table__cell--non-numeric">${asks.co_name}</th>
				<th id="title${c}"><a href="">${asks.co_title }</a></th>
				<th><fmt:formatDate value="${asks.w_date}" pattern="yyyy년 MM월 dd일 hh:mm" /></th>
			</tr>
		  </tbody>
		<c:set var="c" value="${c+1}"/>
</c:forEach>
  
</table>

<script>
var c = $(c);
for(var i=0; i<10; i++){
	$("#flip"+i).hide();
}
for(c=0; c<10; c++){
	if($('#flip'+c).hide('display') != "none"){
		$('#a'+c).click(function(){$('#flip'+c).show()
		});
	}
}
</script>
