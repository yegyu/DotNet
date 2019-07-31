<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		
		<link rel="stylesheet" href="bootstrap.css">
<!-- 		<link rel="stylesheet" -->
<!-- 			href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
		<link
			href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap"
			rel="stylesheet">
		<!-- style_dotnet.csa -->
		<link rel="stylesheet" type="text/css" href="style_dotnet.css" />
		<script type="text/javascript" src="jquery-3.4.1.js"></script>
			<script type="text/javascript" src="bootstrap.bundle.js"></script>
		
		<!-- css for this page -->
		<style>
		body{
		scroll:;
		 overflow: ;
		}
		 #emialWin{
		margin:10px;
		
		} 
		#mailCon{
		display:none;
		position:fixed;
		bottom:0px;
		right:0px;
		width:500px;
		}
		#frId, #title, #content{
			border-top:0px;
			border-left:0px;
			border-right:0px;
			border-top-color: transparent;
			border-left-color: transparent;
			border-right-color: transparent;
		
		}
		#mailHead{
			background-color: rgba(227, 179, 255, 0.938);
			width:100%;
			height: 25px;
		}
		/* sendMail */
		.sContent, .rContent{
			display: none;
		}
		.sTable:hover, .rTable:hover{
			cursor: pointer;
		}
		div.table{
			height:480px;
			overflow: auto;
		}
		 table > thead > tr > th:nth-child(1){
			width:8%;
		}
		 table > thead > tr > th:nth-child(2){
			width:8%;
		}
		 table > thead > tr > th:nth-child(3){
			width:20%;
		}
		 table > thead > tr > th:nth-child(5){
			width: 20%;
		}
		
	.nav-pills .nav-link.active, .nav-pills .show > .nav-link { 
	    color: #fff;
 		    background-color: rgba(227, 179, 255, 0.938); 
	} 
	/* 	.active{
			color: #fff;
		    background-color: rgba(227, 179, 255, 0.938);
		} */
		ul.nav-stacked {
			display:flex; 
			align-content:flex-start; 
			flex-direction:column; 
			flex-wrap:wrap; 
			overflow:auto;
		}
		
		</style>
	</head>

<body>

	<!-- 상단 바 -->

	<nav class="navbar navbar-expand-md navbar-default" style="margin-bottom:0px">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->


	<div class="container-fluid">
		<h4 >마이페이지</h4>
		<hr style="margin:10px">
		<div class="row">
			
			<div class="col-sm-9 col-md-10">
				
				
			</div>
		</div>
<!-- 		<hr style="margin:10px"> -->
		<div class="row">
			<!-- 왼쪽 사이드  -->
			<div class="col-sm-2 ">
			<div class="btn-group">
					<button type="button" class="btn btn-primary "
						id="writeEmail">쪽지
					</button>
					
				</div>
				<div class="btn-group">
					<button type="button" class="btn btn-default" data-toggle="tooltip"
						title="Refresh" onclick="history.go(0)">
						&nbsp;Trash&nbsp;
					</button>
				</div>
				<hr style="margin-top:10px">
				<ul class="nav nav-pills nav-stacked">
					<li c><a href="#mail" data-toggle="tab" id="sideMail"  class="nav-link active"><!-- onclick="sideMailClick()" -->
					<span class="badge pull-right"></span> 쪽지&emsp;&emsp;</a></li>
					
					<li><a href="#mem" data-toggle="tab" id="sideMem" class="nav-link">회원관리</a></li>
					<li><a href="#board" data-toggle="tab" id="sideBoard" class="nav-link">게시판관리</a></li>
					<li><a href="#data" data-toggle="tab" id="sideData" class="nav-link">데이터관리</a></li>
					<li><a href="#payment" data-toggle="tab" id="sidePay" class="nav-link">결제 관리</a></li>

				</ul>
			</div>
			<!--왼쪽 사이드 끝  -->
			<!--내용-->
			<div class="col-sm-9 col-md-10 ">
				<div class="tab-content">
					<!--  -->
					<div class="tab-pane fade in active show" id="mail">
						<ul class="nav nav-tabs">
							<li style="margin-right: 10px">
  							 <button type="button" class="btn btn-default btn-sm" 
  							 id="trash" >
          					<span class="glyphicon glyphicon-trash" ></span> Trash </button>
      					 	</li>
							<li><a data-toggle="tab" href="#send" id="tabSend" class="nav-link active ">보낸쪽지</a></li>
							<li><a data-toggle="tab" href="#receive" id="tabReceive" class="nav-link">받은쪽지</a></li>
						</ul>
					</div>

					<div class="tab-pane fade in" id="mem">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#memberManage" id="tabMem" class="nav-link active">회원관리</a></li>
						</ul>
					</div>
					<div class="tab-pane fade in" id="board">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#boardManage" id="tabBoard" class="nav-link active">게시판관리</a></li>
						</ul>
					</div>
					<div class="tab-pane fade in" id="data">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#data1" id="tabData1" class="nav-link active">회원 관련</a></li>
							<li><a data-toggle="tab" href="#data2" id="tabData2" class="nav-link ">양자택일</a></li>
							<li><a data-toggle="tab" href="#data3" id="tabData3" class="nav-link ">오지선다</a></li>
						</ul>
					</div>
					<div class="tab-pane fade in" id="payment">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#pointMng" id="tabPoint" class="nav-link active">상품 요청 처리</a></li>
							<li><a data-toggle="tab" href="#goodsMng" id="tabGoods" class="nav-link ">상품 관리</a></li>
							<li><a data-toggle="tab" href="#payMng" id="tabPay" class="nav-link ">결제 history</a></li>
						</ul>
					</div>
					
				</div>
				<div class="tab-content" id="realContent" >
					<!--쪽지  -->
					<div class="tab-pane fade in active show" id="send">
					<div class="table">
						<table class="table table-fixed">
							<jsp:include page="../sendMail.do"></jsp:include>
						</table>
					</div>
					</div>
					<div class="tab-pane fade in " id="receive">
					<div class="table">
							<table class="table table-fixed">
								<jsp:include page="../receiveMail.do"></jsp:include>
							</table>
							</div>
					</div>
					
					<!--회원관리  -->
					<div class="tab-pane fade in" id="memberManage">
						<jsp:include page="../memberMng.do"></jsp:include>
					</div>
					<!--게시판관리  -->
					<div class="tab-pane fade in" id="boardManage">
						<jsp:include page="../adminBoard.do"></jsp:include>
					</div>
					
					<!-- 데이터 관리 -->
					<div class="tab-pane fade in" id="data1">
						<jsp:include page="../memChart.do"></jsp:include>
					</div>
					<div class="tab-pane fade in" id="data2">
						<jsp:include page="../mwChart.do"></jsp:include>
					</div>
					<div class="tab-pane fade in" id="data3">
						<jsp:include page="../fiveChart.do"></jsp:include>
					</div>
<!-- 					<div class="tab-pane fade in" id="data4"> -->
<%-- 						<jsp:include page="../eightChart.do"></jsp:include> --%>
<!-- 					</div> -->
					
					<!-- 결제 관리 -->
					<div class="tab-pane fade in" id="pointMng">
						<jsp:include page="../adminPoMng.do"></jsp:include>
					</div>
					<div class="tab-pane fade in" id="goodsMng">
						<jsp:include page="../adminGoodsMng.do"></jsp:include>
					</div>
					<div class="tab-pane fade in" id="payMng">
						<jsp:include page="../adminPayHistory.do"></jsp:include>
					</div>
				</div>
			</div>

		</div>
	</div>
	
<div class="container" id="mailCon">
<!--     <div class="modal-dialog cascading-modal"> -->
        <div class="shadow bg-white">
            <!--Content-->
			<div id="mailHead">
			<button type="button" class="close" aria-label="Close">
			  <span aria-hidden="true">&times;</span>
			</button>
			</div>
            <form id="emailWin" action="sendMailPro.do" method="post">
                <div class="form-group">
                    <label for="frId">받을 사람 ID</label>
                    <input type="text" class="form-control" id="frId" name="frId" placeholder="">
                </div>
                <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" class="form-control" id="title" name="title" autocomplete=”off” placeholder="">
                </div>
                <div class="form-group">
                    <label for="content">글 내용</label>
                    <textarea class="form-control" id="content" name="content" rows="10"></textarea>
                </div>
                <div class="form-group right">
                    <input type="submit" class="btn btn-info" id="emailBtn" onclick="return checkMail();">
                    <input type="reset" class="btn btn-info" >
                </div>
            </form>
        </div>
<!--     </div> -->
</div>
<c:set var = "id" value="${sessionScope.memId }"/>


	<script >
		//두번째 탭들이 잘 이동하게끔 함
		//쪽지
		$("#sideMail").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#send").addClass('active show');
		});
		$("#tabSend").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#send").addClass('active show');
		});
		$("#tabReceive").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#receive").addClass('active show');
		});
		//회원 관리
		$("#sideMem").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#memberManage").addClass('active show');
		});
		$("#tabRecent").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#memberManage").addClass('active show');
		});
		//게시판 관리
		$("#sideBoard").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#boardManage").addClass('active show');
		});
		$("#tabBoard").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#boardManage").addClass('active show');
		});
		//데이터 관리
		$("#sideData").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#data1").addClass('active show');
		});
		$("#tabData1").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#data1").addClass('active show');
		});
		$("#tabData2").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#data2").addClass('active show');
		});
		$("#tabData3").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#data3").addClass('active show');
		});
		$("#tabData4").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#data4").addClass('active show');
		});
		
		//결제관리
		$("#sidePay").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#pointMng").addClass('active show');
		});
		$("#tabPoint").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#pointMng").addClass('active show');
		});
		$("#tabGoods").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#goodsMng").addClass('active show');
		});
		$("#tabPay").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#payMng").addClass('active show');
		});
		//개인정보
// 		$("#sideMyInfo").on("click",function(){
// 			$("#realContent").children().removeClass('active show');
// 			$("#myInfo").addClass('active show');
// 		});
// 		$("#tapMyInfo").on("click",function(){
// 			$("#realContent").children().removeClass('active show');
// 			$("#myInfo").addClass('active show');
// 		});
		
	</script>
	<script>
		$('#writeEmail, .close').on('click', function(){
			$('#mailCon').toggle("slow");
		})
		
		function checkMail(){
			if(!$("#frId").val() || !$("#content").val() || !$("#title").val()){
				alert("빠진 부분을 확인해 주세요")
				return false;
			}
			
		};
	</script>
	<!-- 	sendMial -->
	
	
<script>
//쪽지 삭제 Ajax에서 {'json':{'ddd':'ddd','fff':'fff',...}} 만드는 거
// var json ={s :[] , r:[]};
var json = new Object();
var	pJson = new Object();
var jsonStr;

// var len = $('.card-front').length;
// for(var i = 0 ; i < len ; i++){
//  	$('.card-front').eq(i).on('click',function(){
// 		$('.card-back').eq(i).toggle();
	
// 	});
// }
$(document).ready(function(){
	
	$('.sTable').click(function(){
		if(event.target.nodeName != 'INPUT'){
			var idx = $(this).index(); 
			$('.sContent').eq(idx/2).toggle(100);
		}
	});
	
	$('.rTable').click(function(){
		if(event.target.nodeName != 'INPUT'){
			
			var idx = $(this).index(); 
			$('.rContent').eq(idx/2).toggle(100);
		}
	});
	// for delete chckbox checked mail formmat to JSON 
	
	//친구 피드?? 효과
// 	if(!$('button').click()){
// 		$('.card-front').on('click',function(){
// 				$(this).next().next().next().children().toggle(100);
// 		});
		
		$('button').on('click', function(){
			    event.stopPropagation();
		});
// 	}
		
		
	
	
	//쪽지에서 체크박스 확인용??
	$('#topCheckS').on('click',function(){
		if($(this).is(':checked')){
			$('.sTable > th > input[type=checkbox]').prop('checked',true);
		}else{
			$('.sTable > th > input[type=checkbox]').prop('checked',false);
		}
	});
	$('#topCheckR').on('click',function(){
		if($(this).is(':checked')){
			$('.rTable > th > input[type=checkbox]').prop('checked',true);
		}else{
			$('.rTable > th > input[type=checkbox]').prop('checked',false);
		}
	});
	
});
    //check box 삭제 ajax
    $(document).ready(function () {
    	
//     	$('input[type=checkbox]').on('click',function(){
    		
    		
//     	});
    	
        $("button[id=trash]").on('click', function () {
            if ($('input[type=checkbox]').is(':checked')) {
                if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
// 					console.log("josn : " + json);
//                 	console.log("jsonStr : " + jsonStr)
					var selected = [];
		    		$('input:checked').each(function() {
		    		    selected.push($(this).attr('id'));
		    		});
		    		var Ob =[];
		    		$.each(selected, function(index,item){
		    		Ob.push(item.split('_'))   }  );  
		
		//     		var json = new Object();	
		
		    		for(var i = 0 ; i < Ob.length; i++){
		    		    json[Ob[i][0]]=Ob[i][1]
		    		}
		    		
		    		jsonStr = JSON.stringify(json);
                	var pJson = {"val" : jsonStr }
//                 	console.log(pJson)
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        data: pJson,
//                         contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
                        url: "deleteMail.do",
                        success: function (data) {
                            location.reload();
                        },
                        error: function (e) {
                            console.log("ajax 실패")
                        }
                    });//ajax 끝

                } else {   //취소
                    return false;
                }
            } else {
                alert('선택된 쪽지가 없습니다.');
                return false;
            }
        });

    });


</script>
</body>
</html>