// layout.js
$(document).ready(function() {
    // 반응형 사이드바 토글 기능
    function initializeResponsiveLayout() {
        const width = $(window).width();
        
        if (width <= 768) {
            $('.left-sidebar').addClass('sidebar-mobile');
            // 모바일에서 사이드바 토글 버튼 추가
            if (!$('.sidebar-toggle').length) {
                $('<button>')
                    .addClass('sidebar-toggle')
                    .html('<i class="fas fa-bars"></i>')
                    .appendTo('.header .container-fluid');
            }
        } else {
            $('.left-sidebar').removeClass('sidebar-mobile');
            $('.sidebar-toggle').remove();
        }
    }

    // 윈도우 리사이즈 이벤트
    $(window).on('resize', function() {
        initializeResponsiveLayout();
    });

    // 초기 레이아웃 설정
    initializeResponsiveLayout();

    // 사이드바 토글 이벤트
    $(document).on('click', '.sidebar-toggle', function() {
        $('.left-sidebar').toggleClass('active');
    });

    // 모바일에서 사이드바 외부 클릭시 닫기
    $(document).on('click', function(e) {
        if ($(window).width() <= 768) {
            if (!$(e.target).closest('.left-sidebar').length && 
                !$(e.target).closest('.sidebar-toggle').length) {
                $('.left-sidebar').removeClass('active');
            }
        }
    });
});