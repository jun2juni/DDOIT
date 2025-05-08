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
<title>purchasedItem.jsp</title>
<style>
.img{
	width : 100px;
	height:100px;
}
</style>
</head>
<body>

	<br>
	<br>
	<div class="container mt-3">
		<h2>MY GOODS</h2>
		<br> <br>
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
</body>
</html>