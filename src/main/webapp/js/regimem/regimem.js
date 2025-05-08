let isIdCheck = false;
let isNickNameCheck = false;

// ID 중복 체크 함수
function IdDuplicationCheck() {
    const memId = $('#memId').val();
    if(!memId) {
        alert('아이디를 입력해주세요.');
        return;
    }
    
    $.ajax({
        url: 'regimember.do',
        method: 'POST',
        data: {
            action: 'idCheck',
            memId: memId
        },
        success: function(response) {
            $('#idCheckResult').text(response.msg);
            isIdCheck = (response.status === 'true');
        }
    });
}

// 닉네임 중복 체크 함수
function nickNameDuplicationCheck() {
    const memNickname = $('#memNickname').val();
    if(!memNickname) {
        alert('닉네임을 입력해주세요.');
        return;
    }
    
    $.ajax({
        url: 'regimember.do',
        method: 'POST',
        data: {
            action: 'nickNameCheck',
            memNickname: memNickname
        },
        success: function(response) {
            $('#nickNameCheckResult').text(response.msg);
            isNickNameCheck = (response.status === 'true');
        }
    });
}

// 회원가입 처리 함수
function register() {
    if(!isIdCheck) {
        alert('아이디 중복 확인을 해주세요.');
        return;
    }
	
	if(!isNickNameCheck) {
	       alert('닉네임 중복 확인을 해주세요.');
	       return;
	   }
	
	// 회원정보 필수 입력 확인
    if(!$('#registerForm')[0].checkValidity()) {
	    alert('모든 필수 항목을 입력해주세요.');
	    return;
	}
    
    $.ajax({
        url: 'regimember.do',
        method: 'POST',
        data: {
			action: 'register',
			memId : $('#memId').val(),
			memPassword : $('#memPassword').val(),
			memName : $('#memName').val(),
			memNickname : $('#memNickname').val(),
			memEmail : $('#memEmail').val(),
			memPhone : $('#memPhone').val()
		},
        success: function(response) {
            alert(response.msg);
            if(response.status === 'true') {
                location.href = 'login.do';
            }
        }
    });
}

// 중복확인 클릭후에 다시 중복확인 이벤
$(document).ready(function() {
    // ID 입력값 변경 시 중복체크 상태 초기화
    $('#memId').on('change', function() {
		console.log("중복체크 초기화 발생했나요?");
        isIdCheck = false;
		isNickNameCheck = false;
        $('#idCheckResult').text('');
		$('#nickNameCheckResult').text('');
    });
    
    // 이벤트 바인딩
    $('#btnIdCheck').on('click', IdDuplicationCheck);
	$('#btnNickNameCheck').on('click', nickNameDuplicationCheck);
    $('#btnRegister').on('click', register);
	
});