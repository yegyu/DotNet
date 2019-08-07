<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<br>
<br>
<div class="row">

<label>오지선다 번호</label>
<div class="col-md-4">
<select class="form-control" id="fsnum" >
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
<div id="fap">
<div id="fmwq1" style="height: 370px; width: 50%;"></div>
<div id="fmwq2" style="height: 370px; width: 50%;"></div>
<div id="fmwq3" style="height: 370px; width: 50%;"></div>
<div id="fmwq4" style="height: 370px; width: 50%;"></div>
<div id="fmwq5" style="height: 370px; width: 50%;"></div>

<div id="fageq1" style="height: 370px; width: 50%;"></div>
<div id="fageq2" style="height: 370px; width: 50%;"></div>
<div id="fageq3" style="height: 370px; width: 50%;"></div>
<div id="fageq4" style="height: 370px; width: 50%;"></div>
<div id="fageq5" style="height: 370px; width: 50%;"></div>

</div>


<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script>

var jfageArr = ${jfageArr}
var farrAge =[];
var fk = 0;
for(var i = 0 ; i < jfageArr.length; i+=jfageArr.length/7){
	farrAge[fk]  = jfageArr.slice(i,i+jfageArr.length/7);
	fk++;
}
var ar=[];
for(var i = 0 ; i < farrAge.length; i+=5){
    for(var j =0  ; j<7; j++){
        ar.push(farrAge[j].slice(i,i+5))
    }
}


var s_num = ${s_num}
var jfmwArr = ${jfmwArr};
var fqlen = ${qlen}
var jarr=[];
for(var i = 0 ; i < jfmwArr.length ; i+=5){
    jarr.push(jfmwArr.slice(i,i+5))
}
function makefChart(fqlen){

	console.log("makefChart 안에 있음")
	
	fmwq1 = new CanvasJS.Chart("fmwq1", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+"번 q1 설문 성별, 선택지  그래프"
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
			lineThickness: 5,
			type: "stackedColumn",
			name: "여",
			showInLegend: true,      
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[0]
		},
		{
			type: "stackedColumn",
			name: "남",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: 
				jarr[fqlen]
		}]
	});
	fmwq2 = new CanvasJS.Chart("fmwq2", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+"번 q2 설문 성별, 선택지  그래프"
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
			name: "여",
			showInLegend: true,      
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[1]
		},
		{
			type: "stackedColumn",
			name: "남",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[fqlen+1]
		}]
	});
	fmwq3 = new CanvasJS.Chart("fmwq3", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+"번 q3 설문 성별, 선택지  그래프"
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
			name: "여",
			showInLegend: true,      
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[2]
		},
		{
			type: "stackedColumn",
			name: "남",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[fqlen+2]
		}]
	});
	fmwq4 = new CanvasJS.Chart("fmwq4", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+"번 q4 설문 성별, 선택지  그래프"
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
			name: "여",
			showInLegend: true,      
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[3]
		},
		{
			type: "stackedColumn",
			name: "남",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[fqlen+3]
		}]
	});
	fmwq5 = new CanvasJS.Chart("fmwq5", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+"번 q5 설문 성별, 선택지  그래프"
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
			name: "여",
			showInLegend: true,      
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[4]
		},
		{
			type: "stackedColumn",
			name: "남",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: jarr[fqlen+4]
		}]
	});
	
	
	//d//////////////////age
	
	fageq1 = new CanvasJS.Chart("fageq1", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+" q1번 설문 나이, 선택지  그래프"
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
			dataPoints: ar[0]
		},
		{
			type: "stackedColumn",
			name: "20대",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[1]
		},
		{
			type: "stackedColumn",
			name: "30대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[2]
		},
		{
			type: "stackedColumn",
			name: "40대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[3]
		},
		{
			type: "stackedColumn",
			name: "50대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[4]
		},
		{
			type: "stackedColumn",
			name: "60대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[5]
		},
		{
			type: "stackedColumn",
			name: "70대-1",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[6]
		}]
	});
	fageq2 = new CanvasJS.Chart("fageq2", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+" q2번 설문 나이, 선택지  그래프"
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
			dataPoints: ar[7]
		},
		{
			type: "stackedColumn",
			name: "20대",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[7+1]
		},
		{
			type: "stackedColumn",
			name: "30대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[7+2]
		},
		{
			type: "stackedColumn",
			name: "40대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[7+3]
		},
		{
			type: "stackedColumn",
			name: "50대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[7+4]
		},
		{
			type: "stackedColumn",
			name: "60대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[7+5]
		},
		{
			type: "stackedColumn",
			name: "70대-1",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[7+6]
		}]
	});
	fageq3 = new CanvasJS.Chart("fageq3", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+" q3번 설문 나이, 선택지  그래프"
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
			dataPoints: ar[14]
		},
		{
			type: "stackedColumn",
			name: "20대",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[14+1]
		},
		{
			type: "stackedColumn",
			name: "30대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[14+2]
		},
		{
			type: "stackedColumn",
			name: "40대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[14+3]
		},
		{
			type: "stackedColumn",
			name: "50대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[14+4]
		},
		{
			type: "stackedColumn",
			name: "60대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[14+5]
		},
		{
			type: "stackedColumn",
			name: "70대-1",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[14+6]
		}]
	});
	fageq4 = new CanvasJS.Chart("fageq4", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+" q4번 설문 나이, 선택지  그래프"
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
			dataPoints: ar[21]
		},
		{
			type: "stackedColumn",
			name: "20대",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[21+1]
		},
		{
			type: "stackedColumn",
			name: "30대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[21+2]
		},
		{
			type: "stackedColumn",
			name: "40대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[21+3]
		},
		{
			type: "stackedColumn",
			name: "50대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[21+4]
		},
		{
			type: "stackedColumn",
			name: "60대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[21+5]
		},
		{
			type: "stackedColumn",
			name: "70대-1",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[21+6]
		}]
	});
	fageq5 = new CanvasJS.Chart("fageq5", {
		exportEnabled: true,
		animationEnabled: true,
		title:{
			text: s_num+" q5번 설문 나이, 선택지  그래프"
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
			dataPoints: ar[28]
		},
		{
			type: "stackedColumn",
			name: "20대",
			//axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[28+1]
		},
		{
			type: "stackedColumn",
			name: "30대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[28+2]
		},
		{
			type: "stackedColumn",
			name: "40대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[28+3]
		},
		{
			type: "stackedColumn",
			name: "50대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[28+4]
		},
		{
			type: "stackedColumn",
			name: "60대",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[28+5]
		},
		{
			type: "stackedColumn",
			name: "70대-1",
// 			axisYType: "secondary",
			showInLegend: true,
			yValueFormatString: "#,##0.# 명",
			dataPoints: ar[28+6]
		}]
	});
	switch(fqlen){
	case 1:
		fmwq1.render();
		fageq1.render();
		break;
	case 2:
		fmwq1.render();
		fmwq2.render();
		fageq1.render();
		fageq2.render();
		break;
	case 3:
		fmwq1.render();
		fmwq2.render();
		fmwq3.render();
		fageq1.render();
		fageq2.render();
		fageq3.render();
		break;
	case 4:
		fmwq1.render();
		fmwq2.render();
		fmwq3.render();
		fmwq4.render();
		fageq1.render();
		fageq2.render();
		fageq3.render();
		fageq4.render();
		break;
	case 5:
		fmwq1.render();
		fmwq2.render();
		fmwq3.render();
		fmwq4.render();
		fmwq5.render();
		fageq1.render();
		fageq2.render();
		fageq3.render();
		fageq4.render();
		fageq5.render();
		break;
	}
	function toggleDataSeries(e) {
		if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		} else {
			e.dataSeries.visible = true;
		}
		e.fmwq1.render();
		e.fmwq2.render();
		e.fmwq3.render();
		e.fmwq4.render();
		e.fmwq5.render();
		e.fageq1.render();
		e.fageq2.render();
		e.fageq3.render();
		e.fageq4.render();
		e.fageq4.render();
	}
}

$(document).ready(function(){
	
	makefChart(fqlen);
	
});
var data = null;

$(document).ready(function(){
	$('#fsnum').on('change',function(){
		data = $(this).val();
		console.log({data:data})
		$.ajax({
			data:{data:data},
			dataType:"json",
			type:"POST",
			url:"fmw.do",
			success:function(d){
				console.log("five s_num ajax success");
				$("#fap").children().remove();
				for(var i = 0 ; i < d.fqlen; i++){
					$("#fap").append('<div id="fmwq'+ (i+1) +'" style="height: 370px; width: 50%;"></div><br><br>');
				}
				for(var i = 0 ; i < d.fqlen; i++){
					$("#fap").append('<div id="fageq'+ (i+1) +'" style="height: 370px; width: 50%;"></div><br><br>');
				}
				
				jfageArr = JSON.parse(d.jfageArr);
				jfmwArr = JSON.parse( d.jfmwArr)
				 console.log("오지")
				 fqlen = d.fqlen;
				 s_num = d.s_num;
				 console.log("in five ajax s_num :"+ s_num)
				 
				 jarr=[];
				 for(var i = 0 ; i < jfmwArr.length ; i+=5){
				     jarr.push(jfmwArr.slice(i,i+5))
				 }
				 
				 farrAge =[];
				 fk = 0;
				 for(var i = 0 ; i < jfageArr.length; i+=jfageArr.length/7){
				 	farrAge[fk]  = jfageArr.slice(i,i+jfageArr.length/7);
				 	fk++;
				 }
				 ar=[];
				 for(var i = 0 ; i < farrAge[0].length; i+=5){
				     for(var j =0  ; j<7; j++){
				         ar.push(farrAge[j].slice(i,i+5))
				     }
				 }
				 console.log(ar);
				 if(fqlen){
					 makefChart(fqlen);
				 }else{
					 alert("makefChart 안됨")
				 }
				
			},
			error:function(){
				console.log("s_num five ajax fail");
			}
		});
	});
});
	

</script>















