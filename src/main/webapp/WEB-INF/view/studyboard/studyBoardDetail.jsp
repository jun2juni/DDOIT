<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학습자료 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
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
            padding: 1.5rem;
        }

        .card-title {
            color: var(--main-color);
            font-weight: 700;
            margin-bottom: 0;
        }

        .board-info {
            color: #6c757d;
            font-size: 0.9rem;
        }

        .card-body {
            padding: 2rem;
        }

        .content-area {
            min-height: 300px;
            background-color: #f8f9fa;
            padding: 1.5rem;
            border-radius: 10px;
            margin-bottom: 2rem;
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
            <h3 class="card-title">${studyBoard.boardName}</h3>
            <div class="board-info mt-2">
                <span>유형: ${studyBoard.boardType}</span> |
                <span>작성일: ${studyBoard.createdDate}</span> |
                <span>상태: ${studyBoard.boardStatus == 'Y' ? '활성' : '비활성'}</span>
            </div>
        </div>
        <div class="card-body">
            <div class="content-area">
                <%--  ${studyBoard.boardContent}  --%>
                <table>
                <tr>
                <td>게시글 내용: ${studyBoard.boardContrnt}</td>
                </tr>
                </table>
                
            </div>
            
            

           <%--  <c:if test="${not empty studyBoard.files}">
                <h5 class="mb-3">첨부파일</h5>
                <div class="file-list mb-4">
                    <c:forEach var="file" items="${studyBoard.files}">
                        <div class="file-item">
                            <i class="fas fa-file me-2"></i>
                            <a href="download.do?fileNo=${file.fileNo}">${file.originalFileName}</a>
                        </div>
                    </c:forEach>
                </div>
            </c:if> --%>

            <div class="text-center">
                <a href="studyBoardList.do" class="btn btn-outline me-2">목록</a>
                <a href="studyBoardUpdate.do?boardNo=${studyBoard.boardNo}" class="btn btn-main me-2">수정</a>
                <button type="button" class="btn btn-danger" 
                        onclick="if(confirm('정말 삭제하시겠습니까?')) location.href='studyBoardDelete.do?boardNo=${studyBoard.boardNo}'">
                    삭제
                </button>
            </div>
        </div>
 	</div>
 </div>
 	


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>