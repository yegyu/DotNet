<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>





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
<div class="col-md-4">

</div>
<br>
<br>
</div>
<div id="ap">
<div id="mw2" style="height: 370px; width: 50%;"></div>
<div id="age" style="height: 370px; width: 50%;"></div>
</div>




<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
var jageArr=${jageArr}

var mw2;
var jmwArr;
var qlen;
var slen;
var wArr ;
var mArr ;
jmwArr = ${jmwArr}
qlen = ${qlen};
slen = ${slen};
s_num = ${s_num};
//남 여 -> 2
 wArr = jmwArr.slice(0,jmwArr.length/2);
 mArr = jmwArr.slice(jmwArr.length/2);

 //나이
var arrAge = [];
var k = 0;
for(var i = 0 ; i < jageArr.length; i+=jageArr.length/7){
	arrAge[k]  = jageArr.slice(i,i+jageArr.length/7);
	k++;
}
if( arrAge[0]== undefined ) {
// 	alert("처음 설문정보가 없을 때 그러나 설문 그래프에서 정보가 있는 것은 (select options) 볼 수 있음")
}
 
 console.log(arrAge)

 
 function makeChart(){
	////// 남-여
	var w1Arr = new Array();
	var w2Arr = new Array();
	var m1Arr = new Array();
	var m2Arr = new Array();
	
	for(var i = 0 ; i < wArr.length; i+=2){
		w1Arr.push(wArr[i]);
		w2Arr.push(wArr[i+1]);
		m1Arr.push(mArr[i]);
		m2Arr.push(mArr[i+1]);
	}
	
	////////////  10-70 대
	var arr10_1 = new Array();
	var arr10_2 = new Array();
	var arr20_1 = new Array();
	var arr20_2 = new Array();
	
	var arr30_1 = new Array();
	var arr30_2 = new Array();
	var arr40_1 = new Array();
	var arr40_2 = new Array();
	
	var arr50_1 = new Array();
	var arr50_2 = new Array();
	var arr60_1 = new Array();
	var arr60_2 = new Array();
	var arr70_1 = new Array();
	var arr70_2 = new Array();
	
	

	for(var i = 0 ; i < arrAge[0].length;i+=2){
		arr10_1.push(arrAge[0][i]);
		arr10_2.push(arrAge[0][i+1]);
		arr20_1.push(arrAge[1][i]);
		arr20_2.push(arrAge[1][i+1]);
		
		arr30_1.push(arrAge[2][i]);
		arr30_2.push(arrAge[2][i+1]);
		arr40_1.push(arrAge[3][i]);
		arr40_2.push(arrAge[3][i+1]);
		
		arr50_1.push(arrAge[4][i]);
		arr50_2.push(arrAge[4][i+1]);
		arr60_1.push(arrAge[5][i]);
		arr60_2.push(arrAge[5][i+1]);
		
		arr70_1.push(arrAge[6][i]);
		arr70_2.push(arrAge[6][i+1]);
	}	
	
	
	
	mw2 = new CanvasJS.Chart("mw2", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+"번 설문 성별, 선택지  그래프"
		},
		subtitles: [{
			text: "그래프에 마우스 올리면 쪼금 더 수치 보기 쉬움"
		}], 
		axisX: {
			title: "선택지"
		},
		axisY: {
			title: "선택수",
			titleFontColor: "#4F81BC",
			lineColor: "#4F81BC",
			labelFontColor: "#4F81BC",
			tickColor: "#4F81BC",
			
		},
		
		
		toolTip: {
			shared: true
		},
		legend: {
			cursor: "pointer",
			itemclick: toggleDataSeries
		},
		data: [{
			type: "stackedColumn",
			name: "남(1번 선택)",
			showInLegend: true,      
			yValueFormatString: "#,##0.# 명",
			dataPoints: m1Arr
		},
		{
			type: "stackedColumn",
			name: "여(1번 선택)",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: w1Arr
		},
		{
			type: "stackedColumn",
			name: "남(2번 선택)",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: m2Arr
		},
		{
			type: "stackedColumn",
			name: "여(2번  선택)",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: w2Arr
		}]
	});
	mw2.render();

		function toggleDataSeries(e) {
			if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
				e.dataSeries.visible = false;
			} else {
				e.dataSeries.visible = true;
			}
			e.mw2.render();
	}
		age = new CanvasJS.Chart("age", {
			exportEnabled: true,
			animationEnabled: true,
			title:{
				text: s_num+"번 설문 나이, 선택지  그래프"
			},
			subtitles: [{
				text: "그래프에 마우스 올리면 쪼금 더 수치 보기 쉬움"
			}], 
			axisX: {
				title: "선택지"
			},
			axisY: {
				title: "선택수",
				titleFontColor: "#4F81BC",
				lineColor: "#4F81BC",
				labelFontColor: "#4F81BC",
				tickColor: "#4F81BC",
			},
			toolTip: {
				shared: true
			},
			legend: {
				cursor: "pointer",
				itemclick: toggleDataSeries
			},
			data: [{
				type: "stackedColumn",
				name: "10대",
				showInLegend: true,      
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr10_1
			},
			{
				type: "stackedColumn",
				name: "20대",
				//axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr20_1
			},
			{
				type: "stackedColumn",
				name: "30대",
//	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr30_1
			},
			{
				type: "stackedColumn",
				name: "40대",
//	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr40_1
			},
			{
				type: "stackedColumn",
				name: "50대",
//	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr50_1
			},
			{
				type: "stackedColumn",
				name: "60대",
//	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr60_1
			},
			{
				type: "stackedColumn",
				name: "70대-1",
//	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr70_1
			},
			{
				type: "stackedColumn",
				name: "10대-2",
				axisYType: "secondary",
				showInLegend: true,      
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr10_2
			},
			{
				type: "stackedColumn",
				name: "20대",
				axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr20_2
			},
			{
				type: "stackedColumn",
				name: "30대",
	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr30_2
			},
			{
				type: "stackedColumn",
				name: "40대",
	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr40_2
			},
			{
				type: "stackedColumn",
				name: "50대",
	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr50_2
			},
			{
				type: "stackedColumn",
				name: "60대",
	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr60_2
			},
			{
				type: "stackedColumn",
				name: "70대",
	 			axisYType: "secondary",
				showInLegend: true,
				yValueFormatString: "#,##0.# 명",
				dataPoints: arr70_2
			}
			]
		});
		age.render();

			function toggleDataSeries(e) {
				if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
					e.dataSeries.visible = false;
				} else {
					e.dataSeries.visible = true;
				}
				e.age.render();
		}
	
}
$(document).ready(function(){
	
	makeChart();
	
});

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
});
	


	


</script>