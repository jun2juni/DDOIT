<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학습자료 수정</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
    <style>
        :root {
            --main-color: rgb(240, 134, 0);
            --main-rgb: 240, 134, 0;
        }

        body {
            background-color: #f0f2f5;
            font-family: 'Noto Sans KR', sans-serif;
        }

        .container {
            margin-top: 60px;
            margin-bottom: 60px;
        }

        .card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }

        .card-header {
            background-color: white;
            border-bottom: 1px solid rgba(0, 0, 0, 0.125);
            border-radius: 15px 15px 0 0 !important;
        }

        .card-title {
            color: var(--main-color);
            font-weight: 700;
        }

        .form-label {
            color: #495057;
            font-weight: 500;
        }

        .form-control:focus {
            border-color: var(--main-color);
            box-shadow: 0 0 0 0.2rem rgba(var(--main-rgb), 0.25);
        }

        .btn-main {
            background-color: var(--main-color);
            color: white;
            padding: 8px 24px;
            border-radius: 5px;
            border: none;
        }

        .btn-main:hover {
            background-color: rgba(var(--main-rgb), 0.8);
            color: white;
        }

        .btn-outline {
            color: var(--main-color);
            border: 1px solid var(--main-color);
            padding: 8px 24px;
            border-radius: 5px;
        }

        .btn-outline:hover {
            background-color: var(--main-color);
            color: white;
        }

        .file-item {
            background-color: #f8f9fa;
            padding: 10px;
            border-radius: 5px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h3 class="card-title">학습자료 수정</h3>
        </div>
        <div class="card-body">
            <form action="studyBoardUpdate.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="boardNo" value="${studyBoard.boardNo}">
                
                <div class="mb-3">
                    <label for="boardName" class="form-label">제목</label>
                    <input type="text" class="form-control" id="boardName" name="boardName" 
                           value="${studyBoard.boardName}" required>
                </div>

                <div class="mb-3">
                    <label for="boardType" class="form-label">게시판 유형</label>
                    <select class="form-select" id="boardType" name="boardType" required>
                        <option value="studyBoard" ${studyBoard.boardType == 'studyBoard' ? 'selected' : ''}>학습자료공유실</option>
                    </select>
                </div>

                <div class="mb-3">
                    <label for="boardContent" class="form-label">내용</label>
                    <textarea class="form-control" id="boardContent" name="boardContent" 
                              rows="10" required>${studyBoard.boardContent}</textarea>
                </div>

                <div class="mb-3">
                    <label for="boardStatus" class="form-label">상태</label>
                    <select class="form-select" id="boardStatus" name="boardStatus">
                        <option value="Y" ${studyBoard.boardStatus == 'Y' ? 'selected' : ''}>활성</option>
                        <option value="N" ${studyBoard.boardStatus == 'N' ? 'selected' : ''}>비활성</option>
                    </select>
                </div>

                <div class="mb-4">
                    <label class="form-label">현재 첨부파일</label>
                    <c:forEach var="file" items="${studyBoard.files}">
                        <div class="file-item d-flex justify-content-between align-items-center">
                            <span>${file.originalFileName}</span>
                            <button type="button" class="btn btn-sm btn-danger" 
                                    onclick="deleteFile(${file.fileNo})">삭제</button>
                        </div>
                    </c:forEach>
                </div>

                <div class="mb-4">
                    <label for="files" class="form-label">새 첨부파일</label>
                    <input type="file" class="form-control" id="files" name="files" multiple>
                </div>

                <div class="text-center">
                    <a href="studyBoardList.do" class="btn btn-outline me-2">취소</a>
                    <button type="submit" class="btn btn-main">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
    function deleteFile(fileNo) {
        if(confirm('파일을 삭제하시겠습니까?')) {
            // AJAX로 파일 삭제 처리
            fetch('deleteFile.do?fileNo=' + fileNo)
                .then(response => response.json())
                .then(data => {
                    if(data.success) {
                        // 성공 시 해당 파일 항목 제거
                        const fileItem = event.target.closest('.file-item');
                        fileItem.remove();
                    } else {
                        alert('파일 삭제에 실패했습니다.');
                    }
                });
        }
    }

    $(document).ready(function() {
        $('#boardContent').summernote({
            height: 300,
            minHeight: null,
            maxHeight: null,
            focus: true
        });
    });
</script>
</body>
</html>