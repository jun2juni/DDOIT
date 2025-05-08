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
<title>receipt.jsp</title>
<style>
input::placeholder {
	font-size: 9pt;
}

#hr {
	border-bottom : 2px solid gray;
}

.thPay {
	width: 70%;
}

.payBtn {
	text-align: center;
}

img { 
 	width: 100px; 
	height: 100px; 
}
</style>

<script>
$(document).ready(function() {

    $("#applyBtn").click(function() {
        point = $("#point").val(); // 입력된 포인트 값
        price = ${prod.price}; // 상품 가격

        if (!point || isNaN(point) || point <= 0) {
            alert("유효한 포인트 값을 입력해주세요.");
            return;
        }
        
        // 100원 단위 확인
        if (point % 100 !== 0) {
            alert("포인트는 100원 단위로 입력해야 합니다.");
            return;
        }
        
        // 보유 포인트 초과 확인
        if (point > ${member.points}) {
        	maxPoint = Math.floor(${member.points}/100)*100
            alert("최대 " + maxPoint + "원 사용 가능합니다.");
            return;
        }

        // ajax 요청 -> 최종결제금액
        $.ajax({
            url: "${contextPath}/applyPoint.do", // 서블릿 url
            type: "POST",
            data: {
                point: point,
                price: price,
                prodNo : ${prod.productNo}
            },
            success: function(response) {
                // 최종 결제 금액 업데이트
                $("#finalPrice").text(response.finalPrice + "원");
                $('input[name="usedPoint"]').attr("value", point);
                // console.log(`출력출력 $(input[name="usedPoint"]).val()`);
                
            },
            error: function(xhr) {
            	error = JSON.parse(xhr.responseText).error;
                alert(error);
            }
        });
    });
    

    // 포인트 초기화 버튼
    $("#removePoint").click(function() {
        $("#point").val(""); // 입력된 포인트 값 초기화
        $("#finalPrice").text("${prod.price}원"); // 최종 결제 금액 초기화
    });
});


function kakopay() {
	location.href = "kakopay.do";
}

function cancle() {
	location.href = "prodList.do";
}

</script>
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
	<div class="container mt-3">
		<h2>&nbsp;&nbsp;결제진행</h2><br><br>
		<table class="table table-borderless" id="hr">
				<tr>
					<th><h4>상품</h4></th>
					<th><h4>상품명</h4></th>
					<th><h4>금액</h4></th>
					<th><h4>수량</h4></th>
				</tr>
				<tr>
					<td><img src=<c:url value='/spongebob.png'/>></td>
					<td style="padding-top: 45px">${prod.productName}</td>
					<td style="padding-top: 45px">${prod.price}원</td>
					<td style="padding-top: 45px">&nbsp;${prod.qty}개</td>
				</tr>
		</table>
		
		
		<table id="hr" class="table table-borderless">
			<tr>
				<th class="thPay">총주문금액</th>
				<td>${prod.price}원</td>
			</tr>
			<tr>
				<th class="thPay">보유 포인트</th>
				<td>${member.points}원</td>
			</tr>
			<tr>
				<th class="thPay">포인트 사용금액</th>
				<td><input type="text" id="point"
					placeholder="100원 단위로 입력해 주세요.">
					<button id="applyBtn">적용</button> <!-- 적용 취소 버튼 추가 -->
					<button>
						<i id="removePoint" class="bi bi-arrow-clockwise"></i>
					</button></td>
			</tr>
		</table>
		<table class="table table-borderless">
			<tr>
				<th class="thPay" style="color: red">최종 결제 금액</th>
				<th id="finalPrice" style="color: red">${prod.price}원</th>
			</tr>
		</table>

		<br> <br>
		<div class="payBtn">
			<form action="/DdoIt/approval.do" method="post">
				<input hidden="hidden" name="usedPoint" value="0">
				<input hidden="hidden" name="price" value="${prod.price}">
				<input hidden="hidden" name="prodName" value="${prod.productName}">
				<input hidden="hidden" name="prodNo" value="${prod.productNo}">
				<button id="paybtn" class="btn btn-warning" style="width: 20%">결제하기</button>
			</form>
		</div>
		<br>
		<div class="payBtn">
			<button onclick="cancle()" class="btn btn-outline-secondary">취소</button>
		</div>
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