/**
 * 유저 마이페이지용
 */

/**
 * 회원관리
 */

var iderror = "아이디를 입력하세요";
var passwderror = "비밀번호를 입력하세요";
var repasswderror = "비밀번호를 같게 입력하세요";
var nameerror = "이름을 입력하세요";
var juminerror = "주민등록번호를 입력하세요";
var telerror = "입력할거면 다 입력해라";
var emailerror = "이메일 형식에 맞지 않습니다";
var confirmerror = "아이디 중복확인 해주세요";

var inputerror = "회원 가입에 실패했습니다.\n잠시 후 다시 시도하세요";
var loginiderror = "입력하신 아이디가 없습니다.\n다시 확인하세요";
var loginpasswderror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요";
var deleteerror = "회원 탈퇴에 실패했습니다.\n잠시 후 다시 시도하세요";
var modifyerror = "회원 정보 수정에 실패했습니다.\n잠시 후 다시 시도하세요";
var confirmdel = "회원탈퇴에 성공하였습니다!";

function erroralert( msg ) {
	alert( msg );
	history.back();
}

function memmodifycheck() {
	alert("삭제비번 : " + memmodifyform.delpasswd.value);
	alert("원래비번 : " + memmodifyform.passwd.value);
    if( ! memmodifyform.passwd.value ) {
        alert( passwderror );
        memmodifyform.passwd.focus();
        return false;
    }
    if( memmodifyform.passwd.value != memmodifyform.repasswd.value ) {
        alert( repasswderror );
        memmodifyform.repasswd.focus();
        return false;
    }
    if( ! memmodifyform.delpasswd.value ) {
        alert( passwderror );
        memmodifyform.delpasswd.focus();
        return false;
    }
    if( memmodifyform.delpasswd.value != memmodifyform.passwd.value ) {
        alert( repasswderror );
        memmodifyform.delpasswd.focus();
        return false;
    }
    if ( memmodifyform.delpasswd.value == memmodifyform.passwd.value) {
        alert( confirmdel );
        document.getElementById("userState").value = 2;
        return true;
    }  
}

// 회원 정보 수정
function modifycheck() {
	if( ! modifyform.passwd.value ) {
		alert( passwderror );
		modifyform.passwd.focus();
		return false;
	} else if( modifyform.passwd.value != modifyform.repasswd.value ) {
		alert( repasswderror );
		modifyform.repasswd.focus();
		return false;
	}
}

// 회원탈퇴
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}
}

// 로그인
function logincheck() {
	if( ! loginform.id.value ) {
		alert( iderror );
		loginform.id.focus();
		return false;
	} else if( ! loginform.passwd.value ) {
		alert( passwderror );
		loginform.passwd.focus();
		return false;
	}		
}

// 아이디 중복확인
function confirmid() {
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();		
	} else {
		var url = "confirmId.do?id=" + inputform.id.value;
		open( url, "Confirm", "toolbar=no,menubar=no,scrollbar=no,status=no,width=400,height=200" );		
	}
}
function confirmcheck() {
	if( ! confirmform.id.value ) {
		alert( iderror );
		confirmform.id.focus();
		return false;
	}
}
function setid( id ) {
	opener.document.inputform.confirm.value = "1";		// 중복확인 성공
	opener.document.inputform.id.value = id;
	self.close();
}


// 메인 페이지 
function maincheck() {
	if( ! mainform.id.value ) {
		alert( iderror );
		mainform.id.focus();
		return false;
	} else if( ! mainform.passwd.value ) {
		alert( passwderror );
		mainform.passwd.focus();
		return false;
	}
}

// 회원가입
function inputcheck() {
	if( inputform.confirm.value == "0" ) {
		alert( confirmerror );
		inputform.id.focus();
		return false;
	}	
	
	if( ! inputform.id.value ) {
		alert( iderror );
		inputform.id.focus();
		return false;
	} else if( ! inputform.passwd.value ) {
		alert( passwderror );
		inputform.passwd.focus();
		return false;
	} else if( inputform.passwd.value != inputform.repasswd.value ) {
		alert( repasswderror );
		inputform.repasswd.focus();
		return false;
	} else if( ! inputform.name.value ) {
		alert( nameerror );
		inputform.name.focus();
		return false;
	} else if( inputform.jumin1.value.length < 6 || inputform.jumin2.value.length < 7 ) {
		alert( juminerror );
		inputform.jumin1.focus();
		return false;
	} else if( inputform.tel1.value 
			|| inputform.tel2.value 
			|| inputform.tel3.value ) {
		if( inputform.tel1.value.length < 3 
				|| inputform.tel2.value.length < 3
				|| inputform.tel3.value.length < 4 ) {
			alert( telerror );
			inputform.tel1.focus();
			return false;
		}		
	} 
	
	// 	1. null 인 경우		이동 가능
	// 	2. 직접입력일 경우		email1 란에 @가 없으면 경고
	// 	3. 선택입력일 경우		email1 란에 @가 있으면 경고
	//	단 전화번호가 있건 없건 모두 가능해야 한다.
	if( inputform.email1.value ) {
		if( inputform.email2.value == "0" ) {
			// 직접입력
			if( inputform.email1.value.indexOf( "@" ) == -1 ) {
				alert( emailerror );
				inputform.email1.focus();
				return false;
			}			
		} else {
			// 선택입력
			if( inputform.email1.value.indexOf( "@" ) != -1 ) {
				alert( emailerror );
				inputform.email1.focus();
				return false;
			}	
		}
	}	
} 

function nextjumin2() {
	if( inputform.jumin1.value.length == 6 ) {
		inputform.jumin2.focus();
	}
}
function nexttel1() {
	if( inputform.jumin2.value.length == 7 ) {
		inputform.tel1.focus();
	}
}
function nexttel2() {
	if( inputform.tel1.value.length == 3 ) {
		inputform.tel2.focus();
	}
}
function nexttel3() {
	if( inputform.tel2.value.length == 4 ) {
		inputform.tel3.focus();
	}
}
function nextemail1() {
	if( inputform.tel3.value.length == 4 ) {
		inputform.email1.focus();
	}
}

/**
 * 	게시판
 */

var writererror = "작성자를 입력하세요";
var subjecterror = "글제목을 입력하세요";
var contenterror = "글내용을 입력하세요";
var passwderror = "비밀번호를 입력하세요";

var writeerror = "글작성에 실패했습니다.\n잠시 후 다시 시도하세요.";
var checkerror = "입력하신 비밀번호가 다릅니다.\n다시 확인하세요.";
var deleteerror = "글삭제에 실패했습니다.\n잠시 후 다시 시도하세요.";
var replyerror = "답글이 있는 글은 삭제할 수 없습니다.";

function erroralert( msg ) {
	alert( msg );
	history.back();
}

// 글수정
function modifycheck() {
	var content = modifyform.content.value
				.replace( "<", "<!--" )
				.replace( ">", "-->" );
	modifyform.content.value = content;
	
	if( ! modifyform.subject.value ) {
		alert( subjecterror );
		modifyform.subject.focus();
		return false;
	} else if( ! modifyform.content.value ) {
		alert( contenterror );
		modifyform.content.focus();
		return false;
	} else if( ! modifyform.passwd.value ) {
		alert( passwderror );
		modifyform.passwd.focus();
		return false;
	}
}

// 글삭제
function passwdcheck() {
	if( ! passwdform.passwd.value ) {
		alert( passwderror );
		passwdform.passwd.focus();
		return false;
	}	
}

// 글쓰기
function writecheck() {
	
	var content = writeform.content.value.replace( "<", "<!--" ).replace( ">", "-->" );
	writeform.content.value = content;
		
	if( ! writeform.writer.value ) {
		alert( writererror );
		writeform.writer.focus();
		return false;
	} else if( ! writeform.subject.value ) {
		alert( subjecterror );
		writeform.subject.focus();
		return false;
	} else if( ! writeform.content.value ) {
		alert( contenterror );
		writeform.content.focus();
		return false;
	} else if( ! writeform.passwd.value ) {
		alert( passwderror );
		writeform.passwd.focus();
		return false;
	}
} 




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



















