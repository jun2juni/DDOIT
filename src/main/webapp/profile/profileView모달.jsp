<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>프로필 모달</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .profile-image {
            position: relative;
            display: inline-block;
        }

        .profile-image img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            border: 2px solid #ddd;
        }

        .profile-status {
            position: absolute;
            bottom: 5px;
            right: 10px;
            width: 20px;
            height: 20px;
            background-color: red;
            border-radius: 50%;
            border: 2px solid #fff;
        }

        .profile-nickname {
            font-size: 1.5rem;
            font-weight: bold;
            margin-top: 10px;
        }

        .profile-section-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin: 20px 0 10px;
        }

        .profile-description {
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            background-color: #f8f9fa;
            font-size: 1rem;
        }

        .profile-gallery {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 10px;
            margin-top: 10px;
        }

        .profile-gallery img {
            width: 100%;
            height: 80px;
            object-fit: cover;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <!-- 프로필 버튼 -->
        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#profileModal">
            프로필 보기
        </button>
    </div>

    <!-- 모달 -->
    <div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="profileModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- 모달 헤더 -->
                <div class="modal-header">
                    <h5 class="modal-title" id="profileModalLabel">프로필</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <!-- 모달 바디 -->
                <div class="modal-body">
                    <!-- 프로필 헤더 -->
                    <div class="profile-header">
                        <div class="profile-image">
                            <img src="https://via.placeholder.com/120" alt="프로필 이미지">
                            <div class="profile-status"></div>
                        </div>
                        <div class="profile-nickname">닉네임</div>
                        <button type="button" class="btn btn-light">
                            <i class="bi bi-gear"></i> <!-- 기어 아이콘 -->
                        </button>
                    </div>

                    <!-- 소개 섹션 -->
                    <div class="profile-section">
                        <div class="profile-section-title">소개</div>
                        <div class="profile-description">
                            안녕하세요. 대덕인재개발원 학생입니다.
                        </div>
                    </div>

                    <!-- 업적 섹션 -->
                    <div class="profile-section">
                        <div class="profile-section-title">업적</div>
                        <div class="profile-gallery">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                            <img src="https://via.placeholder.com/80" alt="업적 이미지">
                        </div>
                    </div>
                </div>
                <!-- 모달 푸터 -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                    <button type="button" class="btn btn-primary">수정</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
