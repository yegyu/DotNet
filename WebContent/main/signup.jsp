<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--     주소 제대로 해야함 -->
<!-- 비밀번호  , 아이디 , 이메일 형식들의 유효성 검사 없음  keyup 으로 하면 좋을듯 ajax 아래로	-->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<!-- <link rel="stylesheet" href="//unpkg.com/bootstrap@4/dist/css/bootstrap.min.css"> -->
<link rel="stylesheet" href="bootstrap.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap" rel="stylesheet">
<!-- style_dotnet.csa -->
<link rel="stylesheet" type="text/css" href="style_dotnet.css" />


</head>
<body>

<nav class="navbar navbar-expand-md navbar-default">
	<jsp:include page="../mainNav.do" flush="false"></jsp:include>
</nav>




<div class="container">
    <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;회원가입</h1>
<!--     <div class="panel panel-default"> -->
      <div class="shadow p-4 mb-4 bg-white">


        <form  method="post" action="signupPro.do" >
        
          <input type = "hidden" name = "confirm" value = "0">
          
          <div class="form-group row">
            <div class="col-xs-3">
              <label for="id">아이디</label>
              <input type="text"  id="id" name="id" class="form-control col-xs-3" placeholder="" aria-describedby="helpId"
                size="" maxlength="20">
            </div><br>
            <div class="col-xs-3" id="idresult"></div>
           
          </div>

          <div class="form-group row">
            <div class="col-xs-3">
              <label for="passwd">비밀번호</label>
              <input type="password" id="passwd" name="passwd" class="form-control" aria-describedby="passwordHelpInline" maxlength="20">
              <small id="passwordHelpInline" class="text-muted" >
                	비밀번호는 3-20 자리여야 합니다.
              </small>
            </div>
            <div class="col-xs-3" id="passwdresult"></div>
            
          </div>
          <div class="form-group row">
            <div class="col-xs-3">
              <label for="repasswd">비밀번호 재입력</label>
              <input type="password" id="repasswd" name = "repasswd" class="form-control" aria-describedby="passwordHelpInline" maxlength="20">
            </div>
            <div class="col-xs-3" id="repasswdresult"></div>
            
            
          </div>

          <div class="form-group ">
            <label>성별 </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="male" name="gender" value="1" class="custom-control-input" checked="checked">
                <label class="custom-control-label" for="male">남자</label>
              </div>
              <div class="custom-control custom-radio custom-control-inline">
                <input type="radio" id="female" name="gender" value="2" class="custom-control-input">
                <label class="custom-control-label" for="female">여자</label>
              </div>
          </div>

		  <div class="form-group row ">
            <div class="col-xs-1">
              <label for="age">나이</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </div>
            <div class="col-xs-1">
              <select class="form-control" id="age" name="age">
                <option value="10" selected="selected">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="40">40</option>
                <option value="50">50</option>
                <option value="60">60</option>
                <option value="70">70</option>
                <option value="80">80</option>
                <option value="90">90</option>
              </select>
            </div>
            <div class="col-xs-1 "><div>대</div></div>
          </div>
          <div class="form-group row">
            <div class="col-xs-3">
              <label for="email">이메일</label>
              <input type="email" class="form-control" id="email" name = "email" placeholder="Email" size="30">
              
            </div>
          </div>

          <div class="form-group row">
            <div class="col-xs-3">
              <label for="zipcode">우편번호</label>
              <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="" >
            </div>
            <div class="col-xs-3">
              <br>
              <input type="button" class="btn" id="addressSearch" name="addressSearch" value="주소 검색" onclick="sample6_execDaumPostcode()" >

            </div>
          </div>
          <div class="form-group row">
            <div class="col-xs-3">
              <label for="address">주소</label>
              <input type="text" class="form-control" id="address" name="address" placeholder="서울시 마포구 염리동"  size="30">
            </div>

            <div class="col-xs-3">
              <label for="addressDetail">상세 주소</label>
              <input type="text" class="form-control" id="addressDetail" name="addressDetail" placeholder="자세한 정보 ex) 단지 ,층수, 번지" readonly='true' size="30">
            </div>
          </div>

          <br>
          <div class="form-group row">
            <div class="col-xs-1">
              <button type="submit" class="btn">가입</button>
            </div>
            <div class="col-xs-1">
              <button type="reset" class="btn">초기화</button>
            </div>
            <div class="col-xs-1">
              <button type="button" class="btn" onclick="location='main.do'">취소</button>
            </div>
          </div>
        </form>
      </div>
<!--     </div> -->
  </div>
<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript" src="bootstrap.bundle.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
// 	var result = ${result};
	//주소 확인
	
	$(document).ready(
		function() {
			$("button[type=submit]").click(
				function(){
					if($("#id").val()==""){
						alert("아이디를 입력해 주세요.")
						$("#id").focus();
						return false
					}else if($("#passwd").val()=="" ){
						alert("비밀번호를 입력해 주세요.")
						$("#passwd").focus();
						return false
					}else if($("#passwd").val().length <3 || $("#passwd").val().length >20){
						alert("비밀번호 수가 맞지 않습니다. 3~8 자리");
						$("#passwd").focus();
						return false
					}
					else if($("#repasswd").val()==""){
						alert("비밀번호를 재입력해 주세요.");
						$("#repasswd").focus();
						return false
					}else if($("#email").val()==""){
						alert("이메일을 입력해 주세요~~");
						$("#email").focus();
						return false
					}
					else if($("input[id=zipcode]").val() == "" || $("input[id=address]").val() ==""){
						alert("주소를 입력해 주세요 ( 검색  Click^^)")
						$('#addressSearch').focus();
						return false
					}
				}		
			);
			
			// 아이디 중복확인
			$("input[id=id]").on(
				"keyup",
				function( event ) {
					$("#idresult").text("");
					$.ajax(
							{
								type : "POST",
								url : "idCheck.do",
								data : {
									id : $("#id").val()
								},
								dataType : "xml",
								success : function( data ) {
									var result = eval( "(" + $(data).find("result").text() + ")")								
									if( result.code.trim() == "success" ) {
										if($("#idresult").html( result.message ).text() == "사용할 수 없는 아이디입니다."){
											$("input[name=confirm]").val(0);
											$("button[type=submit]").val("아이디 중복").attr("disabled",true);
										}else{
											$("button[type=submit]").val("가입").attr("disabled",false);
											$("input[name=confirm]").val(1);
										}
										
									} else {
										$("#console").html( "DB처리에 실패했습니다.<br>" );	
									}								
								},
								error : function( e ) {
									$("#cosole").html( e );
								}
							}		
					);
				}
			);	
			//비밀번호
			$("input[id=passwd]").on(
				"keyup",
				function(event){
					$("#passwdresult").text("특수문자 , 영문자 조합하세요~~");
				}
			);
			//비밀번호 확인
			$("input[id=repasswd]").on(
				"keyup",
				function(event){
					
					if($("input[id=passwd]").val() == $("input[id=repasswd]").val()){
						$("#repasswdresult").text("비밀번호가 일치합니다.");
					}else{
						$("#repasswdresult").text("비밀번호가 일치하지 않습니다.");
					}
				}
			);
			
			//이메일 확인
			//알아서 해줌
		}		
	);	
</script>

<script>
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
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
            document.getElementById("addressDetail").readOnly=false;
        }
    }).open();
}
</script>

</body>
</html>