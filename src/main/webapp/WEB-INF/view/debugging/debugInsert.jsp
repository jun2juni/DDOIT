<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="debugInsert.do" id="write">
		<div>
			<label for="subject">제목 : </label><input type="text" id="postName" name="postName">
		</div>
		<div>
			<label for="content">내용 : </label><textarea id="content" name="content" rows="6" cols="22"></textarea>
		</div>
		<button id="send" type="submit">작성완료</button>
	</form>
</body>
</html>