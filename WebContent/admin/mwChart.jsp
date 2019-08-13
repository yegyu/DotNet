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
				<select class="form-control" id="s_num" >
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
	//////////////////////////// 그래프 담을 변수들 /////////////////////////////////
	var sexAllChart = null;		// 전체 참여 성별
	var ageAllChart = null;		// 전체 참여 연령별
	var selAllChart = null;		// 전체 보기 선택 수
	var sexSel1Chart = null;	// 보기 1번 성별
	var ageSel1Chart = null;	// 보기 1번 연령별
	var sexSel2Chart = null;	// 보기 2번 성별
	var ageSel2Chart = null;	// 보기 2번 연령별
	
	//////////////////////////// 초기 데이터 ////////////////////////////////////////
	var initData =
	[
		[	// 전체 참여 성별
			{ y : ${dataForAll[0]}, label : "남자" },
			{ y : ${dataForAll[1]}, label : "여자" }
		],
		[	// 전체 참여 연령별
			{ y : ${dataForAll[2]}, label : "10대" },
			{ y : ${dataForAll[3]}, label : "20대" },
			{ y : ${dataForAll[4]}, label : "30대" },
			{ y : ${dataForAll[5]}, label : "40대" },
			{ y : ${dataForAll[6]}, label : "50대" },
			{ y : ${dataForAll[7]}, label : "60대" },
			{ y : ${dataForAll[8]}, label : "70대" }
		],
		[	// 전체 보기 선택 수
			{ label : "보기1번선택수", y: ${dataForEachQ[0]} },
			{ label : "보기2번선택수", y: ${dataForEachQ[1]} }
		],
		[	// 보기 1번 성별
			{ y: ${dataForEachQ[2]}, label: "남자" },
			{ y: ${dataForEachQ[4]}, label: "여자" }
		],
		[	// 보기 1번 연령별
			{ x: 10, y: ${dataForEachQ[6]} },
			{ x: 20, y: ${dataForEachQ[8]} },
			{ x: 30, y: ${dataForEachQ[10]} },
			{ x: 40, y: ${dataForEachQ[12]} },
			{ x: 50, y: ${dataForEachQ[14]} },
			{ x: 60, y: ${dataForEachQ[16]} },
			{ x: 70, y: ${dataForEachQ[18]} }
		],
		[	// 보기 2번 성별
			{ y: ${dataForEachQ[3]}, label: "남자" },
			{ y: ${dataForEachQ[5]}, label: "여자" }
		],
		[	// 보기 2번 연령별
			{ x: 10, y: ${dataForEachQ[7]} },
			{ x: 20, y: ${dataForEachQ[9]} },
			{ x: 30, y: ${dataForEachQ[11]} },
			{ x: 40, y: ${dataForEachQ[13]} },
			{ x: 50, y: ${dataForEachQ[15]} },
			{ x: 60, y: ${dataForEachQ[17]} },
			{ x: 70, y: ${dataForEachQ[19]} }
		]
	];
	
	////////////////////////////////////// 페이지 처음 로딩시    ///////////////////////////////////////
	function makeChart(Data) {
		////////////////////////////////// 해당 설문 전체 그래프 ///////////////////////////////////////	
		// 해당 설문 전체 참여 성별 분포
		sexAllChart = new CanvasJS.Chart("sexAll", {
			animationEnabled: true,
			title:{
				text: "남여 총 참여 비율",
			},
			data: [{
				type: "doughnut",
				startAngle: 60,
				indexLabelFontSize: 17,
				indexLabel: "{label} - #percent%",
				toolTipContent: "<b>{label}:</b> {y} (#percent%)",
				dataPoints: []
			}]
		});
		
		// 해당 설문 전체 참여 연령 분포
		ageAllChart = new CanvasJS.Chart("ageAll", {
			animationEnabled: true,
			theme: "light1",
			title:{
				text: "연령별 총 참여 비율"
			},
			data: [{
				type: "column",
				indexLabel: "{y}",
				indexLabelFontColor: "#5A5757",
				indexLabelPlacement: "outside",
				dataPoints: []
			}]
		});
		
		////////////////////////////////// 질문별 그래프 /////////////////////////////////////
		
		// 질문 보기 선택수
		selAllChart = new CanvasJS.Chart("selAll", {
			animationEnabled: true,
			theme: "light1",
			title:{
				text: "보기 선택수"
			},
			data: [{
				type: "column", 
				indexLabel: "{y}",
				indexLabelFontColor: "#5A5757",
				indexLabelPlacement: "outside",
				dataPoints: []
			}]
		});
		
		// 보기 1번 성별 분포
		sexSel1Chart = new CanvasJS.Chart("sexSel1", {
			animationEnabled: true,
			title:{
				text: "보기 1번 성별 분포",
			},
			data: [{
				type: "doughnut",
				startAngle: 60,
				indexLabelFontSize: 10,
				indexLabel: "{label} - #percent%",
				toolTipContent: "<b>{label}:</b> {y} (#percent%)",
				dataPoints: []
			}]
		});
		
		// 보기 1번 연령 분포
		ageSel1Chart = new CanvasJS.Chart("ageSel1", {
			animationEnabled: true,
			theme: "light1",
			title:{
				text: "보기 1번 연령분포"
			},
			data: [{
				type: "column", 
				indexLabelFontColor: "#5A5757",
				indexLabelPlacement: "outside",
				dataPoints: []
			}]
		});
		
		// 보기 2번 성별 분포
		sexSel2Chart = new CanvasJS.Chart("sexSel2", {
			animationEnabled: true,
			title:{
				text: "보기 2번 성별 분포",
			},
			data: [{
				type: "doughnut",
				startAngle: 60,
				indexLabelFontSize: 10,
				indexLabel: "{label} - #percent%",
				toolTipContent: "<b>{label}:</b> {y} (#percent%)",
				dataPoints: []
			}]
		});
		
		// 보기 2번 연령 분포
		ageSel2Chart = new CanvasJS.Chart("ageSel2", {
			animationEnabled: true,
			theme: "light1",
			title:{
				text: "보기 2번 연령분포"
			},
			data: [{
				type: "column",
				indexLabelFontColor: "#5A5757",
				indexLabelPlacement: "outside",
				dataPoints: []
			}]
		});
	
		sexAllChart.options.data[0].dataPoints = Data[0];
		ageAllChart.options.data[0].dataPoints = Data[1];
		selAllChart.options.data[0].dataPoints = Data[2];
		sexSel1Chart.options.data[0].dataPoints = Data[3];
		ageSel1Chart.options.data[0].dataPoints = Data[4];
		sexSel2Chart.options.data[0].dataPoints = Data[5];
		ageSel2Chart.options.data[0].dataPoints = Data[6];
		
		sexAllChart.render();
		ageAllChart.render();
		selAllChart.render();
		sexSel1Chart.render();
		ageSel1Chart.render();
		sexSel2Chart.render();
		ageSel2Chart.render();
	}
	
	makeChart(initData);
	
	///////////////////////////////////////// ajax 처리 영역 //////////////////////////////////////////////
	//sexAllChart.options.data[0].dataPoints = sacData;
	var q_num = null;
	var s_num = null;
	
	function remakeChart(q_num, s_num){
		$.ajax({
			data:{ "q_num" : q_num,
				"s_num" : s_num },
			dataType:"json",
			type:"POST",
			url:"changeData.do",
			
			success:function(d){
				var reData =
				[
					[	// 전체 참여 성별
						{ y : d.dataForAll[0], label : "남자" },
						{ y : d.dataForAll[1], label : "여자" }
					],
					[	// 전체 참여 연령별
						{ y : d.dataForAll[2], label : "10대" },
						{ y : d.dataForAll[3], label : "20대" },
						{ y : d.dataForAll[4], label : "30대" },
						{ y : d.dataForAll[5], label : "40대" },
						{ y : d.dataForAll[6], label : "50대" },
						{ y : d.dataForAll[7], label : "60대" },
						{ y : d.dataForAll[8], label : "70대" }
					],
					[	// 전체 보기 선택수
						{ label : "보기1번선택수", y: d.dataForEachQ[0] },
						{ label : "보기2번선택수", y: d.dataForEachQ[1] }
					],
					[	// 보기 1번 성별
						{ y: d.dataForEachQ[2], label: "남자" },
						{ y: d.dataForEachQ[4], label: "여자" },
					],
					[	// 보기 1번 연령별
						{ x: 10, y: d.dataForEachQ[6] },
						{ x: 20, y: d.dataForEachQ[8] },
						{ x: 30, y: d.dataForEachQ[10] },
						{ x: 40, y: d.dataForEachQ[12] },
						{ x: 50, y: d.dataForEachQ[14] },
						{ x: 60, y: d.dataForEachQ[16] },
						{ x: 70, y: d.dataForEachQ[18] },
						
					],
					[	// 보기 2번 성별
						{ y: d.dataForEachQ[3], label: "남자" },
						{ y: d.dataForEachQ[5], label: "여자" },
					],
					[	// 보기 2번 연령별
						{ x: 10, y: d.dataForEachQ[7] },
						{ x: 20, y: d.dataForEachQ[9] },
						{ x: 30, y: d.dataForEachQ[11] },
						{ x: 40, y: d.dataForEachQ[13] },
						{ x: 50, y: d.dataForEachQ[15] },
						{ x: 60, y: d.dataForEachQ[17] },
						{ x: 70, y: d.dataForEachQ[19] },
						
					]
				];
				
				makeChart(reData);
			},
			error:function(){
				console.log("data ajax fail");
			}
		});
	}
	
	// 질문번호 눌렀을때 ajax
	$('.btn').on('click',function(){
		q_num = $(this).attr("id");
		s_num = $("#s_num").val();
		remakeChart(q_num,s_num);
	});
	// s_num 바뀌었을 때 ajax
	$('#s_num').on('change',function(){
		q_num = 1;
		s_num = $("#s_num").val();
		remakeChart(q_num,s_num);
	});

}// function
	
</script>