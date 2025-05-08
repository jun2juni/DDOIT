<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<script src="${contextPath}/js/jquery-3.7.1.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>
    body {
        background-color: #f8f9fa;
        font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
    }
    .questHead {
        background-color: transparent;
        color: #343a40;
        padding: 20px;
        border-radius: 5px;
        margin-bottom: 20px;
    }
    .questTitle h2 {
        margin: 0;
        font-size: 24px;
    }
    .underTitle {
        margin-top: 10px;
    }
    .postInfo {
        margin-right: 20px;
        color: #6c757d;
    }
    .btn-primary {
        background-color: #fd7e14;
        border-color: #fd7e14;
    }
    .btn-primary:hover {
        background-color: #e66a00;
        border-color: #e66a00;
    }
    button {
        margin-top: 10px;
    }
    #content {
        background-color: #ffffff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    h4 {
        margin-top: 20px;
    }
    table {
        width: 100%;
        margin-top: 10px;
        background-color: #ffffff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        border-radius: 5px;
    }
    td {
        padding: 10px;
        border-bottom: 1px solid #dee2e6;
    }
    .answer {
        background-color: #e9ecef;
        padding: 10px;
        margin-top: 10px;
        border-radius: 5px;
    }
    .postInfo{
    	float: left;
    }
    .underTitle{
    	clear: both;
    }
    .dropdown-menu { min-width: auto; }
</style>

<script>
<%-- var mypath = `<%= request.getContextPath()%>`; --%>
var originalComment="";

function postDelete(type,number){
	fetch('/DdoIt/debugDelete.do',{
		method: 'post',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			type: type,
			number: number
		})
	})
	.then(response => response.json())
	.then(data => {
		console.log('성공:', data);
		location.reload();
	 })
	.catch((error) => {
		console.log(error);
	 });
}

function commentDelete(commentNo){
	fetch('/DdoIt/debugReplyInsert.do',{
		method: 'post',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			reqStr: "delete",
			commentNo: commentNo
		})
	})
	.then(response => response.json())
	.then(data => {
		console.log('성공:', data);
		location.reload();
	 })
	.catch((error) => {
		console.log(error);
	 });
}


function cancelUpdate(commentNo){
	$('#commentNo'+commentNo).replaceWith(originalComment);
	
	originalComment="";
}
<%-- 업데이트 완료 --%>
function updateComplete(commentNo){
	var updateContent = document.getElementById("updateComment"+commentNo).value;
	fetch('/DdoIt/debugReplyInsert.do',{
		method: 'post',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			reqStr: "update",
			commentNo: commentNo,
			content: updateContent
		})
	})
	.then(response => response.json())
	.then(data => {
		console.log('성공:', data);
		location.reload();
	 })
	.catch((error) => {
		console.log(error);
	 });
}

function updateComments(commentNo, content){
	console.log(commentNo);
	originalComment = document.getElementById("commentNo"+commentNo).outerHTML;
	
	var updateComment= "";
	console.log("originalComment ========================="+originalComment+"=====================================끝====");
	if($('#commentNo').val() != null) {
		alert("이미 수정 중인 댓글이 있습니다.");
		return;
	}

	
	updateComment += '<div class="container mt-3" id="commentNo'+commentNo+'">';
	updateComment += '<div class="mb-3 mt-3">';
	updateComment += '<label for="updateComment">댓글 수정:</label>'
        			+'<textarea class="form-control" rows="3" id="updateComment'+commentNo+'" name="text">'+content+'</textarea></div>';
    updateComment += '<button type="submit" class="btn btn-primary" onclick="updateComplete('+commentNo+')">수정</button>&nbsp;&nbsp;&nbsp';
    updateComment += '<button type="button" onclick="cancelUpdate('+commentNo+')" class="btn btn-primary">수정취소</button></div>';
    console.log(updateComment);
	$('#commentNo'+commentNo).replaceWith(updateComment);
}

function submitComment(postNo, replyNo){
	
	var commentContent = document.getElementById('commentForm'+replyNo).value;

	fetch('/DdoIt/debugReplyInsert.do',{
		method: 'post',
		headers: {
			'Content-Type': 'application/json;charset=utf-8'
		},
		body: JSON.stringify({
			reqStr: "insert",
			postNo: postNo,
			replyNo: replyNo,
			content: commentContent
		})
	})
	.then(response => response.json())
	.then(data => {
		console.log('성공:', data);
		location.reload();
	 })
	.catch((error) => {
		console.log(error);
	 });
}
</script>
</head>
<body>
    <div class="container">
        <div class="questHead">
            <div class="questTitle"><h2>${postVo.postName}</h2></div>
            <div id="postInfo" class="underTitle">
                <div id="date" class="postInfo">작성자 ${postVo.memNickname}&nbsp;&nbsp;&nbsp;</div>
                <div id="date" class="postInfo">작성일 ${postVo.createdDate}&nbsp;&nbsp;&nbsp;</div>
                <div id="like" class="postInfo">추천수 ${postVo.recommendation}&nbsp;&nbsp;&nbsp;</div>
                <div id="view" class="postInfo">조회수 ${postVo.viewCount}&nbsp;&nbsp;&nbsp;</div> 
            </div>
            <div name="buttons" class="underTitle">
                <c:if test="${memVo.memNo == postVo.memNo}">
                    <button type="button" onclick="location.href='debugUpdate.do?postNo=${postVo.postNo}'" class="btn btn-primary">수정</button>
                    <button type="button" onclick="postDelete('post',${postVo.postNo});" class="btn btn-primary">삭제</button>
                </c:if>
                    <button type="button" onclick="location.href='debugList.do'" class="btn btn-primary">목록</button>
            </div>
        </div>
    
        <div id="content">
            <h4>질문내용</h4>
            <p>${postVo.content}</p>
            <button class="btn btn-secondary">답글작성하기</button>
        </div>
        <button class="btn btn-secondary" data-bs-toggle="collapse" data-bs-target="#mainComments">댓글 보기1</button>
        <div id="mainComments" class="collapse">
        	<!-- 댓글 리스트 -->
        	<c:forEach var="comment" items="${postVo.comments}">
            	<c:if test="${comment.replyNo==0}">
           			<div id="commentNo${comment.commentNo}" data-reply-no="${comment.replyNo}">
                		<table class="table" id="MaincommentList">
	                        <tr>    
	                            <td>${comment.memNickname}</td>
	                            <td>${comment.content}</td>
	                            <td>${comment.createdDate}</td>
	                            <td>
	                            	<%@include file="cmmntsDropdown.jsp" %>
	                            </td>
	                        </tr>
                		</table>
            		</div>
            	</c:if>
            </c:forEach>
            <div class="container mt-3" >
                <div class="mb-3 mt-3">
                  <label for="comment">댓글 작성:</label>
                  <textarea class="form-control" rows="3" id='commentForm0' name="text"></textarea>
                </div>
                <button type="submit" class="btn btn-primary" onclick="submitComment(${postVo.postNo}, 0)">작성</button>
            </div>
        </div>
    	<!-- 여기도 postVo.accepted.replyNo로 replyNo가져올 수 있음. -->
        <c:if test="${postVo.accepted != null}" >
            <h4>채택된 답변</h4>
            <div class="answer">
                <div>닉네임 : ${postVo.accepted.memNickname}</div>
                <div>내용 : ${postVo.accepted.content}</div>
                <div>작성일 : ${postVo.accepted.createdDate}</div>
                <div class="dropdown">
					<button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown"></button>
					<ul class="dropdown-menu">
						<c:if test="${memVo.memNo == postVo.accepted.memNo}">
							<li><a class="dropdown-item" href="#">수정</a></li>
							<li><a class="dropdown-item" href="#" onclick="postDelete('reply',${postVo.accepted.replyNo})">삭제</a></li>
						</c:if>
						<c:if test="${memVo.memNo == postVo.memNo}">
							<li><a class="dropdown-item" href="#">채택</a></li>
						</c:if>	
							<li><a class="dropdown-item" href="#">신고하기</a></li>
					</ul>
				</div>
            </div>
            <button class="btn btn-secondary" data-bs-toggle="collapse" data-bs-target="#acceptedRComments">댓글 보기2</button>
            <div id="acceptedRComments" class="collapse">
            	<c:forEach var="comment" items="${postVo.comments}">
                	<c:if test="${comment.replyNo == postVo.accepted.replyNo}">
            			<div id="commentNo${comment.commentNo}">
		                	<table class="table">
                                <tr>
                                    <td>${comment.memNickname}</td>
                                    <td>${comment.content}</td>
                                    <td>${comment.createdDate}</td>
                                    <td>
                                	<%@include file="cmmntsDropdown.jsp" %>
                               		</td>
                                </tr>
                  	 		</table>    
                   		</div>
                   	</c:if>
                   </c:forEach>
                <div class="container mt-3">
                    <div class="mb-3 mt-3">
                      <label for="comment">댓글 작성:</label>
                      <textarea class="form-control" rows="3" id='commentForm${postVo.accepted.replyNo}' name="text"></textarea>
                    </div>
                    	<button type="submit" class="btn btn-primary" onclick="submitComment(${postVo.accepted.postNo}, ${postVo.accepted.replyNo})">
                        	작성
                        </button>
                </div>
            </div>
        </c:if>
    	<!-- 여기는 댓글 작성에서 replyNo가져올 수 있다. -->
        <h4>미채택 답변</h4>
        <c:forEach var="reply" items="${postVo.replyList}">
            <c:if test="${reply.replyNo != postVo.accepted.replyNo}">
                <div class="answer">
                    <div>닉네임 : ${reply.memNickname}</div>
                    <div>내용 : ${reply.content}</div>
                    <div>작성일 : ${reply.createdDate}</div>
                    <%@include file="replyDropdown.jsp" %>
                </div>
                <button class="btn btn-secondary" data-bs-toggle="collapse" data-bs-target="#replyComments${reply.replyNo}">댓글 보기3</button>
                <!-- 댓글목록 -->
                <div id="replyComments${reply.replyNo}" class="collapse">
                	<c:forEach var="comment" items="${postVo.comments}">
                    	<c:if test="${comment.replyNo == reply.replyNo}">
                   			<div id="commentNo${comment.commentNo}">
                        		<table class="table">
	                               	<tr>
	                                    <td>${comment.memNickname}</td>
	                                    <td>${comment.content}</td>
	                                    <td>${comment.createdDate}</td>
	                                    <td>
	                                		<%@include file="cmmntsDropdown.jsp" %>
	                               		</td>
	                               	</tr>
                       			</table>
                       		</div>
                    	</c:if>
                   	</c:forEach>
                    <div class="container mt-3">
                        <div class="mb-3 mt-3">
                          <label for="comment">댓글 작성:</label>
                          <textarea class="form-control" rows="3" id='commentForm${reply.replyNo}' name="text"></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary" onclick="submitComment(${reply.postNo}, ${reply.replyNo})">
                        	작성
                        </button>
                    </div>
                   </div>
            	</c:if>
        	</c:forEach>
    	</div> 
</body>
</html>
