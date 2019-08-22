//jQuery(function ($) {
//    $("body").css("display", "none");
//    $("body").fadeIn(1000);
//    $("a.transition").click(function (event) {
//        event.preventDefault();
//        linkLocation = this.href;
//        $("body").fadeOut(1000, redirectPage);
//    });
//    function redirectPage() {
//        window.location = linkLocation;
//    }
//});
function forMainBoard(ob){
	 for (var i = 0; i < ob.length; i++) {
         $('#top').append('<div class="card-deck" id="middle' + i + '"></div><br><br>')
         
         for (var j = 0; j < ob[0].length; j++) {
             if (ob[i][j]) {

                 $('#middle' + i).append(
                     '<div class="card zoom text-center">'
                     + '<div class="card-img-top card-img-top-250" id=""">'
                     + '<a href="sur.do?s_num='+ ob[i][j].s_num +'&s_tp_num='+ ob[i][j].s_tp_num +'" class="fancybox" rel="ligthbox"> '
                     + '<img id="boardimg' + i + j + '" src="" class="img-fluid " alt="">'
                     + '</a></div>'
                     + '<div class="card-block p-t-2">'
                     //+ '<h6 class="small text-wide p-b-2">[' + i + ' , ' + j + ']</h6>'
                     + '<h2><a id="cardExp" href="sur.do?s_num='+ ob[i][j].s_num +'&s_tp_num='+ ob[i][j].s_tp_num +'">'
                     + ob[i][j].subject // + '<br>설문번호 :' + ob[i][j].s_num
                     + '<br>획득가능포인트 : ' + ob[i][j].point + '<br>참여자수 : ' + ob[i][j].partnum
                     + '<br>조회수 : ' + ob[i][j].hits + '<br>작성일시 : ' + getFormatDate(new Date(ob[i][j].s_date))
                     + '</a></h2>'
                     + '</div></div>');
                 if (!ob[i][j].thumb_path) {
                     $("#boardimg" + i + j).attr(
                         "src",
                         "/DotNet/defaultImg/default.jpg");
                 } else {
                     $("#boardimg" + i + j).attr(
                         "src",
                         "/DotNet/save/"
                         + ob[i][j].thumb_path);
                 }
             } else {
                 $('#middle' + i).append(
                     '<div class="card" style="border: 0px"></div>');
             }
         }
     }
}
// 정렬
$(document).ready(
    function () {
    	var b_tp = $("input[name=b_tp_num]").attr("value");
//    	alert("b_tp : " + b_tp);
        $("select#align").on('focus change ',
            function () {
                var data = {
                    "align": $(this).val(),
                    "b_tp" : b_tp
                };
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    data: data,
                    url: "a.do",
                    success: function (data) {
                        var ob = data.arr;
                        
                        $('#top').children().remove();
                        forMainBoard(ob);
                    }
                });
            });
    });



$(document).ready(function () {
    $('select#align').focus();
    setTimeout(function() {
        $('html, body').animate({
            scrollTop : 0
        }, 500);
        return false;
    },500);
});
    

//검색
$(document).ready(function () {
	var b_tp = $("input[name=b_tp_num]").attr("value");
    $("#searchButton").on('click',
        function () {
            var data = { 
            	"search": $("#searchInput").val(),
            	"b_tp" : b_tp
            };
            $.ajax({
                type: "POST",
                dataType: "json",
                data: data,
                url: "search.do",
                success: function (data) {
                    var ob = data.arr;
                    if(!ob[0][0]){
                    	$("#no_search").show("slow");
//                    	$("#no_search").toggle("slow");
//                    	alert("검색 결과가 없습니다.")
//                    	$('#top').append('<div class="container"><img src="/DotNetEx/save/default.jpg"><h2>검색 결과가 없네용!!!</h2></div>');
                    	return false;
                    }else{
                    	$("#no_search").hide("slow");

                    	$('#top').children().remove();
                    	forMainBoard(ob);
                    }
                },
                error: function (e) {
                    alert(e + "error");
                }
            });
        });
});
function getFormatDate(date){ var year = date.getFullYear();    //yyyy
var month = (1 + date.getMonth());    //M
month = month >= 10 ? month : '0' + month;    //month 두자리로 저장
var day = date.getDate();    //d
day = day >= 10 ? day : '0' + day;    //day 두자리로 저장
return year + '-' + month + '-' + day; }
