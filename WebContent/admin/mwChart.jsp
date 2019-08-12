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
						<option>${el}</option>
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
		<div class=row>
			<c:forEach begin="1" end="${q_len}" varStatus="i">
				<input class="btn btn-primary ml-4" type="button" value="질문${i.count}" id="${i.count}">
			</c:forEach>
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
	var sexAllChart = new CanvasJS.Chart("sexAll", {
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
				{ y : ${dataForAll[0]}, label : "남자" },
				{ y : ${dataForAll[1]}, label : "여자" }
			]
		}]
	});
		
	sexAllChart.render();
	
	// 해당 설문 전체 참여 연령 분포
	var ageAllChart = new CanvasJS.Chart("ageAll", {
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
				{ y : ${dataForAll[2]}, label : "10대" },
				{ y : ${dataForAll[3]}, label : "20대" },
				{ y : ${dataForAll[4]}, label : "30대" },
				{ y : ${dataForAll[5]}, label : "40대" },
				{ y : ${dataForAll[6]}, label : "50대" },
				{ y : ${dataForAll[7]}, label : "60대" },
				{ y : ${dataForAll[8]}, label : "70대" }
			]
		}]
	});
	
	ageAllChart.render();
	
	////////////////////////////////// 질문별 데이터 /////////////////////////////////////
	
	// 보기 1번 성별 분포
	var sexSel1Chart = new CanvasJS.Chart("sexSel1", {
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
				{ y: ${dataForEachQ[2]}, label: "남자" },
				{ y: ${dataForEachQ[4]}, label: "여자" },
			]
		}]
	});
	
	sexSel1Chart.render();
	
	// 보기 1번 연령 분포
	var ageSel1Chart = new CanvasJS.Chart("ageSel1", {
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
				{ x: 10, y: ${dataForEachQ[6]} },
				{ x: 20, y: ${dataForEachQ[8]} },
				{ x: 30, y: ${dataForEachQ[10]} },
				{ x: 40, y: ${dataForEachQ[12]} },
				{ x: 50, y: ${dataForEachQ[14]} },
				{ x: 60, y: ${dataForEachQ[16]} },
				{ x: 70, y: ${dataForEachQ[18]} },
				
			]
		}]
	});
	
	ageSel1Chart.render();
	
	
	// 질문 보기 선택수
	var selAllChart = new CanvasJS.Chart("selAll", {
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
				{ label : "보기1번선택수", y: ${dataForEachQ[0]} },
				{ label : "보기2번선택수", y: ${dataForEachQ[1]} }
			]
		}]
	});
	
	selAllChart.render();
	
	
	// 보기 2번 성별 분포
	var sexSel2Chart = new CanvasJS.Chart("sexSel2", {
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
				{ y: ${dataForEachQ[3]}, label: "남자" },
				{ y: ${dataForEachQ[5]}, label: "여자" },
			]
		}]
	});
	
	sexSel2Chart.render();
	
	// 보기 2번 연령 분포
	var ageSel2Chart = new CanvasJS.Chart("ageSel2", {
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
				{ x: 10, y: ${dataForEachQ[7]} },
				{ x: 20, y: ${dataForEachQ[9]} },
				{ x: 30, y: ${dataForEachQ[11]} },
				{ x: 40, y: ${dataForEachQ[13]} },
				{ x: 50, y: ${dataForEachQ[15]} },
				{ x: 60, y: ${dataForEachQ[17]} },
				{ x: 70, y: ${dataForEachQ[19]} },
				
			]
		}]
	});
	
	ageSel2Chart.render();
	
	///////////////////////////////////////// ajax 처리 영역 //////////////////////////////////////////////
	//sexAllChart.options.data[0].dataPoints = sacData;
	var data = null;
	
	$('.btn').on('click',function(){
		data = $(this).attr("id");
		$.ajax({
			data:{"q_num" : data},
			dataType:"json",
			type:"POST",
			url:"changeQ_num.do",
			
			success:function(d){
				
			},
			error:function(){
				console.log("q_num ajax fail");
			}
		});
	});

	}// function
	
</script>
<!-- 
var data = null;
$(document).ready(function(){
	$('#snum').on('change',function(){
		data = $(this).val();
		console.log({data:data})
		$.ajax({
			data:{data:data},
			
			dataType:"json",
			type:"POST",
			url:"mw.do",
			
			success:function(d){
				console.log("s_num ajax success");
				$("#ap").children().remove();
				$("#ap").append('<div id="mw2" style="height: 370px; width: 50%;"></div><br><div id="age" style="height: 370px; width: 50%;"><br>' );
				
				 jmwArr = JSON.parse( d.jmwArr)
				 console.log("jmwARr"+jmwArr)
				 qlen = d.qlen;
// 				 slen = d.slen;
				 s_num = d.s_num;
				 console.log("in ajax s_num :"+ s_num)
				 wArr = jmwArr.slice(0,jmwArr.length/2);
				 mArr = jmwArr.slice(jmwArr.length/2);
				 
				 jageArr = JSON.parse( d.jageArr);
				 k=0;
				 for(var i = 0 ; i < jageArr.length; i+=jageArr.length/7){
						arrAge[k]  = jageArr.slice(i,i+jageArr.length/7);
						k++;
				}
				 
				 makeChart();
				 
				 
				
			},
			error:function(){
				console.log("s_num ajax fail");
			}
		});
	});
}); -->