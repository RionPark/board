<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
</head>
<body>
<div class="container">
	<h2>사진게시판</h2>
	<table class="table table-bordered">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>이미지</th>
			<th>생성일</th>
		</tr> 
		<c:if test="${empty pbList }">
			<tr> 
				<td colspan="4">내용이 없습니다.</td>
			</tr>
		</c:if>
		<c:if test="${!empty pbList }">
			<c:forEach items="${pbList}" var="pb">
				<tr>
					<td>${pb.pbNum}</td>
					<td>${pb.pbTitle}</td>
					<td>
						<c:if test="${pb.pbPhotoPath!=null }">
							<a href="/resources/${pb.pbPhotoPath}" target="blank"><img src="/resources/${pb.pbPhotoPath}" width="50px" onmouseover="showImg(this.src)" onmouseout="offImg()"></a>
						</c:if>
					</td>
					<td>${pb.credat}</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<c:forEach begin="${page.startBlock}" end="${page.endBlock}" var="idx">
		<a href="/photo/list?page.pageNum=${idx}">[${idx}]</a>
	</c:forEach>
	<a href="/photo/list?page.pageNum=${page.pageNum+1}">▶</a>
	<a href="/photo/write"><button>글쓰기</button></a>
</div>
<img src="" style="display:none" id="sImg">
<script>
function showImg(src){
	document.querySelector('#sImg').src=src;
	document.querySelector('#sImg').style.display='';
}
function offImg(){
	document.querySelector('#sImg').style.display='none';
}
</script>
</body>
</html>