<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  	<!-- 외부css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/login_jun.css">
 

<title>아이디 찾기</title>
</head>

<body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">
<div class="card align-middle" style="width:25rem;">
<div class="card-title" style="margin-top:30px;">
        
<%-- 	<a>아이디찾기</a> --%>
  <h2 class="card-title" style="color:#FF4600;">
    <a href="login.do">
      <img src="${pageContext.request.contextPath}/images/DDOIT.png"/> </a>
   
</div>
    
<div class="card-body">
  <form action="loginIdFind.do" class="form-signin" method="POST">
   <p class="text2">아이디 : ${member.memId}</p>
    <input type="text" name="memName" id="name" class="form-control" placeholder="이름" required autofocus><BR>
    <input type="email" name="memEmail" id="email" class="form-control" placeholder="이메일" required><br>
    <p class="check" id="check">${check}</p><br/>
    <button id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" onclick="location.href='loginIdFind.do'">아 이 디 찾 기</button>
  
  </form>
    
</div>
    <div class="links">
        <a href="loginPassFind.do">비밀번호 찾기</a> | <a href="login.do">로그인</a> | <a href="join.do">회원가입</a> | <a href="loginContact.do">문의하기</a>


    </div>
</div>

</body>
<script type="text/javascript">

  

  $("#name").focusout(function(){
    
   if($('#name').val() == ""){
     $('#check').text('이름을 입력해주세요.');
       $('#check').css('color', 'red');
 
   }else{
     $('#check').hide();
   }
   });
   
  $("#email").focusout(function(){
   if($('#email').val() == ""){
     $('#check').text('이메일을 입력해주세요');
       $('#check').css('color', 'red');
   }else{
     $('#check').hide();
   }
   });
</script>
</html>
