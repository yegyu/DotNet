<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<style>
    .card-back {
        display: none;
    }
    .btn{
    	position: relative;
    	bottom:0px;
    }
    .card-front:hover{
    	border : 2px solid rgba(227, 179, 255, 0.938) ;
    }



</style>
<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do" />
<main class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">내 친구 관리</h2>
		<hr>
		<h5>내 친구 관리 > 친구신청 현황</h5>
		<hr>
		<!-- 사이드바  1-1 end -->
		
		
<c:set var="accBtn" value="${ getAccBtnId}" />
<c:set var="waitBtn" value="${getWatiBtnId }" />
<c:set var="getRealFrBtn" value="${getRealFrBtn }"/>
<div class="container-fluid">
    <br>
    <c:forEach var="arrRow" items="${myFrArr }" varStatus="ri">
        <div class="row">
            <c:forEach var="arrCol" items="${arrRow }" varStatus="ci">

                <c:set var="rand" value="${ Math.random() * 10 } " />
                <c:if test="${arrCol != null }">
                    <div class="card card-front" id="f${ri.index}f${ci.index}"
                        style="width: 200px; margin-left: 30px; margin-right: 30px; margin-botton:30px; 
                        ">
                        <h1 align="center">${arrCol.id}</h1>
                        <fmt:parseNumber var="r" integerOnly="true" value="${rand}" />

                        <img class="card-img-top" src="/DotNet/defaultImg/${emo[r mod 3] }" alt="Card image"
                            style="width: 170px; height:180px; ">
                        <div class="card-body">
                            <p></p>

                                <c:if test="${!fn:contains(accBtn,arrCol.id) and !fn:contains(waitBtn,arrCol.id) }">
                                	<p></p>
                                    <button class="btn btn-danger rejBtn" id="${arrCol.id }">차단</button>
                                </c:if>
                                <c:if test="${fn:contains(accBtn, arrCol.id) }">
                                    <button class="btn accBtn" id="${arrCol.id }">요청 수락</button>
                                    <button class="btn btn-danger rejBtn" id="${arrCol.id }">차단</button>
                                </c:if>
                                <c:if test="${fn:contains(waitBtn,arrCol.id) }">
                                    <button class="btn" id="waitBtn" disabled>요청 대기</button>
                                </c:if>
                        </div>
                    </div>

                </c:if>
            </c:forEach>
                   </div>
        <br>
    </c:forEach>
    
</div>
</div>
 </div>
</main>
<!-- 사이드바 2-2 end --> 
 
<script>
$(document).ready(function(){
	var btnob = {"id":null , "btn" : null};
	$('.card-body > button').on('click',function(){
		if ($(this).hasClass("rejBtn")){
			btnob.id = $(this).prop('id');
			btnob.btn = "rejBtn";
		}else if ($(this).hasClass("accBtn")){
			btnob.id = $(this).prop('id');
			btnob.btn = "accBtn";
		}else if($(this).hasClass("reqBtn")){
			btnob.id = $(this).prop('id');
			btnob.btn = "reqBtn";
		}
		
		var data = {"fr" : JSON.stringify(btnob)};
		console.log(data);
		$.ajax({
			type:'POST',
			dataType:'json',
			data:data,
			url:"frBtn.do",
			success:function(data){
				location.reload();
			},
			error:function(){
				alert("error");
			}
			
		});
		
	});
			
});
</script>
</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->