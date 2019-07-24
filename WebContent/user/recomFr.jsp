<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<style>
    .card-back {
        display: none;
    }
</style>


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
<%--             <c:forEach var="arrCol" items="${arrRow }" varStatus="ci"> --%>
<!--                 <div class="row"> -->
<%--                     <div class="card card-back " id="b${ri.index}b${ci.index}" --%>
<!--                         style="width: 1000px; margin-left: 50px; margin-right: 50px; margin-top:10px; "> -->
<!--                         style="position: relative; top:300px; z-index:1;  -->
<%--                         <div class="col-md-1">id : ${arrCol.id } ,gender : --%>
<%--                             ${arrCol.gender } &nbsp;&nbsp;&nbsp; --%>
<!--                         </div> -->
<!--                         <div class="col-md-3"> -->
<!--                             <img src="save/1.jpg" style="width:100%; margin-right:10px"> -->
<!--                         </div> -->
<!--                         <div class="col-md-3"> -->
<!--                             <img src="save/2.jpg" style="width:100%;"> -->
<!--                         </div> -->
<!--                         <div class="col-md-3"> -->
<!--                             <img src="save/default.jpg" style="width:100%;"> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<%--             </c:forEach> --%>
        </div>
        <br>
    </c:forEach>
</div>