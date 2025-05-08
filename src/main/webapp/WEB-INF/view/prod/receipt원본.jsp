<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/jquery-3.7.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<title>receipt.jsp</title>
<style>
input::placeholder {
	font-size: 9pt;
}

hr {
	background: gray;
	height: 2px;
}

.thPay {
	width: 70%;
}

.payBtn {
	text-align: center;
}

/* img { */
/* 	width: 100px; */
/* 	height: 100px; */
/* } */
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
    
//     $("#paybtn").click(function() {
    	
//     $.ajax({
//     	url : "${contextPath}/approval.do", // 서블릿 url
//         type : "POST",
//     	data : {
//     		point : $("#point").val(), // 입력된 포인트 값
// 	    	finalPrice : $("#finalPrice").val(),
// 		    prodNo : ${prod.productNo}
//     	},
//     	success: function(response) {
//     	},
//     	error: function(xhr) {
//     		alert("ㅁㄴㅇㄻㄴㅇㄹ실패");
//     	}
//      });
//    });

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
	<br>
	<br>
	<div class="container mt-3">
		<h2>결제 진행</h2>
		<br> <br>
		<table class="table table-borderless">
			<thead>
				<tr>
					<th><h4>상품</h4></th>
					<th><h4>상품명</h4></th>
					<th><h4>금액</h4></th>
					<th><h4>수량</h4></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><img src=<c:url value='/spongebob.png'/>></td>
					<td style="padding-top: 45px">${prod.productName}</td>
					<td style="padding-top: 45px">${prod.price}원</td>
					<td style="padding-top: 45px">&nbsp;${prod.qty}개</td>
				</tr>
			</tbody>
		</table>
		<hr>
		<table class="table table-borderless">
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
		<hr>
		<table class="table table-borderless">
			<tr>
				<th class="thPay" style="color: red">최종 결제 금액</th>
				<th id="finalPrice" style="color: red">${prod.price}원</th>
			</tr>
		</table>

		<br> <br>
		<div class="payBtn" id="paybtn">
			<form action="/DdoIt/approval.do" method="post">
				<input hidden="hidden" name="usedPoint" value="0">
				<input hidden="hidden" name="price" value="${prod.price}">
				<input hidden="hidden" name="prodName" value="${prod.productName}">
				<input hidden="hidden" name="prodNo" value="${prod.productNo}">
				<button class="btn btn-warning" style="width: 20%">결제하기</button>
			</form>
		</div>
		<br>
		<div class="payBtn">
			<button onclick="cancle()" class="btn btn-outline-secondary">취소</button>
		</div>
		<br>
	</div>
</body>
</html>