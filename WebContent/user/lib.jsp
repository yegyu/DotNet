<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 사이드바  1-1 start-->
<jsp:include page="../mypage.do"/>
<main class="page-content">
<div class="container-fluid">
	<div class="card col-md-10">
		<h2 class="mt-3">내 최근 참여 설문</h2>
		<hr>
		<h5>내 설문관리 > 내 최근 참여 설문</h5>
		<hr>
		<!-- 사이드바  1-1 end -->
		<table class="table">
			<c:forEach var="l" items="${lib}">
				<tr>
					<td style="width: 100px"><a><img
							src="save/${l.thumb_path }" class="mylibimg"
							name="${l.s_tp_num }" id="${l.s_num }"
							style="height: 100px; width: 100px"></a></td>
					<td style="width:">${l.s_num}:${l.subject}</td>
					<td style="width:">획득 가능 포인트 : ${l.point}</td>
					<td>타입 : ${l.s_tp_num }</td>
				</tr>
			</c:forEach>
		</table>
		<!-- 사이드바 2-2 start --> 
	</div>
</div>
</main>
<!-- 사이드바 2-2 end --> 
<!-- 컨텐트 end -->
<script type="text/javascript">
	$(document).ready(function() {
		$("img[src='save/']").attr("src", "/DotNet/defaultImg/default.jpg");
	});

	$(document)
			.ready(
					function() {
						$('.mylibimg')
								.on(
										'click',
										function() {
											var url;
											console.log($(this).prop('name'))
											switch ($(this).prop('name')) {
											case "2":
												url = "surveyResultView.do?s_num="
														+ $(this).prop('id');
												break;
											case "5":
												url = "fivePartDetail.do?s_num="
														+ $(this).prop('id');
												break;
											case "8":
												url = "eightPartDetail.do?s_num="
														+ $(this).prop('id');
												break;
											}
											console.log(url);
											window
													.open(url, '결과 테이블',
															"width=880, height=760, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
										});
					});
</script>
</body>
<!-- mypage.do의 body end -->
</html>
<!-- mypage.do의 html end -->