// components/sidebar.js
$(document).ready(function() {
	
	const contextPath = window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
	
	
	// 네비게이션 활성화
	function setActiveNav() {
		const currentPath = window.location.pathname;
		$('.nav-link').removeClass('active');
		$(`.nav-link[href="${currentPath}"]`).addClass('active');
	}

	// 초기 네비게이션 활성화
	setActiveNav();

	// 네비게이션 클릭 이벤트
	$('.nav-link').on('click', function(e) {
//		e.preventDefault(); // 기본 링크 동작 방지

		$('.nav-link').removeClass('active');
		$(this).addClass('active');

		const targetUrl = $(this).attr('href');

		// AJAX로 컨텐츠 로딩
		$.ajax({
			url: targetUrl,
			type: 'GET',
			success: function(response) {
				$('.main-content').html(response);
				// URL 히스토리 업데이트
				history.pushState(null, null, targetUrl);
			},
			error: function(xhr, status, error) {
				console.error('페이지 로딩 실패:', error);
			}
		});
	});
	// 디버그 연결
	$('#dbgPostButton').on('click', function(e) {
		e.preventDefault();

		$.ajax({
			url: contextPath + "/debugList.do",
			type: 'GET',
			success: function(response) {
				$('.main-content').html('<div class="content-wrapper">' + response + '</div>');
				history.pushState(null, null, contextPath+ '/debugList.do');
			},
			error: function(xhr, status, error) {
				console.error('디버그 게시판 로딩 실패:', error);
			}
		});
	});

	// 플래너 연결
	$('#plannerButton').on('click', function(e) {
		e.preventDefault();

		$.ajax({
			url: contextPath + "/planner.do",
			type: 'GET',
			success: function(response) {
				$('.main-content').html('<div class="content-wrapper">' + response + '</div>');
				history.pushState(null, null,  contextPath + "/planner.do");
			},
			error: function(xhr, status, error) {
				console.error('플래너 로딩 실패:', error);
			}
		});
	});

	// 브라우저 뒤로가기/앞으로가기 처리
	$(window).on('popstate', function() {
		const currentUrl = window.location.pathname;

		$.ajax({
			url: currentUrl,
			type: 'GET',
			success: function(response) {
				$('.main-content').html(response);
				setActiveNav();
			}
		});
	});
});