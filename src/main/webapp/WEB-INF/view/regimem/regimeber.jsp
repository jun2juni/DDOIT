<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
.card {
	margin: 0 auto;
	float: none;
	margin-top: 100px;
	padding: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	width: 25rem;
}

.card-title {
	text-align: center;
	color: #FF4600;
	margin-top: 30px;
}

.form-control {
	margin-bottom: 10px;
}

.btn-primary {
	background-color: #FF4600;
	border-color: #FF4600;
}

.btn-primary:hover {
	background-color: #cc3700;
	border-color: #cc3700;
}

.links {
	text-align: center;
	margin: 15px 0;
	padding-bottom: 20px;
}

body {
	background: #f8f9fa;
}

#idCheckResult {
	font-size: 0.9em;
	margin-top: 5px;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${pageContext.request.contextPath}/js/regimem/regimem.js"></script>
</head>
<body>
	<div class="card">
		<div class="card-title">
			<h2>
				<img src="${pageContext.request.contextPath}/images/DDOIT.png"
					alt="logo" />
			</h2>
		</div>
		<div class="card-body">
    		<form id="registerForm">
       			 <div class="form-group">  <!-- form-group div 추가 -->
         		   <label for="memId" class="form-label text-muted large mb-1">아이디</label>
         		   <div class="input-group">
            		    <input type="text" id="memId" name="memId" class="form-control" placeholder="아이디" required>
            	    <div class="input-group-append">
               	     <button type="button" id="btnIdCheck" class="btn btn-secondary btn-sm">중복확인</button>
                </div>
            </div>
            <span id="idCheckResult"></span>
        </div>

		<div class="form-group">
			<label for="memPassword" class="form-label text-muted large mb-1">비밀번호</label>
			<input type="password" id="memPassword" name="memPassword"
				class="form-control" placeholder="비밀번호" onkeyup="checkPassword()" required>
		</div>
		
		<div class="form-group">
			<label for="memPasswordCheck" class="form-label text-muted large mb-1">비밀번호 확인</label>
			<input type="password" id="memPasswordCheck" name="memPasswordCheck"
				class="form-control" placeholder="비밀번호 확인" onkeyup="checkPassword()" required>
		</div>

		<div class="form-group">
			<label for="memName" class="form-label text-muted large mb-1">이름</label>
			<input type="text" id="memName" name="memName" class="form-control"
				placeholder="이름" required>
		</div>

		<div class="form-group">
			<div class="input-group">
				<input type="text" id="memNickname" name="memNickname"
					class="form-control" placeholder="닉네임" required>
				<div class="input-group-append">
					<button type="button" id="btnNickNameCheck"
						class="btn btn-secondary btn-sm">중복확인</button>
				</div>
			</div>
			<span id="nickNameCheckResult"></span>
		</div>

		<div class="form-group">
			<label for="memEmail" class="form-label text-muted large mb-1">이메일</label>
			<input type="email" id="memEmail" name="memEmail"
				class="form-control" placeholder="sample@email.com" required>
		</div>

		<div class="form-group">
			<label for="memPhone" class="form-label text-muted large mb-1">휴대폰</label>
			<input type="tel" id="memPhone" name="memPhone" class="form-control"
				placeholder="010-1234-5678" required>
		</div>

		<button type="button" id="btnRegister" class="btn btn-primary btn-block">가입하기</button>
		</form>
	</div>
	<div class="links">
		<a href="login.do">로그인</a> | <a href="loginContact.do">문의하기</a>
	</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html->