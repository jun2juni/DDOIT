<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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

<title>prodList.jsp</title>
<title>상품 페이지</title>
<script>
	//위시 등록 or 해제 버튼
	function wishonoff(productNo, memNo, isWish) {
		// AJAX 요청
		$.ajax({
			url : "wishonoff.do",
			type : "POST",
			data : {
				memNo : memNo, // 현재 로그인한 회원 번호
				productNo : productNo,
				isWish : isWish
			},
			async : false,
			success : function(response) {
				if (response.success) {
					const icon = $(`#icon-${prod.productNo}`); // 클릭한 아이콘 요소
					if (isWish) {
						// 위시리스트 해제
						icon.removeClass("bi-heart-fill").addClass("bi-heart");
						alert("위시리스트에서 삭제되었습니다.");
						location.reload();
					} else {
						// 위시리스트 추가
						icon.removeClass("bi-heart").addClass("bi-heart-fill");
						alert("위시리스트에 추가되었습니다.");
						location.reload();
					}

				} else {
					alert("위시리스트 변경에 실패했습니다. 다시 시도하세요.");
				}

			},
			error : function() {
				alert("서버와의 통신에 실패했습니다.");
			}
		});
	}

</script>

<style>
#prodList {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
}

#wishBtn {
	margin: 15px;
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
		<nav class="main-nav">
		
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
	
		<h2>&nbsp;&nbsp;GOODS SHOP</h2><br><br>
		<div id="prodList">
			<c:forEach var="prod" items="${prodList}">
				<div class="container mt-3" style="width: 20%; margin: 0px;">
					<div class="card">
						<img class="card-img-top" src=<c:url value='/spongebob.png'/>
							alt="Card image" style="width: 80%">
						<div class="card-body">
							<h4 class="card-title" style="height: 45px">${prod.productName}</h4>
							<p class="card-text" style="height: 10x">${prod.price}원</p>
							<p class="card-text" style="height: 70px">${prod.description}</p>
							<c:if test="${prod.own == 0}">
								<a href="receipt.do?prodNo=${prod.productNo}">
									<button class="btn btn-warning">구매하기</button>
								</a>
							</c:if>
							<c:if test="${prod.own != 0}">
									<button class="btn btn-light" disabled="disabled">구매완료</button>
							</c:if>
							<c:if test="${prod.own == 0 }">
								<div class="btn-group" style="float: right">
									<c:choose>
										<c:when test="${prod.wishCheck != 0}">
											<i id="icon-${prod.productNo}" class="bi-heart-fill"
												onclick="wishonoff('${prod.productNo}','${member.memNo}', true)"
												style="font-size: 30px; color: red; cursor: pointer;"></i>
										</c:when>
										<c:otherwise>
											<i id="icon-${prod.productNo}" class="bi-heart"
												onclick="wishonoff('${prod.productNo}','${member.memNo}', false)"
												style="font-size: 30px; color: red; cursor: pointer;"></i>
										</c:otherwise>
									</c:choose>
								</div>
							</c:if>
						</div>
					</div>
				</div>
			</c:forEach>
			<br>
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