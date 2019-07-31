<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<br>
<div class="container-fluid">
<br>
<div class="row">

<textarea class="form-control" maxlength="50" cols="70px" rows="2px" style="font-size: 20px;" id="commentArea" placeholder="댓글을 입력하세요~!~!~!"></textarea><br>
 <button class="commentbtn btn my-3" style="position:relative; right: 0px" id="inputComment">댓글 입력</button>
</div>
<table width="100%">
		<thead >
		<tr >
			<th width="20%" id="${s_num }">ID</th>
			<th  width="65%">내용</th>
			<th width="30%">날짜</th>		
		</tr>
		</thead>
		
		<tbody id="conBody">
		<c:forEach var="con" items="${getComm}">
		<tr>
			<td>${con.mem_id }</td>
			<td>${con.content }</td>
			<td><fmt:formatDate value="${con.dt}" pattern="yyyy-MM-dd"/>  </td>
		</tr>
		</c:forEach>
		</tbody>
</table>

</div>
<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript" src="bootstrap.bundle.js"></script>
<script>
var com ;
function getFormatDate(date){ var year = date.getFullYear();	//yyyy
var month = (1 + date.getMonth());	//M 
month = month >= 10 ? month : '0' + month;	//month 두자리로 저장 
var day = date.getDate();	//d 
day = day >= 10 ? day : '0' + day;	//day 두자리로 저장 
return year + '-' + month + '-' + day; }

var session = '${sessionScope.memId}';

$(document).ready(function(){
	$('#inputComment').on('click',function(){
		if(session == null || session == "") {
			$(".commentbtn").attr("disabled","true");
		}
		
	    com = {"content":$('#commentArea').val(), "s_num":${s_num}};
	    $.ajax({
	    	type:"POST",
	    	data:com,
	    	dataType:"json",
	    	url:"comm.do",
	    	success:function(com){
	    		console.log(com[0].mem_id + " 입니다.")
	    		$("#conBody").children().remove();
	    		for(var i =0 ; i < com.length; i++){
	    			$("#conBody").append("<tr><td>" + com[i].mem_id + "</td><td>"+com[i].content+"</td><td>"+getFormatDate(new Date(com[i].dt))+"</td></tr>")
	    			
	    		}
	    			
	    	},
	    	error:function(){
	    		console.log("comment insert error")
	    	}
	    	
	    });
	});
	
})

</script>