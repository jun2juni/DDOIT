<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="<%=request.getContextPath()%>/js/jquery-3.7.1.js"></script>
<title>프로필 페이지</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/pages/profile.css">

<script>
// 설정버튼 눌렀을 때 작동
function profileEdit() {
	    $(function () {
	    	// 닉네임, 소개 설정 가능
	        const $editNick = $('#editNick');
	        const $editIntro = $('#editIntro');
	        const $settingsBtn = $('.profile-settings-btn');

	        // 수정 가능 상태 활성화
	        $editNick.attr('contenteditable', 'true');
	        $editIntro.attr('contenteditable', 'true');

	        // 버튼 '완료' 변경 및 '취소' 버튼 추가
	        $settingsBtn.text('완료').off('click').on('click', profileSave).addClass('profile-button');
	        if ($('#cancelBtn').length === 0) {
	            $settingsBtn.after('<button id="cancelBtn" type="button" class="btn btn-outline-secondary profile-button">취소</button>');
	            $('#cancelBtn').on('click', profileCancel);
	        }

	        // 글자 수 제한 // 소개
	        $editIntro.on('input', function () {
	            let text = $(this).text();
	            if (text.length > 50) {
	                $(this).text(text.substring(0, 50));
	                alert('50자 내외로 입력하세요.');
	            }
	        });

	        // 글자 수 제한 // 닉네임
	        $editNick.on('input', function () {
	            let text = $(this).text();
	            if (text.length > 10) {
	                $(this).text(text.substring(0, 10));
	                alert('10자 내외로 입력하세요.');
	            }
	        });
	    });
	}

// 완료버튼 눌렀을 때 작동
function profileSave() {
    const nickname = $('#editNick').text().trim(); // 공백 제거
    const introduction = $('#editIntro').text().trim(); // 공백 제거

    $.ajax({
        type: 'POST',
        url: `<%=request.getContextPath()%>
	/profileEdit.do`,
			data : {
				nickname : nickname,
				introduction : introduction
			},
			success : function(response) {
				alert('프로필이 수정되었습니다.');
				profileCancel(); // 수정 종료
			},
			error : function() {
				alert('수정 중 오류가 발생했습니다.');
			}
		});
	}

	// 취소버튼 눌렀을 때 작동
	function profileCancel() {
		// 닉네임, 소개 수정 불가
		$('#editNick').attr('contenteditable', 'false').off('input');
		$('#editIntro').attr('contenteditable', 'false').off('input');
		$('.profile-settings-btn').text('설정').off('click').on('click',
				profileEdit);
		$('#cancelBtn').remove();
	}
</script>
<style>
[contenteditable="true"] {
	border: 1px solid black;
}
</style>
</head>
<body>
	<div class="profile-container">
		<!-- 프로필 헤더 -->
		<div class="profile-header"
			style="background-image: url('<%= request.getContextPath() %>${profile.backgroundImage}')">
			<div class="profile-image">
				<img src="<%=request.getContextPath()%>/spongebob.png" alt="프로필 이미지">
				 <input type="file" id="uploadProfileImage" style="display: none;" accept="image/*">
			</div>
		</div>

		<!-- 닉네임과 설정 버튼 -->
		<div class="profile-details">
			<span class="nickIcon"></span>
			<div id="editNick" class="profile-nickname">${member.memNickname}</div>
			<button type="button" onclick="profileEdit()"
				class="btn btn-outline-secondary profile-settings-btn">
				<i class="bi bi-gear"></i>설정
			</button>
		</div>

		<!-- 소개 섹션 -->
		<div class="profile-section">
			<div class="section-title">소개</div>
			<div id="editIntro" class="profile-description">${profile.introduction}</div>
		</div>

		<!-- 업적 섹션 -->
		<div class="profile-section">
			<div class="section-title">업적</div>
			<div class="profile-gallery">
				<div class="icon-item">
					<i class="bi bi-award"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-trophy"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-lightbulb"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-star"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-gem"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-emoji-smile"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-shield-check"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-heart"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-heart"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-heart"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-heart"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
				<div class="icon-item">
					<i class="bi bi-heart"></i>
					<!-- Bootstrap 아이콘 -->
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->    
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>