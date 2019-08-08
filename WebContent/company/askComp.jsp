<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<link rel="stylesheet" href="bootstrap.css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	<script type="text/javascript" src="bootstrap.bundle.js"></script>
	
	<!--MDL CDN  -->
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
	<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
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
	#title{
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
<form class="container" name="compAsk" onsubmit="askCompPro.do">
<div class="card">
<table class="table table-hover text-center">
	<th colspan=4 class="text-center">
	<center><h3>기업이용자 사용문의 접수</h3></center>
	</th>
	<tr>
		<th id="name">
			<p class="mt-4">이메일</p>
		</th>
		
		<td colspan="2" id="email">
		<div id=email class="mt-2">
			  <div class="mdl-textfield mdl-js-textfield">
			    <input class="mdl-textfield__input mb-2" type="text" name="email1">
			    <label class="mdl-textfield__label mb-2 text-center">E-mail</label>
	  		</div>
	  		@
	  		<div class="mdl-textfield mdl-js-textfield">
			    <input class="mdl-textfield__input mb-2" type="text" name="email2">
			    <label class="mdl-textfield__label mb-2 text-center">직접입력</label>
	  		</div>
  		</div>
  		</td>
  		
  		<td>
  		<div class="select float-left">
  		    <select class="selectpicker mt-4">
				<option value="google.com">구글(Gmail)</option>
				<option value="naver.com">네이버(NAVER)</option>
				<option value="daum.net">다음(DAUM)</option>
				<option value="nate.com">네이트(NATE)</option>
				<option value="hotmail.com">핫메일(HOTMAIL)</option>
				<option value="">직접입력</option>
			</select>
  		</div>
		</td>
	</tr>
	<tr>
		<th id="name">
			<p class="mt-4">기업명</p>
		</th>
		<td>
		  <div class="mdl-textfield mdl-js-textfield">
		    <input class="mdl-textfield__input mb-2" type="text" id="sample1">
		    <label class="mdl-textfield__label mb-2 text-center" for="sample1">업체명</label>
  		</div>
		</td>
		<th id=name>
			<p class="mt-4">문의자 성명</p>
		</th>
		<td>
			<div class="mdl-textfield mdl-js-textfield">
		    <input class="mdl-textfield__input mb-2" type="text" id="sample1">
		    <label class="mdl-textfield__label mb-2 text-center" >문의자 성명</label>
  		</div>
		</td>
	</tr>
	<tr>
		<th colspan=3>
		문의 제목
		</th>
		<th colspan=1>
		문의 유형
		</th>
	</tr>
	<tr>
		<td colspan=3>
		  <div class="mdl-textfield mdl-js-textfield float-left">
		    <input class="mdl-textfield__input mb-2" type="text" id="title">
		    <label class="mdl-textfield__label mb-2 text-center" id="title">제목을 입력해주세요</label>
  		</div>		
		</td>
		<td colspan=1>
		<select class="selectpicker mt-4">
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
              <textarea name="comment" id="comment" cols="30" rows="15" class="form-control" placeholder="문의내용을 입력해주세요"></textarea>
          </div>
          <!--div.form-group-->
          <div class="form-group custom-control custom-checkbox mt-3">
              <input type="checkbox" class="custom-control-input" id="confirm">
              <label for="confirm" class="custom-control-label">
                  개인정보 수집 및 이용에 동의합니다.
              </label>
          </div>
          </th>
	</tr>
	<tr>
		<th colspan=4>
			<div id="buttons" class="mb-4">
				<button type="submit" class="btn btn-success"> 작성 완료 </button>
				<button type="reset" class="btn btn-danger"> 작성 취소 </button>
			</div>
		</th>
		
	</tr>
</table>
</div>

</form>
</body>
</html>