
var loginpasswderror = "비밀번호가 틀렸습니다.";
var loginiderror = "아이디가 틀렸습니다.";
var login = "로그인성공";

function erroralert( str ) {
	alert(str);
}

jQuery(function($) {
	$("body").css("display", "none");
	$("body").fadeIn(1000);
	$("a.transition").click(function(event){
	event.preventDefault();
	linkLocation = this.href;
	$("body").fadeOut(1000, redirectPage);
	});
	function redirectPage() {
	window.location = linkLocation;
	}
}); 

