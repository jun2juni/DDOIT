<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 목록</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <!-- 공통 스타일 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/chat.css">
</head>
<body>
    <div class="container">
        <div class="card p-4">
            <h1 class="page-title text-center">
                <i class="fas fa-clipboard-list me-2"></i>공지사항 목록
            </h1>

            <div class="row mb-4">
                <div class="col-md-6">
                    <form action="noticeList.do" method="get">
                        <div class="input-group">
                            <label class="input-group-text" for="boardType">
                                <i class="fas fa-filter me-2"></i>게시판 유형
                            </label>
                            <select id="boardType" name="boardType" class="form-select" onchange="this.form.submit()">
                                <option value="">전체</option>
                                <option value="NOTICE" ${param.boardType == 'NOTICE' ? 'selected' : ''}>공지사항</option>
                                <option value="IMPORTANT" ${param.boardType == 'IMPORTANT' ? 'selected' : ''}>중요공지사항</option>
                            </select>
                        </div>
                    </form>
                </div>
                <div class="col-md-6 text-md-end">
                    <a href="#" class="btn btn-admin me-2" onclick="toggleAdminMode()">
                        <i class="fas fa-cog me-2"></i>게시판 관리
                    </a>
                    <a href="noticeInsert.do" class="btn btn-success">
                        <i class="fas fa-plus me-2"></i>게시판 작성
                    </a>
                </div>
            </div>

            <div id="adminTools" class="mb-3" style="display: none;">
                <button class="btn btn-danger" onclick="deleteSelectedPosts()">
                    <i class="fas fa-trash me-2"></i>선택 삭제
                </button>
            </div>

            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th class="text-center admin-only" style="display: none;" width="5%">
                                <input type="checkbox" id="selectAll" class="board-checkbox" onclick="toggleAllCheckboxes()">
                            </th>
                            <th class="text-center" width="15%">번호</th>
                            <th class="text-center" width="20%">게시판 타입</th>
                            <th width="45%">제목</th>
                            <th class="text-center" width="20%">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="notice" items="${noticeList}">
                            <tr>
                                <td class="text-center admin-only" style="display: none;">
                                    <input type="checkbox" name="selectedPosts" value="${notice.boardNo}" class="board-checkbox">
                                </td>
                                <td class="text-center">${notice.boardNo}</td>
                                <td class="text-center">
                                    <span class="badge bg-secondary">${notice.boardType}</span>
                                </td>
                                <td>
                                    <a href="noticeDetail.do?boardNo=${notice.boardNo}" class="board-link">
                                        ${notice.boardName}
                                    </a>
                                </td>
                                <td class="text-center">${notice.createdDate}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script>
        let isAdminMode = false;

        function toggleAdminMode() {
            isAdminMode =! isAdminMode;
            const adminTools = document.getElementById('adminTools');
            const adminOnlyElements = document.querySelectorAll('.admin-only');
            adminTools.style.display = isAdminMode ? 'block' : 'none';
            adminOnlyElements.forEach(element => {
                element.style.display = isAdminMode ? 'table-cell' : 'none';
            });
        }

        function toggleAllCheckboxes() {
            const mainCheckbox = document.getElementById('selectAll');
            const checkboxes = document.getElementsByName('selectedPosts');
            checkboxes.forEach(checkbox => checkbox.checked = mainCheckbox.checked);
        }

        function deleteSelectedPosts() {
            const selectedPosts = Array.from(document.getElementsByName('selectedPosts')).filter(cb => cb.checked).map(cb => cb.value);
            if (selectedPosts.length === 0) {
                alert('삭제할 게시물을 선택해주세요.');
                return;
            }
            if (confirm('선택한 게시물을 삭제하시겠습니까?')) {
                const form = document.createElement('form');
                form.method = 'POST';
                form.action = 'noticeDelete.do';
                selectedPosts.forEach(boardNo => {
                    const input = document.createElement('input');
                    input.type = 'hidden';
                    input.name = 'boardNo';
                    input.value = boardNo;
                    form.appendChild(input);
                });
                document.body.appendChild(form);
                form.submit();
            }
        }
    </script>
</body>
</html>
