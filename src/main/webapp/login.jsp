<%@page import="kr.or.ddoit.vo.MemberVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<>
<meta charset="UTF-8">

<link rel="stylesheet" href="">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="../js/jquery-3.7.1.js"> </script>

<script>
mypath='<%=request.getContextPath()%>';


$(function(){
    $('#loginpro').on('click', function() {
		//입력한 id와 pass 값가져오기
		let	memId = $('#id').val().trim();
		let memPass =$('#pass').val().trim();
		//직렬화로 가져오기때문에 vo와 일치해야한다.
		vbody = {memId: memId ,memPass: memPassword}
		//서버로 전송
		fetch(`${mypath}/LogOut.do`,{
			method : 'post',
			headers : {"Content-type" : "application/json;charset=utf-8"} ,
			//직렬화하는과정
			body : JSON.stringify(vbody)
			
		}).then(resp=>{
			if(resp.ok){
				return resp.text();  //결과를 html코드로 받기때문에json이 아닌 text로 변환해서 .then으로 보낸다.
				console.log("로그인이 완료되었습니다.");
			}else{
				throw new Erorr("오류 : "+ resp.status)	
			}
			
		})
		.then(data=>{
			console.log(data);
			
			//location.href="/boardpro/start/logpro.jsp";
			
			//2차 실행
			location.href="/DdoIt/index.html";
			
		})
		.catch(err=>{
			alert(err);
		})
	})
		//로그아웃되면 다시 로그인화면되게 만들어야한다.
		$('#logout').on('click', function() {
			fetch(`${mypath}/LogOut.do`)
			.then(resp=>{
				if(resp.ok){
					return resp.text();  //결과를 html코드로 받기때문에json이 아닌 text로 변환해서 .then으로 보낸다.
					console.log("로그아웃이 완료되었습니다.")
				}else{
					throw new Erorr("오류 : "+ resp.status)	
				}
				
			})
			.then(data=>{
				console.log(data);
				//자동으로 화면 변경되게(새로고침효과) logpro.jsp를 새로고침하겠다.
				//location.href="/boardpro/start/logpro.jsp";
				
				//2차 실행
				location.href="/DdoIt/index.html";
				
			})

			.catch(err=>{
				alert(err);
		})
	})


})

<%//첫번째로 가장먼저 실행된다.
//지금이상태 이면 vo=null이다.
//로그인했는지 안했는지 체크한다. Session(내장객체: 별도로 선언없이 사용할수있다.) 비교
//원래대로라면controller 에서 저장된 결과 값을 꺼낸다.(session.getAttribute로 실행된다.)
MemberVo vo = (MemberVo) session.getAttribute("loginok");
String check = (String) session.getAttribute("check");

//로그인확인
if (vo == null) { //로그인X  json 데이터 대신에 html코드를 직접출력한다.%>

<%} else { //로그인O
	//로그인한상태로 만들어준다.%>
<span><%=vo.getMemName()%> 님 환영합니다. </span>
&nbsp; &nbsp; &nbsp; &nbsp;
<input type="button" value="로그아웃" id="logout">
<br>

<%} //로그인안했으면%> 



</script>


<title>Login</title>
</head>
<body>
	<div id="con">
		<div id="login">
			<div id="login_form">
				로그인 폼
				<form action="">
					<h3 class="login" style="letter-spacing: -1px;">Login</h3>

					<p>
						<input type="submit" value="Sign in with Google" class="btn"
							style="background-color: #217Af0">
					</p>
					구글로 로그인

					<hr>

					<span>ID</span>
					<p style="text-align: left; font-size: 12px; color: #666">Id</p>
					<input type="text" placeholder="아이디" class="size" id="memId">
					<p></p>
					<label>아이디 </label> <span>PW</span>
						<p style="text-align: left; font-size: 12px; color: #666">Password</p> <input type="password" placeholder="비밀번호" class="size"
						id="memPassword">
					<label>비밀번호</label> <br>
					<p>
						<input type="submit" value="Login" class="btn" id="loginpro">
					</p>
				</form>

				<hr>
				<p class="find">
					<span><a href="join.jsp">회원가입 페이지로 이동</a></span>
				</p>
			</div>
		</div>
	</div>
</body>
</html>