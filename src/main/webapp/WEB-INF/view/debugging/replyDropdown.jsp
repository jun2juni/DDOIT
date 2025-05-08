<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="dropdown">
	<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"></button>
	<ul class="dropdown-menu">
		<c:if test="${memVo.memNo == reply.memNo}">
			<li><a class="dropdown-item" href="#">수정</a></li>
			<li><a class="dropdown-item" href="#" onclick="postDelete('reply', ${reply.replyNo})">삭제</a></li>
		</c:if>
		<c:if test="${memVo.memNo == postVo.memNo}">
			<li><a class="dropdown-item" href="#">채택</a></li>
		</c:if>
			<li><a class="dropdown-item" href="#">신고하기</a></li>
	</ul>
</div>

</body>
</html>