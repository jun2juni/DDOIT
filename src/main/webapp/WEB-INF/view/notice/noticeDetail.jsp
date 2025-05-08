<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 상세보기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        :root {
            --main-color: rgb(240, 134, 0);
            --main-rgb: 240, 134, 0;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
        }

        .card {
            border-radius: 15px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            background-color: white;
        }

        .card-header {
            background-color: var(--main-color);
            color: white;
        }

        .btn-secondary {
            background-color: #6c757d;
            border-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
            border-color: #545b62;
        }

        .btn-warning {
            background-color: var(--main-color);
            border-color: var(--main-color);
        }

        .btn-warning:hover {
            background-color: rgba(var(--main-rgb), 0.8);
            border-color: rgba(var(--main-rgb), 0.8);
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
        }
    </style>
</head>
<body>
    <!-- 삭제를 위한 숨겨진 폼 추가 -->
    <form id="deleteForm" action="noticeDelete.do" method="POST">
        <input type="hidden" name="boardNo" value="${notice.boardNo}">
    </form>

    <div class="card">
        <div class="card-header">
            <strong>${notice.boardName}</strong>
        </div>
        <div class="card-body">
            <table class="table table-bordered">
                <tr>
                    <th>작성자</th>
                    <td>${notice.adminMemberNo}</td>
                </tr>
                <tr>
                    <th>작성일</th>
                    <td>${notice.createdDate}</td>
                </tr>
                <tr>
                    <th>게시글 내용</th>
                    <td>${notice.boardContrnt}</td>
                </tr>
                <tr>
                    <th>게시판 유형</th>
                    <td>${notice.boardType}</td>
                </tr>
                <tr>
                    <th>상태</th>
                    <td>${notice.boardStatus}</td>
                </tr>
            </table>
            <div class="d-flex justify-content-between">
                <a href="noticeList.do" class="btn btn-secondary">뒤로가기</a>
                <div>
                    <a href="noticeUpdate.do?boardNo=${notice.boardNo}" class="btn btn-warning me-2">수정</a>
                    <a href="javascript:void(0);" onclick="confirmDelete()" class="btn btn-danger">삭제</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function confirmDelete() {
            if(confirm('정말 삭제하시겠습니까?')) {
                document.getElementById('deleteForm').submit();
            }
        }
    </script>
</body>
</html>
