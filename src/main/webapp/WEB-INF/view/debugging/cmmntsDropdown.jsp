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
 	<button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton${comment.commentNo}" data-bs-toggle="dropdown" aria-expanded="false"></button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton${comment.commentNo}">
		<c:if test="${memVo.memNo == comment.memNo}">
			<li>
            	<a class="dropdown-item" href="#" onclick="updateComments(${comment.commentNo},'${comment.content}');">수정</a>
            </li>
             <li>
          		<a class="dropdown-item" href="#" onclick="commentDelete(${comment.commentNo});">삭제</a>
            </li>
		</c:if>
			<li>
				<a class="dropdown-item" href="#">댓글달기</a>
			</li>
	</ul>
</div>
</body>
</html>