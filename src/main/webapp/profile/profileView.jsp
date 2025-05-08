<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
 <meta charset="UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <title>프로필 페이지</title>
 <!-- Bootstrap CSS -->
 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
 <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/profile.css">
 
 <script>
 	function profileEdit() {
 		location.href = "profileEdit.do"
 	}
 </script>
</head>
<body>
    <div class="profile-container">
        <!-- 프로필 헤더 -->
        <div class="profile-header" style = "background-color : gray">
            <div class="profile-image">
                <img src="<%= request.getContextPath() %>/spongebob.png" alt="프로필 이미지">
            </div>
        </div>

        <!-- 닉네임과 설정 버튼 -->
        <div class="profile-details">
            <span class="nickIcon"></span><div class="profile-nickname">닉네임</div>
            <button type="button" onclick="profileEdit()" 
            		class="btn btn-outline-secondary profile-settings-btn">
                <i class="bi bi-gear"></i> 설정
            </button>
        </div>

        <!-- 소개 섹션 -->
        <div class="profile-section">
            <div class="section-title">소개</div>
            <div class="profile-description">
               	안녕하세요. 대덕인재개발원 학생입니다.
            </div>
        </div>

        <!-- 업적 섹션 -->
        <div class="profile-section">
            <div class="section-title">업적</div>
            <div class="profile-gallery">
                <div class="icon-item">
                    <i class="bi bi-award"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-trophy"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-lightbulb"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-star"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-gem"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-emoji-smile"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-shield-check"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-heart"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-heart"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-heart"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-heart"></i> <!-- Bootstrap 아이콘 -->
                </div>
                <div class="icon-item">
                    <i class="bi bi-heart"></i> <!-- Bootstrap 아이콘 -->
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
