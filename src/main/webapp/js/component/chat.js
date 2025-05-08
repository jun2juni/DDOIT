// components/chat.js
$(document).ready(function() {
    // WebSocket 연결 (예시)
    const chatSocket = new WebSocket('ws://your-websocket-server-url');
    const $chatMessages = $('.chat-messages');
    const $chatInput = $('.chat-input');
    const $chatSendBtn = $('.chat-send-btn');

    // 메시지 전송 함수
    function sendMessage() {
        const message = $chatInput.val().trim();
        if (message) {
            // TODO: WebSocket으로 메시지 전송
            console.log('Sending message:', message);
            $chatInput.val('');
        }
    }

    // 메시지 표시 함수
    function displayMessage(message) {
        const messageHtml = `
            <div class="chat-message ${message.isMine ? 'mine' : ''}">
                <div class="chat-message-sender">${message.sender}</div>
                <div class="chat-message-content">${message.content}</div>
                <div class="chat-message-time">${message.time}</div>
            </div>
        `;
        $chatMessages.append(messageHtml);
        $chatMessages.scrollTop($chatMessages[0].scrollHeight);
    }

    // 이벤트 리스너
    $chatSendBtn.on('click', sendMessage);
    
    $chatInput.on('keypress', function(e) {
        if (e.which === 13 && !e.shiftKey) {
            e.preventDefault();
            sendMessage();
        }
    });

    // WebSocket 이벤트 핸들러
    chatSocket.onmessage = function(event) {
        const message = JSON.parse(event.data);
        displayMessage(message);
    };

    chatSocket.onopen = function() {
        console.log('WebSocket connection established');
    };

    chatSocket.onerror = function(error) {
        console.error('WebSocket error:', error);
    };

    // 접속자 목록 업데이트
    function updateOnlineUsers(users) {
        const $usersList = $('.online-users-list');
        $usersList.empty();
        
        users.forEach(user => {
            const userHtml = `
                <li class="online-user">
                    <div class="d-flex align-items-center p-2">
                        <img src="${user.avatar}" alt="${user.name}" class="online-user-avatar">
                        <span class="online-user-name ms-2">${user.name}</span>
                    </div>
                </li>
            `;
            $usersList.append(userHtml);
        });
    }

    // 인기 게시물 업데이트
    function updatePopularPosts(posts) {
        const $postsList = $('.popular-posts-list');
        $postsList.empty();
        
        posts.forEach(post => {
            const postHtml = `
                <li class="popular-post">
                    <a href="/post/${post.id}" class="d-block p-2">
                        <div class="popular-post-title">${post.title}</div>
                        <div class="popular-post-meta">
                            <span class="likes"><i class="fas fa-heart"></i> ${post.likes}</span>
                            <span class="comments"><i class="fas fa-comment"></i> ${post.comments}</span>
                        </div>
                    </a>
                </li>
            `;
            $postsList.append(postHtml);
        });
    }

    // TODO: 서버에서 초기 데이터 로드
    // updateOnlineUsers([/* 초기 사용자 데이터 */]);
    // updatePopularPosts([/* 초기 인기 게시물 데이터 */]);
});