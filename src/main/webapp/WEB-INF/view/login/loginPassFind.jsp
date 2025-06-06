<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>

<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	<!-- 외부css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/login_jun.css">

    <title>비밀번호 찾기</title>

  </head>
   
  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
          <%--   <a>비밀번호 찾기</a> --%>
			<h2 class="card-title" style="color:#FF4600;">
				<a href="login.do">
					<img src="${pageContext.request.contextPath}/images/DDOIT.png"/> </a>
		</div>
        
		<div class="card-body">
      <form action="loginPassFind.do" class="form-signin" method="POST">
        <p class="text2">비밀번호 : ${member.memPassword}</p>
        <input type="text" name="memId" id="member_id" class="form-control" placeholder="아이디" required><br>
        <input type="text" name="memName" id="name" class="form-control" placeholder="이름" required><BR>
        <input type="email" name="memEmail" id="email" class="form-control" placeholder="이메일" required><br>
        <p class="checks" id="checks">${findpw_checkf}</p><br/>
        <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit">비밀번호 찾기</button>
      </form>
      
		</div>
        <div class="links">
            <a href="loginIdFind.do">아이디 찾기</a> | <a href="login.do">로그인</a> | <a href="join.do">회원가입</a> | <a href="loginContact.do">문의하기</a>


        </div>
	</div>
  
  </body>
    <script type="text/javascript">

	
	  	//아이디 정규식
		var idJ = /^[a-z0-9]{5,20}$/;
		
  		$("#member_id").focusout(function(){
	     if($('#member_id').val() == ""){
	   		$('#checks').text('아이디를 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  		
  		$("#member_id").focusout(function(){
  			if(!idJ.test($(this).val())){
  			$('#checks').text('5~20자의 영문 소문자, 숫자만 사용가능합니다');
  			$('#checks').css('color', 'red');
  		}
  		 });
  		
  		$("#name").focusout(function(){
	     if($('#name').val() == ""){
	   		$('#checks').text('이름을 입력해주세요.');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
	     
  		$("#email").focusout(function(){
	     if($('#email').val() == ""){
	   		$('#checks').text('이메일을 입력해주세요');
	   	  	$('#checks').css('color', 'red');
	     }
	     });
  
  </script>
</html>