<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- 
<!DOCTYPE html>
<html> -->

<!-- <head> -->
<meta charset="UTF-8">
<title>마이페이지</title>

<link rel="stylesheet" type="text/css" href="style_dotnet.css" />
<link rel="stylesheet" type="text/css" href="mypage.css" />

<link
    href="https://fonts.googleapis.com/css?family=Caveat|Concert+One|Dancing+Script|Fredoka+One|Kalam|Kaushan+Script|Lobster|Luckiest+Guy|Merienda|Neucha|Sniglet|ZCOOL+QingKe+HuangYou&display=swap"
    rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css"
    integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<link rel="stylesheet" href="bootstrap.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<script src="//cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
    integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
    crossorigin="anonymous"></script>
<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <script type="text/javascript" src="jquery-3.4.1.js"></script> -->
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script> -->
<!-- <script type="text/javascript" src="bootstrap.bundle.js"></script> -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
    #emialWin {
        margin: 10px;

    }

    #mailCon {
        display: none;
        position: fixed;
        bottom: 0px;
        right: 0px;
        width: 500px;
        z-index: 1;
    }

    #frId,
    #title,
    #content {
        border-top: 0px;
        border-left: 0px;
        border-right: 0px;
        border-top-color: transparent;
        border-left-color: transparent;
        border-right-color: transparent;

    }

    #mailHead {
        background-color: rgba(227, 179, 255, 0.938);
        width: 100%;
        height: 25px;
    }

    /* sendMail */
    .sContent,
    .rContent {
        display: none;
    }

    .sTable:hover,
    .rTable:hover {
        cursor: pointer;
    }

    div.table {
        height: 35rem;
        overflow: auto;
    }

    table>thead>tr>th:nth-child(1) {
        width: 8%;
    }

    table>thead>tr>th:nth-child(2) {
        width: 8%;
    }

    table>thead>tr>th:nth-child(3) {
        width: 20%;
    }

    table>thead>tr>th:nth-child(5) {
        width: 20%;
    }

    a.brand:hover {
        background-color: #2FD6FF;
        color: white;
    }

    .nav-pills .nav-link.active,
    .nav-pills .show>.nav-link {
        color: #fff;
        background-color: rgba(227, 179, 255, 0.938);
    }

    ul.nav-stacked {
        display: flex;
        align-content: flex-start;
        flex-direction: column;
        flex-wrap: wrap;
        overflow: auto;
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

        .sidebar a {
            float: left;
        }

        div.content {
            margin-left: 0;
        }
    }

    @media screen and (max-width: 400px) {
        .sidebar a {
            text-align: center;
            float: none;
        }
    }
</style>
<!-- </head> -->

<!-- <body> -->

<div class="page-wrapper chiller-theme toggled">
    <a id="show-sidebar" class="btn btn-sm btn-dark" href="#">
        <i class="fas fa-bars"></i>
    </a>
    <nav id="sidebar" class="sidebar-wrapper">
        <div class="sidebar-content">
            <div class="sidebar-brand">
                <a class="navbar-brand" href="main.do">
                    <h1 id="logo">.Net</h1>
                </a>
                <div id="close-sidebar">
                    <i class="fas fa-times"></i>
                </div>
            </div>
            <div class="sidebar-header">
            	<div class="row">
	            	<div class="col-xs-1">
		                <div class="user-pic">
		                    <img class="img-rounded"
		                        src="https://raw.githubusercontent.com/azouaoui-med/pro-sidebar-template/gh-pages/src/img/user.jpg"
		                        alt="User picture" style="width:50px; height:50px;"><br>
		                </div>
	                </div>
	                <div class="col-xs-1">
	                	
		                <div class="user-info">
		                    <span class="user-name">
								아이디 : ${memId}
		                    </span>
		                    <c:if test="${memId != 'admin'}">
		                        <span class="badge badge-pill badge-primary">일반회원</span>
		                        <span class="badge badge-pill badge-warning mt-1">보유 포인트 ${point}P</span>
		                    </c:if>
		                    <c:if test="${memId == 'admin'}">
		                        <span class="badge badge-pill badge-primary">관리자</span>
		                        <span class="badge badge-pill badge-warning mt-1"> 기업사용자 문의</span>
		                        <span class="badge badge-pill badge-warning mt-1"> 일반회원 문의</span>
		                    </c:if>
		                  </div>
	                </div>
                </div>
            </div>
            <!-- sidebar-header  -->
            <div class="sidebar-search">
                <div>
                    <!--         <div class="input-group">
            <input type="text" class="form-control search-menu" placeholder="Search...">
            <div class="input-group-append">
              <span class="input-group-text">
                <i class="fa fa-search" aria-hidden="true"></i>
              </span>
            </div>
          </div> -->
<%--                     <c:if test="${memId != 'admin'}"> --%>
<%--                         <a href="mypage.do">${memId}님의 마이페이지</a> --%>
<!--                         <br> -->
<%--                     </c:if> --%>
<%--                     <c:if test="${memId	== 'admin'}"> --%>
<!--                         <a href="mypage.do">관리자 페이지</a> -->
<!--                         <br> -->
<%--                     </c:if> --%>

                    <a href="main.do" id="logoutSide"><i class="fas fa-user-circle"></i>
                        Logout&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </a><br>
                    <a href="" id="wm" data-toggle="modal"><i class="far fa-envelope"></i>쪽지 쓰기<br></a>
                    <a href="main.do?b_tp=3" ><i class="fas fa-question"></i>...Net 질문<br></a>
                </div>
            </div>
            <c:if test="${memId != 'admin'}">
                <div class="sidebar-menu">
                    <ul>
                        <li class="header-menu"> <span>일반 메뉴</span> </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fas fa-file-invoice"></i>
                                <span>친구 피드 </span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/mypage.do" id="mpm">친구들 설문 피드

                                        </a>
                                    </li>
                                    <li>
                                        <a href="frWrFeed.do">친구들 최근 답변, 질문 </a>
                                    </li>

                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fas fa-file-invoice"></i>
                                <span>내 설문 관리 </span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/lib.do" id="lib">내 최근 참여 설문

                                        </a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/mytest.do">내가 작성한 설문 </a>
                                    </li>

                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fas fa-copyright"></i>
                                <span>내 포인트 관리</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/recPo.do">포인트 적립 / 사용 내역
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/goods.do">상품 신청 / 결제</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="far fa-envelope"></i>
                                <span>내 메세지 관리</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/receiveMail.do">받은 메세지함</a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/sendMail.do">보낸 메세지함</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fas fa-users"></i>
                                <span>내 친구 관리</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="frSt.do">친구 신청 현황</a>
                                    </li>
                                    <li>
                                        <a href="myFr.do">내 친구 목록</a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/recomFr.do">추천 친구 목록</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fa fa-globe"></i>
                                <span>회원 정보 관리</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="myFeed.do">나의 피드 보기</a>
                                    </li>
                                    <li>
                                        <a href="modifyUser.do">회원 정보 수정</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
            </c:if>
            <c:if test="${memId=='admin'}">
                <div class="sidebar-menu">
                    <ul>
                        <li class="header-menu"> <span>일반 메뉴</span> </li>
                        <li class="sidebar-dropdown">
                            <a href="#"><i class="fas fa-file-invoice"></i>
                                <span>사이트 관리 </span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/memberMng.do" id="lib">회원 활동 관리

                                        </a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/adminBoard.do">게시물 관리 </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fas fa-copyright"></i>
                                <span>사이트 데이터 관리</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/memChart.do">회원 현황
                                        </a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/mwChart.do">설문유형 2 </a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/fiveChart.do">설문유형 5 </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="far fa-envelope"></i>
                                <span>내 메세지 관리</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/receiveMail.do">받은 메세지함</a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/sendMail.do">보낸 메세지함</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="sidebar-dropdown">
                            <a href="#">
                                <i class="fas fa-users"></i>
                                <span>회원 결제 관련</span>
                            </a>
                            <div class="sidebar-submenu">
                                <ul>
                                    <li>
                                        <a href="/DotNet/adminPoMng.do">포인트 결제 관리</a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/adminGoodsMng.do">상품 등록 관리</a>
                                    </li>
                                    <li>
                                        <a href="/DotNet/adminPayHistory.do">회원 결제 내역</a>
                                    </li>
                                </ul>
                            </div>
                        </li>
            </c:if>




            </ul>
        </div>
</div>
<!--왼쪽 사이드 끝  -->
</nav>
<!-- sidebar-wrapper  -->
<!-- 메일 작성 박스 -->

<!--친구들이 참여한 설문 들  +++   -->
<div class="page-content" id="mpc">
<div class="container-fluid	">
	
</div>
</div>

<!-- 쪽지 모달 -->
<div class="modal fade " id="navMail" tabindex="-1" role="dialog" aria-labelledby="navMailTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="navMailTitle" align="center">쪽지 </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- sidebar-wrapper  -->
                <!-- 메일 작성 박스 -->
                <form id="emailWin">
                    <div class="form-group">
                        <label for="frId">받을 사람 ID</label>
                        <input type="text" class="form-control" id="frId" name="frId" placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="title">제목</label>
                        <input type="text" class="form-control" id="title" name="title" autocomplete='off'
                            placeholder="">
                    </div>
                    <div class="form-group">
                        <label for="content">글 내용</label>
                        <textarea class="form-control" id="content" name="content" rows="10"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <div class="form-group right">
                    <button type="button" class="btn " id="emailBtn" onclick="return checkMail();">보내기</button>
                    <button type="reset" class="btn " form="emailWin">리셋</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 작성자는 세션 ID -->
<c:set var="id" value="${sessionScope.memId}" />
<script type="text/javascript" src="jquery-3.4.1.js"></script>
<script type="text/javascript" src="bootstrap.bundle.js"></script>
<script>
$('#wm').on('click',function(){
	$('#navMail').modal("show");
})
</script>
<!-- 사이드바 드롭박스 스크립트 -->
<script>
var lh = location.href.split('/');
var lastIdx = lh[lh.length -1]; 
if(lastIdx != "mypage.do"){
	$('#mpc').remove();
}
</script>
<script>
    jQuery(function ($) {

        $(".sidebar-dropdown > a").click(function () {
            $(".sidebar-submenu").slideUp(200);
            if (
                $(this)
                    .parent()
                    .hasClass("active")
            ) {
                $(".sidebar-dropdown").removeClass("active");
                $(this)
                    .parent()
                    .removeClass("active");
            } else {
                $(".sidebar-dropdown").removeClass("active");
                $(this)
                    .next(".sidebar-submenu")
                    .slideDown(200);
                $(this)
                    .parent()
                    .addClass("active");
            }
        });

        $("#close-sidebar").click(function () {
            $(".page-wrapper").removeClass("toggled");
        });
        $("#show-sidebar").click(function () {
            $(".page-wrapper").addClass("toggled");
        });
    });
</script>
<!-- 메일쓰기  기능 -->
<script>
    $('#writeEmail').on('click', function () {
        $('#mailCon').toggle("slow");
    })

    function checkMail() {
        if (!$("#frId").val() || !$("#content").val() || !$("#title").val()) {
            alert("빠진 부분을 확인해 주세요")
            return false;
        } else {
            var maildata = { frId: $("#frId").val(), title: $("#title").val(), content: $("#content").val() }
            $.ajax({
                data: maildata,
                type: "post",
                dataType: "text",
                url: "sendMail.do",
                success: function (data) {
                    if (data == 1) {
                        alert("성공")
                        $('#navMail').modal('toggle');
                    } else if (data == -1) {
                        alert("해당 아이디가 존재하지 않아요ㅠㅠ")
                    } else if (data == 0) {
                        alert("전송 실패")
                        $('#navMail').modal('toggle');
                    }


                }
            });
        }
    };
</script>
<!-- 메일함 체크박스 기능 -->
<script>
    var json = new Object();
    var pJson = new Object();
    var jsonStr;
    (function () {
        $("a > img").hover(function () {
            $(this).addClass('transition');
        }, function () {
            $(this).removeClass('transition');
        });
    })();
    $(document).ready(function () {
        $('.sTable').click(function () {
            if (event.target.nodeName != 'INPUT') {
                var idx = $(this).index();
                $('.sContent').eq(idx / 2).toggle(100);
            }
        });

        $('.rTable').click(function () {
            if (event.target.nodeName != 'INPUT') {
                var idx = $(this).index();
                $('.rContent').eq(idx / 2).toggle(100);
            }
        });
        // 				$('button').on('click', function(){
        // 					    event.stopPropagation();
        // 				});
        $('#topCheckS').on('click', function () {
            if ($(this).is(':checked')) {
                $('.sTable > th > input[type=checkbox]').prop('checked', true);
            } else {
                $('.sTable > th > input[type=checkbox]').prop('checked', false);
            }
        });
        $('#topCheckR').on('click', function () {
            if ($(this).is(':checked')) {
                $('.rTable > th > input[type=checkbox]').prop('checked', true);
            } else {
                $('.rTable > th > input[type=checkbox]').prop('checked', false);
            }
        });

    });
    //check box 삭제 ajax
    $(document).ready(function () {
        $("button[id=trash]").on('click', function () {
            if ($('input[type=checkbox]').is(':checked')) {
                if (confirm("정말 삭제하시겠습니까??") == true) {    //확인
                    var selected = [];
                    $('input:checked').each(function () {
                        selected.push($(this).attr('id'));
                    });
                    var Ob = [];
                    $.each(selected, function (index, item) {
                        Ob.push(item.split('_'))
                    });
                    for (var i = 0; i < Ob.length; i++) {
                        json[Ob[i][0]] = Ob[i][1]
                    }

                    jsonStr = JSON.stringify(json);
                    var pJson = { "val": jsonStr }
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
<script>
    $(document).ready(function () {
        $("#logoutSide").on('click', function () {
            var dd = { 1: "1" };
            $.ajax({
                data: dd,
                dataType: "text",
                type: "post",
                url: "logout.do",
                success: function () {
                    location.reload = "main.do"
                }

            })
        });

//         $('.close').on('click', function () {
//             $('#navMail').modal('toggle');
//             //                 $(this).attr('data-dismiss','modal');
//             //                 console.log("put put")
//         });


    });
</script>