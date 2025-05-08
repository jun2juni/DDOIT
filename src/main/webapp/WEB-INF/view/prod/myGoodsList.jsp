<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/jquery-3.7.1.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" href="${contextPath}/css/common/header.css">
<link rel="stylesheet" href="${contextPath}/css/common/layout.css">
<link rel="stylesheet" href="${contextPath}/css/common/sidebar.css">
<title>purchasedItem.jsp</title>
<style>
.img{
	width : 100px;
	height:100px;
}
</style>
</head>
<body>


<!-- 헤더 영역 -->
	<header class="header">
		<div class="container-fluid h-100">
			<div class="row h-100 align-items-center">
				<div class="col-auto">
					<!-- 로고 클릭시 메인 화면으로 이동해야 됩니다. -->
					<a href="index.do" class="logo">DDOIT</a>
				</div>
				<div class="col px-4">
					<!-- 					<div class="search-wrapper position-relative"> -->
					<!-- 						<i class="fas fa-search search-icon"></i> <input type="text" -->
					<!-- 							class="form-control search-input" placeholder="검색어를 입력하세요"> -->
					<!-- 					</div> -->
				</div>
				<div class="col-auto">
					<div class="d-flex align-items-center gap-3">
						<!-- href="#" 상점 페이지 연결해주세요 -->
						<a href="prodList.do" class="header-icon" id="shopButton"> <i
							class="fas fa-store"></i>
						</a>
						<!-- href="#" 알림 페이지(모달) 연결해주세요 -->
						<a href="#" class="header-icon" id="notificationButton"> <i
							class="fas fa-bell"></i>
						</a>
						<div class="dropdown">
							<button class="btn p-0" type="button" data-bs-toggle="dropdown">
								<img src="https://via.placeholder.com/32" alt="Profile"
									class="profile-img">
							</button>
							<ul class="dropdown-menu dropdown-menu-end">
								<li><a class="dropdown-item" href="/profile">프로필</a></li>
								<li><a class="dropdown-item" href="/settings">설정</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="/logout">로그아웃</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!--     메인 레이아웃 -->
	<!-- 	<div class="main-layout"> -->
	<!--         좌측 사이드바 -->
	<aside class="left-sidebar">
	
		<!--             메인 네비게이션 -->
			<div class="nav-group">
				<h6 class="nav-group-title">Product Item</h6>
				<ul class="nav-list">
					<li><a href="prodList.do" class="nav-link">&nbsp;All</a></li>
					<li><form id="nickname" action="/DdoIt/prodList.do" method="get">
    					<input type="hidden" name="prodTypeClick" value="1">
    					<a href="#" onclick="document.getElementById('nickname').submit()" class="nav-link">&nbsp;Nickname</a>
					</form></li>
					<li><form id="profile" action="/DdoIt/prodList.do" method="get">
    					<input type="hidden" name="prodTypeClick" value="2">
    					<a href="#" onclick="document.getElementById('profile').submit()" class="nav-link">&nbsp;Profile</a>
					</form></li>
				</ul>
			</div>

			<div class="nav-group">
				<h6 class="nav-group-title">Wish & Purchase</h6>
				<ul class="nav-list">
					<li><a href="wishList.do?memNo=${member.memNo}" class="nav-link">&nbsp;WISHLIST</a></li>
					<li><a href="myGoodsList.do" class="nav-link">&nbsp;MY GOODS</a></li>
				</ul>
			</div>
			
			<div class="nav-group">
				<h6 class="nav-group-title">Customer Support</h6>
				<ul class="nav-list">
					<li>
						<a href="/notices" class="nav-link">
						<i class="fas fa-bullhorn"></i>공지사항
					</a>
					</li>
					<li>
						<a href="/inquiries" class="nav-link">
						<i class="fas fa-question-circle"></i>문의하기
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</aside>


	<main class="shop-main-content">
		<!--             여기에 페이지별 컨텐츠가 들어갑니다 -->

		<div class="container mt-3">
		<h2>&nbsp;&nbsp;MY GOODS</h2><br><br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상품</th>
					<th>상품명</th>
					<th>설명</th>
					<th>적용</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="goods" items="${myGoodsList}">
					<tr>
						<td><img src=<c:url value='/spongebob.png'/> alt="prod_img" class="img"></td>
						<td style="padding-top: 45px">${goods.productName}</td>
						<td style="padding-top: 45px">${goods.description}</td>
						<td style="padding-top: 45px">
						<a href="receipt.do?prodNo=${goods.productNo}"
							class="btn btn-warning">적용</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	</main>

	<!-- 공통 스크립트 -->
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/js/layout.js"></script>
	<script src="${contextPath}/js/component/header.js"></script>
	<script src="${contextPath}/js/component/sidebar_osi.js"></script>


</body>
</html>