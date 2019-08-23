<%@page import="java.text.SimpleDateFormat"%>
<%@page import="admin.AdminMemberBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.AdminDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="setting_admin.jsp" %>

<script src="${project}script_admin.js"></script>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>게시물 관리</title>


<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do"/>
<div class="page-content">
<div class="container-fluid">
	<div class="card col-md-12">
		<h2 class="mt-3">내 최근 참여 설문</h2>
		<hr>
		<h5>내 설문관리 > 내 최근 참여 설문</h5>
		<hr>
		<!-- 사이드바  1-1 end -->
	<br>   
	<div> 
		<c:if test="${cnt == 0}">
			<tr>
				<td colspan="6" align="center">
					${msg_list}
				</td>
			</tr>
		</c:if>
		<c:if test="${cnt != 0}">
			<c:forEach var="adminCat" items="${categorys}"> 
				<button type="button" class="btn btn-dark rounded-circle" name="${adminCat.ct_name}">${adminCat.ct_num}#${adminCat.ct_name}</button>			
			</c:forEach>	
		</c:if>
		
	</div>
	<br>
	<div class="container" align="right">
	    <button class="col-md-2 btn btn-warning addBtn" data-toggle="modal" data-target="#myModal1">추가</button> 
	    <button class="col-md-2 btn btn-danger delBtn" data-toggle="modal" data-target="#myModal2">삭제</button>      
	</div>
	<div id="myModal1" class="modal fade">
	    <div class="modal-dialog modal-sm">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">카테고리 추가</h4>
	                <button class="myModal1Close" type="button" data-dismiss="modal"><i class="fas fa-times"></i></button>
	            </div>
		            <div class="modal-body">
		                <p>카테고리 번호를 입력하세요.</p>               
						<input autofocus class="input" type="text" name="category_num" maxlength="30">	
						<p>카테고리명을 입력하세요.</p> 
						<input autofocus class="input" type="text" name="category_name_add" maxlength="30">	 	       
	 		        </div>
		            <div class="modal-footer">              
		                               	
							<input type="hidden" name="pageNum" value="${pageNum}">			
		               		<input class="btn btn-danger active addCate" type="button" value="완료">
							<input class="btn btn-primary active" type="reset" value="취소">				 	
		            </div>
	        </div>
	    </div>
	</div>
	
	<div id="myModal2" class="modal fade">
	    <div class="modal-dialog modal-sm">
	        <div class="modal-content">
	            <div class="modal-header">
	                <h4 class="modal-title">카테고리 삭제</h4>
	                <button class="myModal2Close" type="button" data-dismiss="modal"><i class="fas fa-times"></i></button>
	            </div>
		            <div class="modal-body">
		                <p>카테고리명을 입력하세요.</p>      
		                       
						<input autofocus class="input" type="text" name="category_name_del" maxlength="30">		       
		            </div>
		            <div class="modal-footer">              
		                               	
							<input type="hidden" name="pageNum" value="${pageNum}">	
		               		<input class="btn btn-danger active delCate" type="button" value="완료">
							<input class="btn btn-primary active" type="reset" value="취소">				 	
		            </div>
	        </div>
	    </div>
	</div>
	<br><br>  


	<h4> ◈ 메인게시판 관리 </h4><br>
	
	<div class="container">
	  <table class="table table-hover text-center">
			
		<thead>
			<tr>
				<th> ${survey_num} </th>
				<th style="width : 30%"> ${survey_subject} </th>		
				<th> ${survey_writer} </th>
				<th> ${survey_category} </th>
				<th> ${survey_type} </th>
				<th> ${survey_control} </th>
			</tr>	
		</thead>
		
		<tbody class="tbody1">
			<c:if test="${mainCnt == 0}">
				<tr>
					<td colspan="6" align="center">
						${msg_list}
					</td>
				</tr>
			</c:if>
			<c:if test="${mainCnt != 0}">
			<c:set var="pageNum" value="${pageNum}"/>
				<c:forEach var="mainSur" items="${mainSurveys[pageNum]}" varStatus="i"> 	
					<tr class="${mainSur.s_num}">
						             
						
						<td align="center">
							${mainSur.s_num}
						</td>			
						
						<td align="center">
							${mainSur.subject}
						</td>
						<td align="center">
							${mainSur.writer}
						</td>
						<td align="center">
							${mainSur.ct_num}
						</td>
						<td align="center">
							${mainSur.s_tp_num}
						</td>
						
						<td>		        
								<button type="button" class="btn btn-danger active delBoard" name="${mainSur.b_tp_num}" value="${mainSur.s_num}">삭제</button>											
		   				</td>
					</tr>			
				</c:forEach>	
			</c:if>	
		</tbody>
		
	  </table>
	
	</div>

	<br>
	<div class="container" align="center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <c:forEach begin="${1}" end="${realSize}" varStatus="i">
	    	<li class="page-item"><button class="page-link paging">${i.current}</button></li>
	    </c:forEach>
	    <li class="page-item">
	      <a class="page-link" href="" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	</div>
	<br><br>




	<h4> ◈ 보조게시판 관리 </h4><br>
                
	 <div class="container">
	        <table class="table table-hover text-center">
			
		 <thead>
		 <tr>	
			<th> ${survey_num} </th>
			<th style="width : 30%"> ${survey_subject} </th>		
			<th> ${survey_writer} </th>
			<th> ${survey_category} </th>
			<th> ${survey_type} </th>
			<th> ${survey_control} </th>
		</tr>	
		 </thead>
		 <tbody class="tbody2">
		<c:if test="${subCnt == 0}">
			<tr>
				<td colspan="6" align="center">
					${msg_list}
				</td>
			</tr>
		</c:if>
		<c:if test="${subCnt != 0}">
			<c:set var="pageNum2" value="${pageNum}"/>
				<c:forEach var="subSur" items="${subSurveys[pageNum]}" varStatus="i"> 	
					<tr class="${subSur.s_num}">
						               
						
						<td align="center">
							${subSur.s_num}
						</td>			
						
						<td align="center">
							${subSur.subject}
						</td>
						<td align="center">
							${subSur.writer}
						</td>
						<td align="center">
							${subSur.ct_num}
						</td>
						<td align="center">
							${subSur.s_tp_num}
						</td>
						
						<td>		        
							<button type="button" class="btn btn-danger active delBoard" name="${subSur.b_tp_num}" value="${subSur.s_num}" >삭제</button>												
		   				</td>
					</tr>			
				</c:forEach>		
		</c:if>	
		</tbody>
	</table>
	</div>

	<br>
	<div class="container" align="center">
	<nav aria-label="Page navigation example">
	  <ul class="pagination">
	    <li class="page-item">
	      <a class="page-link" href="" aria-label="Previous">
	        <span aria-hidden="true">&laquo;</span>
	      </a>
	    </li>
	    <c:forEach begin="${1}" end="${realSize2}" varStatus="i">
	    	<li class="page-item"><button class="page-link paging2">${i.current}</button></li>
	    </c:forEach>
	    <li class="page-item">
	      <a class="page-link" href="" aria-label="Next">
	        <span aria-hidden="true">&raquo;</span>
	      </a>
	    </li>
	  </ul>
	</nav>
	</div>
	<br><br>
			<!-- 사이드바 2-2 start --> 
	</div>
</div>
</div>
<!-- 사이드바 2-2 end --> 
	
	<!-- script for thispage -->
 	<script type="text/javascript">
 		$(document).ready(
 			function(){
 				$(".delBoard").on(
 					"click",
 					function(){
 						$.ajax({
 							type : "POST",
 							dataType : "json",
 							data : {
 								s_num : $(this).attr("value"),
 								b_tp_num : $(this).attr("name")
 							},
 							url : "delBoard.do",
 							success : function(data) {
 								alert("삭제성공");
 								$("tr[class="+data.s_num+"]").remove();
 							},
 							error : function(e) {
 								alert(e + "error");
 							}
 						});
 					}
 				);
 				$(".addCate").on(
 					"click",
 					function(){
 						$.ajax({
 							type : "POST",
 							dataType : "json",
 							data : {
 								ct_num : $("input[name=category_num]").val(),
 								ct_name : $("input[name=category_name_add]").val()
 							},
 							url : "cateAdd.do",
 							success : function(data) {
 								$("#myModal1").removeClass("show").css("display","none");
 								var addresult = data.addresult;
 								var adminCat = data.adminCat;
 								if(addresult==1){
 									alert("카테고리를 추가하는데 성공했습니다.");
 								}
 								$(".cateContainer").append(
 									'<button type="button" class="btn btn-dark rounded-circle" name="'+adminCat.ct_name+'">'
 									+adminCat.ct_num+'#'+adminCat.ct_name+'</button>'
 								);
 							},
 							error : function(e) {
 								alert(e + "error");
 							}
 						});
 					}
 				);
 				$(".delCate").on(
 					"click",
 					function(){
 						$.ajax({
 							type : "POST",
 							dataType : "json",
 							data : {
 								ct_name : $("input[name=category_name_del]").val()
 							},
 							url : "cateDel.do",
 							success : function(data) {
 								$("#myModal2").removeClass("show").css("display","none");
 								var delresult = data.delresult;
 								if(delresult==1){
 									alert("카테고리를 삭제하는데 성공했습니다.");
 								}
 								$("button[name="+data.ct_name+"]").remove();
 							},
 							error : function(e) {
 								alert(e + "error");
 							}
 						});
 					}
 				);
 				$(".paging").on(
 					"click",
 					function(){
 						$.ajax({
 		                    type: "POST",
 		                    dataType: "json",
 		                    data: {
 		                    	page : $(this).text()
 		                    },
 		                    url: "paging.do",
 		                    success: function (data) {
 		                    	
 		                    	var pageNum = data.pageNum;
 		                    	var mainSurveys = data.mainSurveys;
 		                       	$(".tbody1").empty();
 		                       	reMainBoard(pageNum, mainSurveys);
 		                    },
 		                    error: function (e) {
 		                        alert(e + "error");
 		                    }
 		                });
 					}
 				);
 				$(".paging2").on(
 					"click",
 					function(){
 						$.ajax({
 		                    type: "POST",
 		                    dataType: "json",
 		                    data: {
 		                    	page2 : $(this).text()
 		                    },
 		                    url: "paging.do",
 		                    success: function (data) {
 		                    	
 		                    	var pageNum2 = data.pageNum2;
 		                    	var subSurveys = data.subSurveys;
 		                       	$(".tbody2").empty();
 		                       	resubBoard(pageNum2, subSurveys);
 		                    },
 		                    error: function (e) {
 		                        alert(e + "error");
 		                    }
 		                });
 					}
 				);
 				$(".addBtn").on(
 					"click",
 					function(){
 						$("#myModal1").addClass("show").css("display","block");
 					}
 				);
 				$(".myModal1Close").on(
 					"click",
 					function(){
 						$("#myModal1").removeClass("show").css("display","none");
 					}		
 				);
 				$(".delBtn").on(
 					"click",
 					function(){
 						$("#myModal2").addClass("show").css("display","block");
 					}
 				);
 				$(".myModal2Close").on(
 					"click",
 					function(){
 						$("#myModal2").removeClass("show").css("display","none");
 					}		
 				);
 			}
 		);
 		
 		function reMainBoard(pageNum, mainSurveys) {
 			for(var i=0; i < mainSurveys[pageNum-1].length; i++) {
				
				$(".tbody1").append(
				
					'<tr>' + 
						
						'<td align="center">' +
							mainSurveys[pageNum-1][i].s_num +
						'</td>' +	
						
						'<td align="center">' +
							mainSurveys[pageNum-1][i].subject +
						'</td>' +
						'<td align="center">' +
							mainSurveys[pageNum-1][i].writer +
						'</td>' +
						'<td align="center">' +
							mainSurveys[pageNum-1][i].ct_num +
						'</td>' +
						'<td align="center">' +
							mainSurveys[pageNum-1][i].s_tp_num +
						'</td>' +
						
						'<td>' +		        
					       '<form name="modifyform" method="post" action="adminBoardDelPro.do">' +					
								'<input type="hidden" name="pageNum" value="'+pageNum+'">' +
								'<input type="hidden" name="survey_num" value="'+mainSurveys[pageNum-1][i].s_num+'">' +				
								'<button type="submit" class="btn btn-danger active" name="board_type_num" value="3">삭제</button>' +											
						   '</form>' +						        	       	       
		   				'</td>' +
					'</tr>'
				
				);
			}
 		}
		function resubBoard(pageNum2, subSurveys) {
 			for(var i=0; i < subSurveys[pageNum2-1].length; i++) {
				
				$(".tbody2").append(
				
					'<tr>' +
						
						'<td align="center">' +
							subSurveys[pageNum2-1][i].s_num +
						'</td>' +	
						
						'<td align="center">' +
							subSurveys[pageNum2-1][i].subject +
						'</td>' +
						'<td align="center">' +
							subSurveys[pageNum2-1][i].writer +
						'</td>' +
						'<td align="center">' +
							subSurveys[pageNum2-1][i].ct_num +
						'</td>' +
						'<td align="center">' +
							subSurveys[pageNum2-1][i].s_tp_num +
						'</td>' +
						
						'<td>' +		        
					       '<form name="modifyform" method="post" action="adminBoardDelPro.do">' +					
								'<input type="hidden" name="pageNum" value="'+pageNum2+'">' +
								'<input type="hidden" name="survey_num" value="'+subSurveys[pageNum2-1][i].s_num+'">' +				
								'<button type="submit" class="btn btn-danger active" name="board_type_num" value="3">삭제</button>' +											
						   '</form>' +						        	       	       
		   				'</td>' +
					'</tr>'
				
				);
			}
		}
 	</script>



