<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!--  Bootstrap  -->
	<link rel="stylesheet" href="bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script type="text/javascript" src="bootstrap.bundle.js"></script>
	
	<!--MDL CDN  -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
	
	<!-- JQuery -->
	<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	  crossorigin="anonymous"></script>
<title> 기업회원 질의/응답 </title>
	<style>
	th{
	background:#EAEAEA;
	width:20%;
	font-size:20px;
	}
	
	p{
	font-size:16px;
	}
	
	th#name{
	width:15%;
	font-size:20px;
	}
	td#email{
	width:70%;
	}
	input[type=text]{
	text-align:center;
	}
	select{
	width:200px;
	height:40px;
	}
	#title,#titleLabel{
	width:600px;
	}
	.btn{
	width:300px;
	height:50px;
	font-size:20px;
	}
	</style>
</head>

<body>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

<form class="container" name="compAsk" action="askCompPro.do">
<input type="hidden" value="0" name="co_code">
<input type="hidden" value="0" name="co_read">
<div class="card">
<table class="table table-hover text-center">
	<input type='hidden' id='co_code'>
	<input type='hidden' id='co_read'>
	<th colspan=4 class="text-center">
	<center><h3>기업이용자 사용문의 접수</h3></center>
	</th>
	<tr>
		<th id="co_name">
			<p class="mt-4">기업명</p>
		</th>
		<td>
		  <div class="mdl-textfield mdl-js-textfield">
		    <input class="mdl-textfield__input mb-2" type="text" id="compName" name="co_name" required>
		    <label class="mdl-textfield__label mb-2 text-center" for="compName">업체명</label>
  		</div>
		</td>
		<th id="a_name">
			<p class="mt-4">문의자 성명</p>
		</th>
		<td>
			<div class="mdl-textfield mdl-js-textfield">
		    <input class="mdl-textfield__input mb-2" type="text" id="ask_name" name="a_name" required>
		    <label class="mdl-textfield__label mb-2 text-center" >문의자 성명</label>
  		</div>
		</td>
	</tr>
	<tr>
		<th id="email">
			<p class="mt-4">이메일	
		</th>
		
		<td colspan="3" id="email">
		<div class="float-left">
			<div id=email class="mt-2 md-2">
				  <div class="mdl-textfield mdl-js-textfield md-2">
				    <input class="mdl-textfield__input mb-2" type="text" name="email1" id = "email1" required>
				    <label class="mdl-textfield__label mb-2 text-center">E-mail</label>
		  		</div>
		  		
		  		@
		  		
		  		<div class="mdl-textfield mdl-js-textfield md-2">
				    <input class="mdl-textfield__input mb-2" type="text" name="email2"   placeholder="직접입력" value="" id="email2">
				    <label class="mdl-textfield__label mb-2 text-center"></label>
		  		</div>
	  		</div>
  		</div>
  		
  		
  		<div class="select float-right" id="select">
  		    <select class="selectpicker w-75 mt-4" name="email2" id="picker">
				<option value="self">직접입력</option>
				<option value="google.com">구글(Gmail)</option>
				<option value="naver.com">네이버(NAVER)</option>
				<option value="daum.net">다음(DAUM)</option>
				<option value="nate.com">네이트(NATE)</option>
				<option value="hotmail.com">핫메일(HOTMAIL)</option>
			</select>
  		</div>
		</td>
	</tr>
	<tr>
		<th colspan=4>
		문의 제목
		</th>
	</tr>
	<tr>
		<td colspan=3>
		  <div class="mdl-textfield mdl-js-textfield float-center">
		    <input class="mdl-textfield__input mb-2" type="text" id="title" name="co_title" required>
		    <label class="mdl-textfield__label mb-2" for="title" id="titleLabel">제목을 입력해주세요</label>
  		</div>		
		</td>
		<td colspan=1>
		<select name="co_type" class="selectpicker mt-4">
			<option value="마케팅 관련">마케팅 정보 수집</option>
			<option value="광고">베너 광고</option>
			<option value="설문 의뢰">설문 제작</option>
			<option value="단순 사용">사용문의</option>
			<option value="etc">기타</option>
		</select>
		</td>		
	</tr>
	<tr>
	<th colspan="4">
          <div class="form group">
              <label for="comment">
                  문의하기
              </label>
              <textarea name="co_content" id="comment" cols="30" rows="15" class="form-control" placeholder="문의내용을 입력해주세요" required></textarea>
          </div>
          <!--div.form-group-->
          <div class="form-group custom-control custom-checkbox mt-3">
              <input type="checkbox" class="custom-control-input" id="confirm" required>
              <label for="confirm" class="custom-control-label">
                  개인정보 수집 및 이용에 동의합니다.
              </label>
          </div>
          </th>
	</tr>
	<tr>
		<th colspan=4>
			<div id="buttons" class="mb-4">
				<button type="submit" class="btn btn-success" id="submit"> 작성 완료 </button>
				<button type="reset" class="btn btn-danger" id="cancel"onclick="history.back()"> 작성 취소 </button>
			</div>
		</th>
		
	</tr>
</table>
</div>

</form>
<script type="text/javascript" src="jquery-3.4.1.js"></script>
	<script type="text/javascript" src="bootstrap.bundle.js"></script>

<script>

$("select").on('click',function(){
	var state = $('#picker option:selected').val();
	if (state == 'self'){
		$('#email2').val("");
		$('#email2').attr('readonly', false);
		$('#email2').addAttr('required');
	} else {
		$('#email2').val("");
		$('input#email2').val(state);
		$('#email2').attr('readonly', true);
	}
});

</script>

<script>
// 기업이름 유효성 검사(1 = 중복 / 0 != 중복)
	$("input[name=co_name]").on('keyup', function() {
		var co_name = $('#compName').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/checkCo.do?co_name='+ co_name,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data.dto != "null") {
						// 1 : 아이디가 중복되는 문구
						console.log(data.dto.co_email);
						var e1 = (data.dto.co_email).split('@')[0];
						var e2 = (data.dto.co_email).split('@')[1]
						$("#email1").val(e1);
						$("#email2").val(e2);
						$("#co_code").val(data.dto.co_code);
					} 
				}, error : function() {
						console.log("회원조회 실패 고객센터에 문의해주세요");
				}
			});
		});
</script>



</body>
</html>