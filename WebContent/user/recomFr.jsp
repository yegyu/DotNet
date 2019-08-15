<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 사이드바  1-1 start-->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
    .card-back {
        display: none;
    }
</style>
<jsp:include page="../mypage.do"/>
<main class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">내 최근 참여 설문</h2>
		<hr>
		<h5>내 설문관리 > 내 최근 참여 설문</h5>
		<hr>
		<!-- 사이드바  1-1 end -->



<div class="container-fluid">
    <br>
    <c:forEach var="arrRow" items="${twoDArr }" varStatus="ri">
        <div class="row">
            <c:forEach var="arrCol" items="${arrRow }" varStatus="ci">
                <c:if test="${arrCol !=null }">
                    <c:set var="rand" value="${ Math.random() * 10 } " />

                    <div class="card card-front" id="f${ri.index}f${ci.index}"
                        style="width: 200px; margin-left: 30px; margin-right: 30px; margin-botton:30px">
                        <h1 align="center">${arrCol.id}</h1>
                        <fmt:parseNumber var="r" integerOnly="true" value="${rand}" />

                        <img class="card-img-top" src="/DotNet/defaultImg/${emo[r mod 3] }" alt="Card image"
                            style="width: 170px;height:180px;">
                        <div class="card-body">
                            <p> &nbsp;&nbsp;&nbsp;</p>
                                <%-- 							location :${arrCol.location } email : ${arrCol.email } r mod 3:${r mod 3 } emotion : ${emo[r mod 3]}</p> --%>
                                <button class="btn reqBtn" id="${arrCol.id }">친구 요청</button>
                        </div>
                    </div>

                </c:if>
            </c:forEach>

	<!-- 사이드바 2-2 start --> 
	</div>
	 </c:forEach>
</div>
<!-- 사이드바 2-2 end --> 
        </div>
        <br>
   
</div>
</main>
</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->