$(document).ready(function() {
	// 현재 페이지에 해당하는 메뉴 활성화
	const currentPath = window.location.pathname;
	$('.nav-link').removeClass('active');
	$(`.nav-link[href="${currentPath}"]`).addClass('active');

	// 메뉴 클릭 시 AJAX로 컨텐츠 로드
	$('.nav-link').on('click', function(e) {
		e.preventDefault();
		const href = $(this).attr('href');
		loadContent(href);

		$('.nav-link').removeClass('active');
		$(this).addClass('active');
		history.pushState({ url: href }, '', href);
	});

	// 새로고침, 직접 URL 입력 시 처리
	if (currentPath !== '/DdoIt/index.do') {
		loadContent(currentPath);
	}

	// 브라우저 뒤로가기/앞으로가기 처리
	$(window).on('popstate', function(event) {
		if (event.originalEvent.state) {
			loadContent(location.pathname);
			$('.nav-link').removeClass('active');
			$(`.nav-link[href="${location.pathname}"]`).addClass('active');
		}
	});

	function loadContent(url) {
		$.ajax({
			url: url,
			type: 'GET',
			success: function(response) {
				$('.main-content').html(response);
			},
			error: function(xhr, status, error) {
				console.error('페이지 로드 실패:', error);
			}
		});
	}
});