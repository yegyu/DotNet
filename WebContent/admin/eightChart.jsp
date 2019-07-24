<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<br>
<br>
<div class="row">

<label>오지선다 번호</label>
<div class="col-md-4">
<select class="form-control" id="esnum" >
<c:forEach var="el" items="${getS_numList}"> 
<option>${el }</option>
</c:forEach>
</select>
</div>
<div class="col-md-4">
<button class="btn" id="esur">설문 보기</button>
</div>
<br>
<br>
</div>
<div id="eap">
<div id="emw" style="height: 370px; width: 100%;"></div>
<div id="eage" style="height: 370px; width: 100%;"></div>
</div>


<script type="text/javascript">
$("#esur").on('click',function(){
	var url="userMySurveyDetail.do?s_num=" + $("#esnum").val();
	window.open(url,'결과 테이블',"width=880, height=760, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
});
</script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>