<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>공지사항 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
:root {
    --main-color: rgb(240, 134, 0);
    --main-rgb: 240, 134, 0;
}

		.form-select {
            border-radius: 8px;
            background-color: #ffffff;
            color: #212529;
        }

        .form-select:focus {
            background-color: #ffffff;
            border-color: var(--main-color);
            box-shadow: 0 0 0 0.2rem rgba(var(--main-rgb), 0.25);
            outline: none;
        }

        .form-select option:hover {
            background-color: rgba(var(--main-rgb), 0.2);
            color: #212529;
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

.container {
    max-width: 600px;
    margin-top: 50px;
}

button {
    background-color: var(--main-color);
    border: none;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: rgba(var(--main-rgb), 0.8);
}

.btn-secondary {
    background-color: #6c757d;
    color: white;
    padding: 10px 20px;
    border-radius: 5px;
    text-decoration: none;
}

.btn-secondary:hover {
    background-color: #5a6268;
}
</style>
</head>
<body>
	<div class="container my-4">
		<h1 class="text-center mb-4">공지사항 수정</h1>
		<form action="noticeUpdate.do" method="post">
			<input type="hidden" name="boardNo" value="${notice.boardNo}" />
			<div class="mb-3">
				<label for="boardName" class="form-label">제목</label>
				<input type="text" class="form-control" id="boardName" name="boardName" value="${notice.boardName}" required>
			</div>
			<div class="mb-3">
				<label for="boardType" class="form-label">게시판 유형</label>
				<select class="form-control" id="boardType" name="boardType" required>
					<option value="NOTICE" ${notice.boardType == 'NOTICE' ? 'selected' : ''}>공지사항</option>
					<option value="EVENT" ${notice.boardType == 'EVENT' ? 'selected' : ''}>이벤트</option>
				</select>
			</div>
			<div class="mb-3">
				<label for="boardStatus" class="form-label">상태</label>
				<select class="form-control" id="boardStatus" name="boardStatus" required>
					<option value="Y" ${notice.boardStatus == 'ACTIVE' ? 'selected' : ''}>활성</option>
					<option value="N" ${notice.boardStatus == 'INACTIVE' ? 'selected' : ''}>비활성</option>
				</select>
			</div>
			<div class="d-flex justify-content-between">
				<a href="noticeDetail.do?boardNo=${notice.boardNo}" class="btn btn-secondary">취소</a>
				<button type="submit" class="btn btn-primary">저장</button>
			</div>
		</form>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
