<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>설문결과</title>
		<%@ include file="setting_survey.jsp" %>
	
		<!-- bootstrap css -->		
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		
		<!-- kakao -->
		<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
		<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
		<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		
		<!-- setting file -->
		<%@ include file="setting_survey.jsp" %>
		
		<!-- css for this page -->
		<style type="text/css">
			.accordion{
				margin : auto;
			}
			
		</style>
	</head>
	
	
	<body onscroll="SetDivPosition()"> 
	<!-- 상단 바 -->
	
	<nav class="navbar navbar-expand-md navbar-default">
		<jsp:include page="../mainNav.do" flush="false"></jsp:include>
	</nav>
	<!-- 상단 바  끝-->
		<!-- Modal -->
		<div class="modal fade" id="Mymodal" tabindex="-1" role="dialog" aria-labelledby="modalTitle" aria-hidden="true">
		  <div class="modal-dialog modal-dialog-centered modal-lg" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h2 class="modal-title" id="modalTitle">설문 결과</h2>
		      </div>
		      <div class="modal-body">
		        
		        <!-- colapse -->
				<div class="accordion w-100" id="twoResult">
					<c:set var="c" value="${0}"/>
					<c:forEach items="${choiceList}" varStatus="i">
					  <div class="card">
					    <div class="card-header" id="Q${i.count}">
					      <h2 class="my-3">
					        <button class="btn btn-link btn-block" type="button" data-toggle="collapse" 
					        	data-target="#Q${i.count}Sel" aria-expanded="false" aria-controls="Q${i.count}Sel">
					          	<h4>${resultList[c]}</h4>
					        </button>
					      </h2>
					    </div>
					    <div id="Q${i.count}Sel" class="collapse" aria-labelledby="Q${i.count}" data-parent="#twoResult">
					      <div class="card-body justify-content-center">
								<img src="/DotNet/save/${resultList[c+1]}" alt=".." style="width:100%; height:100%">
					      </div>
					    </div>
					  </div>
					  <c:set var="c" value="${c+2}"/>
					  <c:set var="size" value="${i.count}"/>
					</c:forEach>
				</div>
				<br>
		      	참여자 : ${info.id}
		      	<c:if test="${sessionScope.memId ne null}">
					<br> point : ${info.point}포인트를 획득하셨습니다. <br>
				</c:if>
		      </div>
		      <div class="modal-footer">
		     	<div class="row w-100">
			     	<div class="col-auto mr-auto">
				     	<a id="kakao-link-btn" href="javascript:;">
							<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png"/>
						</a>
					</div>
					<div class="col-auto pt-4 pr-5">
				        	<button type="button" class="btn btn-primary" name="toMain">메인으로</button>
				    </div>
				     <div class="table">
				    	<jsp:include page="../comment.do"></jsp:include>
				    </div>
			    </div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<!-- bootstrap js -->
		<!-- jQuery first, then Popper.js, then Bootstrap JS -->
		<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		 --><script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	
		<script type="text/javascript">
		//<!--
			$(document).ready(
				function(){
					
					$("#Mymodal").removeClass("fade").modal({"show":true,"backdrop":true});
					$("button[name=toMain]").on(
						"click",
						function(){
							location.href = "main.do";
						}
					);
				}		
			);
		//-->
		</script>
		<!-- script for 카카오공유 -->
		<script type='text/javascript'>
		  var session = '${sessionScope.memId}';
		  var isMem = 0;
		  if(session != null && session != "") {isMem = 1;}
		  var addurl = '?s_num=${info.s_num}&friend=${info.id}&isMem='+isMem+'&size='+${size};
		  //<![CDATA[
		    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
		    Kakao.init('d5a76805780067f68437d5126b6a0cca');
		    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
		    
		    Kakao.Link.createCustomButton({
		      container: '#kakao-link-btn',
		      templateId: 17239,
		      templateArgs: {
		        'url' : 'DotNet/uploadMatch.do' + addurl
		      }
		    });
		    
		  //]]>
		</script>
		<script language="javascript" for="plan6" event="onload">

//plan6이라는 frame이 onload될때 스크립트를 실행.

 var strCook = document.cookie;//저장된 쿠키 값을 받아온다.
 if(strCook.indexOf("!~")!=0) {
  var intS = strCook.indexOf("!~");
  var intE = strCook.indexOf("~!");
  var strPos = strCook.substring(intS+2, intE);//스크롤 위치를 구한다.
  document.body.scrollTop = strPos;//스크롤 위치를 적용시킨다.
  }
 document.plan6.resizeFrame(this);
</script>
  <script type = "text/javascript">

 function SetDivPosition()
 {
  var intY = document.body.scrollTop;
  document.cookie = "yPos=!~"+intY+"~!";
 }
 </script>
 
	</body>
</html>