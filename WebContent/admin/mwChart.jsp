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
<div id="sexAll" style="height: 370px; width: 50%;"></div>
<div id="ageAll" style="height: 370px; width: 50%;"></div>



<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
<script>
	window.onload = function() {
	
	var sexAllchart = new CanvasJS.Chart("sexAll", {
		theme: "light2", // "light1", "light2", "dark1", "dark2"
		exportEnabled: true,
		animationEnabled: true,
		title: {
			text: "Desktop Browser Market Share in 2016"
		},
		data: [{
			type: "pie",
			startAngle: 25,
			toolTipContent: "<b>{label}</b>: {y}%",
			showInLegend: "true",
			legendText: "{label}",
			indexLabelFontSize: 16,
			indexLabel: "{label} - {y}%",
			dataPoints: [
				{ y: 51.08, label: "Chrome" },
				{ y: 27.34, label: "Internet Explorer" },
				{ y: 10.62, label: "Firefox" },
				{ y: 5.02, label: "Microsoft Edge" },
				{ y: 4.07, label: "Safari" },
				{ y: 1.22, label: "Opera" },
				{ y: 0.44, label: "Others" }
			]
		}]
	});
	sexAllchart.render();
	
	}
	
	window.onload = function () {

	var ageAllchart = new CanvasJS.Chart("ageAll", {
		animationEnabled: true,
		exportEnabled: true,
		theme: "light1", // "light1", "light2", "dark1", "dark2"
		title:{
			text: "Simple Column Chart with Index Labels"
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
				{ x: 50, y: 92, indexLabel: "Highest" },
				{ x: 60, y: 68 },
				{ x: 70, y: 38 },
				{ x: 80, y: 71 },
				{ x: 90, y: 54 },
				{ x: 100, y: 60 },
				{ x: 110, y: 36 },
				{ x: 120, y: 49 },
				{ x: 130, y: 21, indexLabel: "Lowest" }
			]
		}]
	});
	ageAllchart.render();

	}
</script>
