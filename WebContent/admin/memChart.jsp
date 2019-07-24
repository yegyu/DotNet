<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div class="container-fluid">
<br>
<br>
<div id="signup_date" style="height: 370px; width: 50%;"></div>
<br>
<br>
<div id="mw" style="height: 370px; width: 50%;"></div>
<br>
<br>
<div id="loc" style="height: 370px; width: 50%;"></div>
<br><br>
</div>
<!-- <div id="chartContainer3" style="height: 370px; width: 100%;"></div> -->
<%-- <c:set var="data" value="${data }" /> --%>
<%-- <c:set var="s_num" value="${s_num }" /> --%>
<%-- <c:set var="qlen" value="${qlen }" /> --%>
<%-- <c:set var="mwArr" value="${mwArr }" /> --%>
<%-- ${data} --%>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>

//회원 증가량
	var d = ${memInfo};
	for(var i = 0 ; i < d.length; i++){
	    d[i].x = new Date(d[i].x)
	}
	
	// 남여 회원 증가량
	var m = ${mInfo};
	var w = ${wInfo};
	for(var i = 0 ; i < m.length; i++){
	    m[i].x = new Date(m[i].x)
	}
	for(var i = 0 ; i < w.length; i++){
	    w[i].x = new Date(w[i].x)
	} 
	
	var l = ${jlArr};
	console.log(l);
	/* d는  json array */
$(document).ready( function () {
// 	console.log(d);
	var mem = new CanvasJS.Chart("signup_date", {
		animationEnabled: true,
		theme: "light2",
		title:{
			text: "회원 증가량"
		},
		axisX:{
			valueFormatString: "DD MMM",
			crosshair: {
				enabled: true,
				snapToDataPoint: true
			}
		},
		axisY: {
			title: "회원가입 수",
			crosshair: {
				enabled: true
			}
		},
		toolTip:{
			shared:true
		},  
		legend:{
			cursor:"pointer",
			verticalAlign: "bottom",
			horizontalAlign: "left",
			dockInsidePlotArea: true,
			itemclick: toogleDataSeries
		},
		data: [{
			type: "line",
			showInLegend: true,
			name: "회원 가입수",
			markerType: "square",
			xValueFormatString: "DD MMM, YYYY",
			color: "#F08080",
			dataPoints: d
		}]
		
	});
	var mw = new CanvasJS.Chart("mw", {
		animationEnabled: true,
		theme: "light1",
		title:{
			text: "남,여 회원 증가량"
		},
		axisX:{
			valueFormatString: "DD MMM",
			crosshair: {
				enabled: true,
				snapToDataPoint: true
			}
		},
		axisY: {
			title: "회원가입 수",
			crosshair: {
				enabled: true
			}
		},
		toolTip:{
			shared:true
		},  
		legend:{
			cursor:"pointer",
			verticalAlign: "bottom",
			horizontalAlign: "left",
			dockInsidePlotArea: true,
			itemclick: toogleDataSeries
		},
		data: [{
			type: "line",
			showInLegend: true,
			name: "남자 회원가입",
			markerType: "square",
			xValueFormatString: "DD MMM, YYYY",
			color: "#F08080",
			dataPoints: m
		},
		{
			type: "line",
			showInLegend: true,
			name: "여자 회원가입",
			lineDashType: "dash",
			xValueFormatString: "DD MMM, YYYY",
			color: "#F08080",
			dataPoints: w
			
		}]
		
	});

	var loc = new CanvasJS.Chart("loc", {
		animationEnabled: true,
		title:{
			text: "회원 지역 정보",
			horizontalAlign: "left"
		},
		data: [{
			type: "doughnut",
			startAngle: 60,
			innerRadius: 60,
			indexLabelFontSize: 17,
			indexLabel: "{label} - #percent%",
			toolTipContent: "<b>{label}:</b> {y} (#percent%)",
			dataPoints: l
		}]
	});
	
	loc.render();
	mw.render();
	mem.render();
	function toogleDataSeries(e){
		if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		} else{
			e.dataSeries.visible = true;
		}
		mem.render();
	}
	function toogleDataSeries(e){
		if (typeof(e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
			e.dataSeries.visible = false;
		} else{
			e.dataSeries.visible = true;
		}
		mw.render();
	}
	
});
	
</script>

