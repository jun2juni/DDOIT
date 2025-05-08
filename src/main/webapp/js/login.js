$(document).ready(function() {
    $('#loginForm').submit(function(e) {
        e.preventDefault();
        
        // 로그인 처리 로직
        const username = $(this).find('input[type="text"]').val();
        const password = $(this).find('input[type="password"]').val();
        
        // TODO: 서버로 로그인 요청 보내기
        // 성공 시 메인 페이지로 이동
        window.location.href = '/daily.html';
    });
});