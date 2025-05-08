<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
    .container {
        width: 500px;
        margin: 50px auto;
        padding: 20px;
    }
    .form-group {
        margin-bottom: 15px;
    }
    .form-group label {
        display: block;
        margin-bottom: 5px;
    }
    .form-group input {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
    }
    .btn {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    .btn:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>회원정보 수정</h2>
        <form action="updateMember.do" method="post">
            <input type="hidden" name="memNo" value="${member.memNo}">
            
            <div class="form-group">
                <label for="memPassword">비밀번호</label>
                <input type="password" id="memPassword" name="memPassword" value="${member.memPassword}" required>
            </div>
            
            <div class="form-group">
                <label for="memNickname">닉네임</label>
                <input type="text" id="memNickname" name="memNickname" value="${member.memNickname}" required>
            </div>
            
            <div class="form-group">
                <label for="memEmail">이메일</label>
                <input type="email" id="memEmail" name="memEmail" value="${member.memEmail}" required>
            </div>
            
            <div class="form-group">
                <label for="memPhone">전화번호</label>
                <input type="tel" id="memPhone" name="memPhone" value="${member.memPhone}" required>
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn">수정하기</button>
                <button type="button" class="btn" onclick="history.back()">취소</button>
            </div>
        </form>
    </div>
    
    <script>
        function validateForm() {
            // 필요한 유효성 검사 로직 추가
            var password = document.getElementById("memPassword").value;
            var nickname = document.getElementById("memNickname").value;
            var email = document.getElementById("memEmail").value;
            var phone = document.getElementById("memPhone").value;
            
            if (!password || !nickname || !email || !phone) {
                alert("모든 필드를 입력해주세요.");
                return false;
            }
            return true;
        }
    </script>
</body>
</html>