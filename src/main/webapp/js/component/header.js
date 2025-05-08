// components/header.js
$(document).ready(function() {
    // 검색 기능
    const $searchInput = $('.search-input');
    
    $searchInput.on('keypress', function(e) {
        if (e.which === 13) {
            const searchTerm = $(this).val().trim();
            if (searchTerm) {
                // TODO: 검색 API 호출
                console.log('Searching for:', searchTerm);
            }
        }
    });

    // 상점 아이콘 클릭
    $('#shopButton').on('click', function(e) {
        e.preventDefault();
        location.href = 'prodList.do';
        console.log('Shop button clicked');
    });

    // 알림 아이콘 클릭
    $('#notificationButton').on('click', function(e) {
        e.preventDefault();
        // TODO: 알림 목록 표시
        console.log('Notification button clicked');
    });

    // 드롭다운 메뉴 아이템 클릭
    $('.dropdown-item').on('click', function(e) {
        const action = $(this).attr('href');
        
        if (action === '/logout') {
            e.preventDefault();
            if (confirm('로그아웃 하시겠습니까?')) {
                // TODO: 로그아웃 처리
                console.log('Logging out...');
            }
        }
    });
});