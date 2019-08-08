<%@page import="main.MemberDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="setting_user.jsp"%>
<script src="${project_user}/script_user.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.indigo-pink.min.css">
<script defer src="https://code.getmdl.io/1.3.0/material.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<style>
th {
	text-align: center;
}
</style>

<c:if test="${result == 1}">
	<div class="modal fade bd-example-modal-xl in" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true" style="display : block;">
	  <div class="modal-dialog modal-xl">
	    <div class="modal-content">
			<form name="memmodifyform" id="memmodifyform" method="post" action="modifyUserPro.do"
				onsubmit="return memmodifycheck()">
				<div class="col">
					<table class="table table-hover">
						<tr>
							<th colspan="2" style=" background-color: #F7F7F7;">
								<h4>${memberDto.id}님, ${msg_modify}</h4>
							</th>
						</tr>
						<tr>
							<th>${str_id}</th>
							<td>&nbsp;${memberDto.id}</td>
						</tr>
						<tr>
							<th>${str_passwd}</th>
							<td><input class="input" type="password" name="passwd"
								maxlength="15" value="${memberDto.passwd}"></td>
						</tr>
						<tr>
							<th>재입력</th>
							<td><input class="input" type="password" name="repasswd"
								maxlength="15" value="${memberDto.passwd}"></td>
						</tr>
		
						<tr>
							<th>
							${str_age}
							</th>
							<td>	
								<div class="col-md-4">
									<select class="form-control" name="age">
										<option value="10" selected="selected">10대</option>
										<option value="20">20대</option>
										<option value="30">30대</option>
										<option value="40">40대</option>
										<option value="50">50대</option>
										<option value="60">60대</option>
										<option value="00">60대 이상</option>
									</select>
								</div>
								<input name="age-out" type="text" readonly value="현재 설정 = ${memberDto.age}대" >
								</td>
						</tr>
		
						<tr>
							<th rowspan="3">주소</th>
							<td><input style="height:35;"class="col-md-2" type="text" id="zipcode"
								name="zipcode" value="${memberDto.zipcode}">&nbsp; <input class="btn btn-primary"
								type="button" class="btn" id="addressSearch" name="addressSearch"
								value="주소 검색" onclick="sample6_execDaumPostcode()"></td>
						</tr>
						<tr>
							<td><input class="col-md-9" type="text" id="address"
								name="address" value="${memberDto.address}"></td>
						</tr>
						<tr>
							<td><input class="col-md-9" type="text" id="addressDetail"
								name="addressDetail" value="${memberDto.addressDetail}"></td>
						</tr>
						
						<tr>
							<th>${str_gender}</th>
							<td><c:if test="${memberDto.gender eq 1}">
						  	남성
						  </c:if> <c:if test="${memberDto.gender eq 2}">
						  	여성
						  </c:if></td>
						</tr>
		
						<tr>
							<th>${str_email}</th>
							<td><input class="input" type="text" name="email"
								value="${memberDto.email}"></td>
						</tr>
						<tr>
							<th>회원활동여부</th>
							
							<td>
								<input id="userState" name="userState" type="hidden" value="${memberDto.userState}">
								
								<label>
									<c:choose>
										<c:when test="${memberDto.userState eq 1 }">
											활동 정지된 회원
										</c:when>
										<c:when test="${memberDto.userState eq 2 }">
											탈퇴된 회원
										</c:when>
										<c:otherwise>
											활동중인 회원
										</c:otherwise>
									</c:choose>	
								</label>
							</td>
						</tr>
						<tr>
							<th colspan="2"style=" background-color: #F7F7F7;">
							<input class="btn btn-primary" type="submit"
								value="${btn_mod}"> 
							<input class="btn btn-dark" type="button" value="${btn_mod_cancel}"
								onclick="location='mypage.do'">
							<button name=""type="button" class="btn btn-danger" data-toggle="modal"
							data-target="#exampleModalCenter">회원탈퇴</button>	
							</th>
							
					
						</tr>
					</table>
				
					
		
							
					<div class="modal fade" id="exampleModalCenter" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalCenterTitle"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLongTitle">회원탈퇴 확인</h5>
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">&times;</span>
									</button>
								</div>
									<div class="modal-body">
										<div class="form-group">
											<input name="delpasswd" type="password" class="form-control"
												placeholder="이곳에 비밀번호를 입력하세요">
										</div>
									</div>
									<div class="modal-footer">
										<button name="delconfirm" type="submit" class="btn btn-danger" form="memmodifyform">
											회원탈퇴</button>
										<button name="delcancel" type="reset" class="btn btn-secondary"
											data-dismiss="modal">Close</button>
									</div>
								</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	  </div>
	</div>
</c:if>
<c:if test="${result != 1}">
	<script type="text/javascript">
	//<!--
		alert("비밀번호가 틀렸습니다.");
		history.back();
	//-->
	</script>
</c:if>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 각 주소의 노출 규칙에 따라 주소를 조합한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var addr = ''; // 주소 변수
				var extraAddr = ''; // 참고항목 변수

				//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
					addr = data.roadAddress;
				} else { // 사용자가 지번 주소를 선택했을 경우(J)
					addr = data.jibunAddress;
				}

				// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				if (data.userSelectedType === 'R') {
					// 법정동명이 있을 경우 추가한다. (법정리는 제외)
					// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}
					// 건물명이 있고, 공동주택일 경우 추가한다.
					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}
					// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					// 조합된 참고항목을 해당 필드에 넣는다.
					//                 document.getElementById("sample6_extraAddress").value = extraAddr;

				} else {
					document.getElementById("addressdetail").value = '';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zipcode').value = data.zonecode;
				document.getElementById("address").value = addr;
				// 커서를 상세주소 필드로 이동한다.
				document.getElementById("addressDetail").focus()
				document.getElementById("addressDetail").readOnly = false;
			}
		}).open();
	}
</script>
<script>
	function setValues(){
		var age = document.getElementById("age");
		var ageOut = document.getElementById("age-out");
		age.value=ageOut.options[age.selectedIndex].text;
	}
</script>








