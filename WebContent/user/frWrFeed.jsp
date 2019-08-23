<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="/DotNet/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.7.2/animate.min.css">
    <title>Insert title here</title>
</head>

<body>
    <jsp:include page="../mypage.do" />
    <div class="page-content">
        <div class="container-fluid">
		<div class="card col-md-12">
            <h1 class="my-4 font-weight-bold"> - 친구들의 댓글들</h1>
            <hr>
            <div class="grid">
                <div class="grid-sizer col-md-3"></div>

                <c:forEach items="${getReply }" var="get">
                    <c:if test="${fn:length(get.reply)  lt 30 }">
                        <div class="grid-item col-md-3 mb-4">
                            <div class="card">
                                <div class="card-body">
                                    <h5 class="card-title">${get.id } </h5>
                                    <p class="card-text">${get.reply }</p>
                                    <footer class="footer">
                                    <i class="far fa-thumbs-up good">${get.good }</i>&nbsp;<i class="far fa-thumbs-down bad"> ${get.bad }</i>
                                    </footer>
                                    <a class="card-link" href="askContent.do?num=${get.num }">해당 질문으로 gogo </a><br> 댓글  번호 : ${get.rnum }
                                </div>
                            </div>
                        </div>
                    </c:if>

                    <c:if test="${fn:length(get.reply)  ge 30 }">
                        <div class="grid-item col-md-5 mb-4">
                            <div class="card">
                                <div class="card-header">
                                    ${get.id }
                                </div>
                                <div class="card-body">
                                        <p>${get.reply }</p>
                                        <footer class="footer">
                                            <i class="far fa-thumbs-up good">${get.good }</i>&nbsp;<i
                                                class="far fa-thumbs-down bad"> ${get.bad }</i>
                                        </footer>
                                    <a class="card-link" href="askContent.do?num=${get.num }">해당 질문으로 gogo </a>
                                    <br> 댓글  번호 : ${get.rnum }
                                </div>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>



            </div>
        </div>
        </div>
    </div>
    <script type="text/javascript" src="/DotNet/js/jquery-3.4.1.js"></script>
    <script type="text/javascript" src="/DotNet/js/bootstrap.bundle.js"></script>
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.js"></script>
    <script>
        $('.grid').masonry({
            itemSelector: '.grid-item',
            columnWidth: '.grid-sizer',
            percentPosition: true
        });
    </script>
</body>

</html>