<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 등록</title>
<style>
:root {
    --main-color: rgb(240, 134, 0);
    --main-rgb: 240, 134, 0;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f0f2f5;
    margin: 0;
    padding: 0;
}

h1 {
    color: var(--main-color);
    text-align: center;
    margin-top: 40px;
}

form {
    width: 60%;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

label {
    display: block;
    margin-top: 10px;
    font-weight: bold;
    color: #495057;
}

input, textarea, select {
    width: 100%;
    padding: 10px;
    margin-top: 5px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

button {
    margin-top: 20px;
    padding: 10px 20px;
    border: none;
    background-color: var(--main-color);
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: rgba(var(--main-rgb), 0.8);
}

#studyFields {
    display: none;
}

</style>

<script>
function toggleFields() {
    var boardType = document.getElementById('boardType').value;
    var studyFields = document.getElementById('studyFields');
    if (boardType === 'STUDYBOARD') {
        studyFields.style.display = 'block';
    } else {
        studyFields.style.display = 'none';
    }
}
</script>

</head>
<body>
    <h1>공지사항 등록</h1>
    <form action="noticeInsert.do" method="post">
        <label for="boardName">게시판 제목</label> 
        <input type="text" id="boardName" name="boardName" placeholder="게시판 제목을 입력하세요" required>
		
		<label for="boardContent">내용</label> 
        <textarea id="boardContent" name="boardContent" rows="6" placeholder="공지사항 내용을 입력하세요" required></textarea>
		
        <label for="boardType">게시판 유형</label> 
        <select id="boardType" name="boardType" required onchange="toggleFields()">
            <option value="NOTICE">공지사항</option>
            <option value="IMPORTANT">중요공지사항</option>
        </select>

        <label for="boardStatus">상태</label> 
        <select id="boardStatus" name="boardStatus" required>
            <option value="Y">활성</option>
            <option value="N">비활성</option>
        </select> 
        
        <label for="adminMemberNo">관리자 번호</label> 
        <input type="number" id="adminMemberNo" name="adminMemberNo" placeholder="관리자 번호를 입력하세요" required>


        <button type="submit">등록</button>    
    </form>
</body>
</html>
