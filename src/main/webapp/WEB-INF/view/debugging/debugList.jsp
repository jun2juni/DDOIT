<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.7.1.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.serializejson.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/header.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/layout.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/sidebar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common/chat.css">
</head>
<body>
<h1> 게시판 </h1>
<div class="container mt-3">
	 <form action="debugList.do">
    	<select name="option">
			<option value="postName">제목</option>
			<option value="content">내용</option>
			<option value="memNickname">작성자</option>
		</select>
		<input type="text" name="search"> 
		<input type="submit" value="검색">
	</form>
	
	<button type="button" onclick="location.href='debugInsert.do'" class="btn btn-primary">작성</button>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>글번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="post" items="${pagingVo.dataList}">
				<tr>
					<td>${post.postNo}</td>
					<td><a href="debugDetail.do?postNo=${post.postNo}">${post.postName}</a></td>
					<td>${post.memNickname}</td>
					<td>${post.createdDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	 <!-- START : 페이지네이션  -->
    <nav class="text-center">
        <ul class="pagination">
            <!-- 첫 페이지  -->
             <li><a href="postList.do?currentPage=1" data-page="1"><span aria-hidden="true">FIRST</span></a></li>
            <!-- 이전 페이지 -->
            <c:if test="${pagingVo.startPage ne 1}">
            	<li class="page-item"><a class="page-link" href="postList.do?currentPage=${pagingVo.startPage-1}" data-page="${pagingVo.startPage-1}">Previous</a></li>
            </c:if>
            <!-- 페이지 넘버링  -->
            <c:forEach begin="${pagingVo.startPage}" end="${pagingVo.endPage}" var="i" >
                <c:if test="${pagingVo.currentPage ne i && pagingVo.totalPage >= i}">
                    <li class="page-item"><a class="page-link" href="postList.do?currentPage=${i}" data-page="${i}">${i}</a></li>
                </c:if>
                <c:if test="${pagingVo.currentPage eq i}">
                <li class="page-item active"><a class="page-link">${i}</a></li>
                    <li class="active"><b></b></li>
                </c:if>
            </c:forEach>
            <!-- 다음  페이지  -->
            <c:if test="${pagingVo.endPage < pagingVo.totalPage}">
                <li class="page-item"><a class="page-link" href="postList.do?currentPage=${pagingVo.endPage+1}" data-page="${pagingVo.endPage+1}">Next</a></li>
            </c:if>
            <!-- 마지막 페이지 -->
            <li><a href="postList.do?currentPage=${pagingVo.totalPage}" data-page="${pagingVo.totalPage}"><span aria-hidden="true">LAST</span></a></li>
        </ul>
    </nav>
    <!-- END : 페이지네이션  -->
</div>
</body>
</html>