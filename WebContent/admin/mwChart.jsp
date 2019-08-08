<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<style>
<!--
	.mini {
		height: 15rem;
		width: 100%;
	}
-->
</style>

<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do"/>
<main class="page-content">
<div class="container-fluid">
	<div class="card col-md-10">
		<h2 class="mt-3">설문 유형 2 데이터</h2>
		<hr>
		<h5>사이트 데이터관리 > 설문유형 2 데이터</h5>
		<hr>
		<!-- 사이드바  1-1 end -->
<br>
<br>
<div class="row">

	<label>양자 택일 번호</label>
	<div class="col-md-4">
		<select class="form-control" id="snum" >
			<c:forEach var="el" items="${getS_numList}"> 
				<option>${el }</option>
			</c:forEach>
		</select>
	</div>
	<div class="col-md-4"></div>

	<br>
	<br>

	<div id="sexAll" style="height: 30rem; width: 50%;"></div>
	<div id="ageAll" style="height: 30rem; width: 50%;"></div>
</div>
<br>
<br>
<br>
<div class="row">
	<div class="col">
		<div class="row">
			<div id="sexSel1" class="mini"></div>
		</div>
		<div class="row">
			<div id="ageSel1" class="mini"></div>
		</div>
	</div>
	<div class="col-5">
		<br><br><br>
		<div id="selAll" style="width: 100%;"></div>
	</div>
	<div class="col">
		<div class="row">
			<div id="sexSel2" class="mini"></div>
		</div>
		<div class="row">
			<div id="ageSel2" class="mini"></div>
		</div>
	</div>
</div>

		<!-- 사이드바 2-2 start --> 
	</div>
</div>
</main>
<!-- 사이드바 2-2 end --> 


<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
	window.onload = function() {
	
	////////////////////////////////// 해당 설문 전체 데이터 ///////////////////////////////////////	
		
	// 해당 설문 전체 참여 성별 분포
	var sexAllchart = new CanvasJS.Chart("sexAll", {
		animationEnabled: true,
		title:{
			text: "남여 총 참여 비율",
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 17,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				{ y: 65, label: "남자" },
				{ y: 35, label: "여자" },
			]
		}]
	});
	
	sexAllchart.render();
	
	// 해당 설문 전체 참여 연령 분포
	var ageAllchart = new CanvasJS.Chart("ageAll", {
		animationEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "연령별 총 참여 비율"
		},
		data: [{
			type: "column", //change type to bar, line, area, pie, etc
			indexLabel: "{y}", //Shows y value on all Data Points
			indexLabelFontColor: "#5A5757",
			indexLabelPlacement: "outside",
			dataPoints: [
				{ label : "10대", y: 71 },
				{ label : "20대", y: 55 },
				{ label : "30대", y: 50 },
				{ label : "40대", y: 65 },
				{ label : "50대", y: 92 },
				{ label : "60대", y: 68 },
				{ label : "70대", y: 38 },
			]
		}]
	});
	
	ageAllchart.render();
	
	////////////////////////////////// 질문별 데이터 /////////////////////////////////////
	
	// 보기 1번 성별 분포
	var sexSel1chart = new CanvasJS.Chart("sexSel1", {
		animationEnabled: true,
		title:{
			text: "보기 1번 성별 분포",
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 10,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				{ y: 35, label: "남자" },
				{ y: 45, label: "여자" },
			]
		}]
	});
	
	sexSel1chart.render();
	
	// 보기 1번 연령 분포
	var ageSel1chart = new CanvasJS.Chart("ageSel1", {
		animationEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "보기 1번 연령분포"
		},
		data: [{
			type: "column", //change type to bar, line, area, pie, etc
			//indexLabel: "{y}", //Shows y value on all Data Points
			indexLabelFontColor: "#5A5757",
			indexLabelPlacement: "outside",
			dataPoints: [
				{ x: 10, y: 71 },
				{ x: 20, y: 55 },
				{ x: 30, y: 50 },
				{ x: 40, y: 65 },
				{ x: 50, y: 92 },
				{ x: 60, y: 68 },
				{ x: 70, y: 38 },
				
			]
		}]
	});
	
	ageSel1chart.render();
	
	
	// 질문 보기 선택수
	var selAllchart = new CanvasJS.Chart("selAll", {
		animationEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "보기 선택수"
		},
		data: [{
			type: "column", //change type to bar, line, area, pie, etc
			indexLabel: "{y}", //Shows y value on all Data Points
			indexLabelFontColor: "#5A5757",
			indexLabelPlacement: "outside",
			dataPoints: [
				{ label : "보기1", y: 71 },
				{ label : "보기2", y: 55 }
			]
		}]
	});
	
	selAllchart.render();
	
	
	
	
	// 보기 2번 성별 분포
	var sexSel2chart = new CanvasJS.Chart("sexSel2", {
		animationEnabled: true,
		title:{
			text: "보기 2번 성별 분포",
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			//innerRadius: 60,
			indexLabelFontSize: 10,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: [
				{ y: 25, label: "남자" },
				{ y: 75, label: "여자" },
			]
		}]
	});
	
	sexSel2chart.render();
	
	// 보기 2번 연령 분포
	var ageSel2chart = new CanvasJS.Chart("ageSel2", {
		animationEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "보기 2번 연령분포"
		},
		data: [{
			type: "column", //change type to bar, line, area, pie, etc
			//indexLabel: "{y}", //Shows y value on all Data Points
			indexLabelFontColor: "#5A5757",
			indexLabelPlacement: "outside",
			dataPoints: [
				{ x: 10, y: 52 },
				{ x: 20, y: 44 },
				{ x: 30, y: 53 },
				{ x: 40, y: 80 },
				{ x: 50, y: 42 },
				{ x: 60, y: 68 },
				{ x: 70, y: 68 },
				
			]
		}]
	});
	
	ageSel2chart.render();
	
	}// function
	
</script>
