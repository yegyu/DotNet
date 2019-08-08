<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>마이페이지</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	<link rel="stylesheet" href="bootstrap.css">
<!-- 	<link rel="stylesheet" -->
<!-- 		href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css"> -->
	<link
		href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap"
		rel="stylesheet">
	<!-- style_dotnet.csa -->
	<link rel="stylesheet" type="text/css" href="style_dotnet.css" />
	<script type="text/javascript" src="jquery-3.4.1.js"></script>
		<script type="text/javascript" src="bootstrap.bundle.js"></script>
	<style>
	body{
	scroll:;
	 overflow: hidden
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
		height: 35rem;
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
	
	a.brand:hover{
	  background-color: #2FD6FF;
	  color: white;
	}
	.nav-pills .nav-link.active, .nav-pills .show > .nav-link {
	    color: #fff;
	    background-color: rgba(227, 179, 255, 0.938);
	}
	ul.nav-stacked {
		display:flex; 
		align-content:flex-start; 
		flex-direction:column; 
		flex-wrap:wrap; 
		overflow:auto;
	}
	.transition {
	-webkit-transform: scale(1.2);
	-moz-transform: scale(1.2);
	-o-transform: scale(1.2);
	transform: scale(1.2);
	}
	
	body {
	  margin: 0;
	  font-family: "Lato", sans-serif;
	}
	
	.sidebar {
	  margin: 0;
	  padding: 0;
	  width: 280px;
	  background-color: #2FD6FF;
	  position: fixed;
	  height: 100%;
	  overflow: auto;
	  text-align: center;
	  font-size: 25px;
	}
	
	.sidebar a {
	  display: block;
	  color: black;
	  padding: 16px;
	  text-decoration: none;
	}
	 
	.sidebar a.nav-link:hover {
	  background-color: #555;
	  color: white;
	}
	
	.sidebar a.nav-link:hover:not(.active) {
	  background-color: #555;
	  color: white;
	}
	
	div.content {
	  margin-left: 200px;
	  padding: 1px 16px;
	  height: 1000px;
	}
	
	@media screen and (max-width: 700px) {
	  .sidebar {
	    width: 100%;
	    height: auto;
	    position: relative;
	  }
	  .sidebar a {float: left;}
	  div.content {margin-left: 0;}
	}
	
	@media screen and (max-width: 400px) {
	  .sidebar a {
	    text-align: center;
	    float: none;
	  }
	}
	</style>
</head>

<body>

	
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-9 col-md-10">
				<!-- 뭐하는데지? -->
			</div>
		</div>
		
		<div class="row">
			<!-- 왼쪽 사이드  -->
			<div class="col-sm-2 ">

				<div class="sidebar">
					<a class="brand" href="main.do"><h1 id="logo">.Net</h1> </a>
					<a href="#lib" data-toggle="tab" id="sideLib" class="nav-link">최근 기록</a>
					<a href="#myTest" data-toggle="tab" id="sideWr" class="nav-link">내가 작성한 테스트</a>
					<a href="#po" data-toggle="tab" id="sidePo" class="nav-link">포인트 내역</a>
					<a href="#manageFr" data-toggle="tab" id="sideFr" class="nav-link">친구 관리</a>
					<a href="#mod" data-toggle="tab" id="sideMy" class="nav-link">개인 정보 수정</a>
					<a href="#feed" data-toggle="tab" id="sideFeed" class="nav-link">피드관리</a>
				</div>
				
			</div>
			<!--왼쪽 사이드 끝  -->
			<!--내용-->
			<div class="col-sm-9 col-md-10 ">
				<div class="tab-content">
					<div class="tab-pane fade in active show" id="mail">
						<ul class="nav nav-tabs" >
							<li style="margin-right: 10px;">
								<div class="btn-group">
									<button type="button" class="btn btn-primary" id="writeEmail">쪽지쓰기</button>
									<button type="button" class="btn btn-default btn-sm" id="trash">Trash</button>
								</div>
							</li>
							<li><a data-toggle="tab" href="#send" id="tabSend" class="nav-link active">보낸쪽지</a></li>
							<li><a data-toggle="tab" href="#receive" id="tabReceive" class="nav-link">받은쪽지</a></li>
						</ul>
					</div>

					<div class="tab-pane fade in" id="lib">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#recent" id="tabRecent" class="nav-link active">최근</a></li>
							
						</ul>
					</div>
					<div class="tab-pane fade in" id="myTest">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#mytest" id="tabMytest" class="nav-link active">작성글</a></li>
							
						</ul>
					</div>
				
					<div class="tab-pane fade in" id="po">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#recPo" id="tabRecPo" class="nav-link active">포인트 내역</a></li>
							<li><a data-toggle="tab" href="#goods" id="tabGoods" class="nav-link">포인트 이용</a></li>
						</ul>
					</div>
					
					<div class="tab-pane fade in" id="manageFr">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#myFr" id="tabMyFr" class="nav-link active">내 친구</a></li>
							<li><a data-toggle="tab" href="#recomFr" id="tabRecomFr" class="nav-link">추천 친구</a></li>
						</ul>
					</div>
					
					<div class="tab-pane fade in" id="mod">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#myMod" id="tabMod" class="nav-link active">개인 정보 수정</a></li>
						</ul>
					</div>
					
					<div class="tab-pane fade in" id="feed">
						<ul class="nav nav-tabs">
							<li><a data-toggle="tab" href="#myFeed" id="tabMyFeed" class="nav-link active">내 피드 보기</a></li>
						</ul>
					</div>
						
					
				</div>
				<div class="tab-content" id="realContent" >
					<!--쪽지  -->
					
					<div class="tab-pane fade in active show" id="send">
					<div class="card w-75">
						<table class="table table-fixed">
							<jsp:include page="../sendMail.do"></jsp:include>
						</table>
					</div>
					</div>
					
					<div class="tab-pane fade in " id="receive">
					<div class="card w-75">
						<table class="table table-fixed">
							<jsp:include page="../receiveMail.do"></jsp:include>
						</table>
					</div>
					</div>
					
					<div class="tab-pane fade in" id="recent">
					<div class="card w-75">
						<table class="table table-fixed">
							<jsp:include page="../lib.do"></jsp:include>
						</table>
					</div>
					</div>
					
					<div class="tab-pane fade in" id="mytest">
					<div class="card w-75">
						<table class="table table-fixed">
							<jsp:include page="../mytest.do"></jsp:include>
						</table>
					</div>
					</div>
					
					
					<div class="tab-pane fade in" id="recPo">
						<div class="table">
							<jsp:include page="../recPo.do"></jsp:include>
						</div>
					</div>
					<div class="tab-pane fade in" id="goods">
						<jsp:include page="../goods.do"></jsp:include>
					</div>
					<div class="tab-pane fade in" id="myFr">
					<div class="table" style="height:560px">
						<jsp:include page="../myFr.do"></jsp:include>
					</div>
					</div>
					<div class="tab-pane fade in" id="recomFr">
					<div class="table">
<!-- 					<table class="table table-fixed"> -->
						<jsp:include page="../recomFr.do"></jsp:include>
<!-- 					</table> -->
					</div>
					</div>
					<div class="tab-pane fade in" id="myMod">
					<div class="table">
						<jsp:include page="../modifyUser.do"></jsp:include>
					</div>
					</div>
					<div class="tab-pane fade in" id="myFeed">
					<div class="table">
						<jsp:include page="../myFeed.do"></jsp:include>
					</div>
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
                    <input type="text" class="form-control" id="title" name="title" autocomplete='off' placeholder="">
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
<c:set var = "id" value="${sessionScope.memId}"/>


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
		
		//최근
		$("#sideLib").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recent").addClass('active show');
		});
		$("#tabRecent").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recent").addClass('active show');
		});
		$("#tabLike").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#like").addClass('active show');
		});
		
		//mytest
		$("#sideWr").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#mytest").addClass('active show');
		});
		$("#tabMytest").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#mytest").addClass('active show');
		});
		
		//친구
		$("#sideFr").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myFr").addClass('active show');
		});
		$("#tabMyFr").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myFr").addClass('active show');
		});
		$("#tabRecomFr").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recomFr").addClass('active show');
		});
		
		//point
		$("#sidePo").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recPo").addClass('active show');
		});
		$("#tabRecPo").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#recPo").addClass('active show');
		});
		$("#tabGoods").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#goods").addClass('active show');
		});
		
		// 개인 정보 수정
		$("#sideMy").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myMod").addClass('active show');
		});
		$("#tabMod").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myMod").addClass('active show');
		});
		
		// feed
		$("#sideFeed").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myFeed").addClass('active show');
		});
		$("#tabMyFeed").on("click",function(){
			$("#realContent").children().removeClass('active show');
			$("#myFeed").addClass('active show');
		});
		
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

var json = new Object();
var	pJson = new Object();
var jsonStr;


(function () {

		  $("a > img").hover(function () {

		    $(this).addClass('transition');
		  }, function () {

		    $(this).removeClass('transition');
		  });
		})();
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

		$('button').on('click', function(){
			    event.stopPropagation();
		});

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


    $(document).ready(function () {
        $("button[id=trash]").on('click', function () {
            if ($('input[type=checkbox]').is(':checked')) {
                if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
					
					var selected = [];
		    		$('input:checked').each(function() {
		    		    selected.push($(this).attr('id'));
		    		});
		    		var Ob =[];
		    		$.each(selected, function(index,item){
		    		Ob.push(item.split('_'))   }  );  
					
		
		    		for(var i = 0 ; i < Ob.length; i++){
		    		    json[Ob[i][0]]=Ob[i][1]
		    		}
		    		
		    		jsonStr = JSON.stringify(json);
                	var pJson = {"val" : jsonStr }
                    $.ajax({
                        type: "POST",
                        dataType: "json",
                        data: pJson,
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