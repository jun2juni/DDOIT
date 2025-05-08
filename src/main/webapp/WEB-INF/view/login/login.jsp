<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/pages/login_jun.css">
    <title>로그인</title>
   
  </head>

  <body cellpadding="0" cellspacing="0" marginleft="0" margintop="0" width="100%" height="100%" align="center">

	<div class="card align-middle" style="width:25rem;">
		<div class="card-title" style="margin-top:30px;">
            
			<h2 class="card-title" style="color:#FF4600;">
      </h2>
     <a href="login.do">
      <img src="${pageContext.request.contextPath}/images/DDOIT.png"/> </a>
		</div>
      <form action="login.do" class="login" method="POST">
		<div class="card-body">
  
        <input type="text" name="memId" id="Id" class="form-control" placeholder="아이디" autofocus required><BR>
        <input type="password" name="memPassword" id="Pw" class="form-control" placeholder="비밀번호"  required><br>
         <p id="check" class="check">${login_name}</p><br/>
        <input id="btn-Yes" class="btn btn-lg btn-primary btn-block" type="submit" value="로 그 인">
      </form>
    
		</div>
        <div class="links">
            <a href="loginIdFind.do">아이디 찾기</a> | <a href="loginPassFind.do">비밀번호 찾기</a> 
            | <a href="regimember.do">회원가입</a> | <a href="loginContact.do">문의하기</a>

        </div>
	</div>
   
  </body>
</html>