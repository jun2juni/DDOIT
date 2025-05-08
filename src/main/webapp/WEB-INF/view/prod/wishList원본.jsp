<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<title>wishList.jsp</title>
<style>
.img{
	width : 100px;
	height:100px;
}
</style>
</head>
<body>
	<br><br>
	<div class="container mt-3">
		<h2>WISHLIST</h2><br><br>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>상품</th>
					<th>상품명</th>
					<th>설명</th>
					<th>금액</th>
					<th>구매</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="wish" items="${wishList}">
					<tr>
					<td><img src=<c:url value='/spongebob.png'/> alt="prod_img" class="img"></td>
						<td style="padding-top: 45px">${wish.productName}</td>
						<td style="padding-top: 45px">${wish.description}</td>
						<td style="padding-top: 45px">${wish.price} \</td>
						<td style="padding-top: 45px"><a href="receipt.do?prodNo=${wish.productNo}" class="btn btn-warning">구매하기</a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>