<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>학습자료 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        :root {
            --main-color: rgb(240, 134, 0);
            --main-rgb: 240, 134, 0;
        }

        body {
            background-color: #f0f2f5;
            font-family: 'Noto Sans KR', sans-serif;
            margin: 0;
            padding: 0;
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

        .page-title {
            color: var(--main-color);
            font-weight: 700;
            margin-bottom: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .table {
            margin-bottom: 0;
        }

        .table th {
            background-color: #f8f9fa;
            color: #495057;
            font-weight: 600;
            border-bottom: 2px solid #dee2e6;
        }

        .table td {
            vertical-align: middle;
        }

        .btn-main {
            background-color: var(--main-color);
            color: white;
            padding: 8px 24px;
            border-radius: 5px;
            border: none;
            transition: all 0.3s ease;
        }

        .btn-main:hover {
            background-color: rgba(var(--main-rgb), 0.8);
            color: white;
        }

        .badge {
            padding: 6px 12px;
            font-weight: 500;
        }

        .badge-active {
            background-color: #198754;
        }

        .badge-inactive {
            background-color: #dc3545;
        }

        .board-type {
            background-color: #f1f3f5;
            color: #495057;
            padding: 5px 10px;
            border-radius: 4px;
            font-size: 0.9rem;
        }

        .action-buttons {
            display: flex;
            gap: 8px;
            justify-content: center;
        }

        .btn-action {
            padding: 4px 12px;
            font-size: 0.9rem;
            border-radius: 4px;
            text-decoration: none;
            transition: all 0.2s ease;
        }

        .btn-view {
            background-color: #e9ecef;
            color: #495057;
        }

        .btn-edit {
            background-color: #0d6efd;
            color: white;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
        }

        .btn-action:hover {
            opacity: 0.8;
            color: white;
        }

        .empty-message {
            text-align: center;
            padding: 40px;
            color: #6c757d;
            font-size: 1.1rem;
        }

        .create-button-container {
            margin-top: 20px;
            text-align: center;
            padding: 0 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">
            <h2 class="page-title">
                <i class="fas fa-book-open"></i>
                학습자료 목록
            </h2>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center" width="10%">번호</th>
                            <th width="35%">제목</th>
                            <th class="text-center" width="15%">유형</th>
                            <th class="text-center" width="15%">작성일</th>
                            <th class="text-center" width="10%">상태</th>
                            <th class="text-center" width="15%">관리</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="studyBoard" items="${studyBoardList}">
                            <tr>
                                <td class="text-center">${studyBoard.boardNo}</td>
                                <td>
                                    <a href="studyBoardDetail.do?boardNo=${studyBoard.boardNo}" 
                                       class="text-decoration-none text-dark hover-primary">
                                        ${studyBoard.boardName}
                                    </a>
                                </td>
                                <td class="text-center">
                                    <span class="board-type">${studyBoard.boardType}</span>
                                </td>
                                <td class="text-center">
                                    <span class="badge ${studyBoard.boardStatus == 'Y' ? 'badge-active' : 'badge-inactive'}">
                                        ${studyBoard.boardStatus == 'Y' ? '활성' : '비활성'}
                                    </span>
                                </td>
                                <td>
                                    <div class="action-buttons">
                                        <a href="studyBoardDetail.do?boardNo=${studyBoard.boardNo}" 
                                           class="btn-action btn-view">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="studyBoardUpdate.do?boardNo=${studyBoard.boardNo}" 
                                           class="btn-action btn-edit">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <a href="#" onclick="deleteBoard(${studyBoard.boardNo}); return false;" 
                                           class="btn-action btn-delete">
                                            <i class="fas fa-trash"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                        <c:if test="${empty studyBoardList}">
                            <tr>
                                <td colspan="6" class="empty-message">
                                    <i class="fas fa-info-circle me-2"></i>등록된 학습자료가 없습니다.
                                </td>
                            </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    
    <div class="create-button-container">
        <a href="studyBoardInsert.do" class="btn btn-main">
            <i class="fas fa-plus me-2"></i>자료 등록
        </a>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function deleteBoard(boardNo) {
        if (confirm('정말 삭제하시겠습니까?')) {
            location.href = 'studyBoardDelete.do?boardNo=' + boardNo;
        }
    }
</script>
</body>
</html>