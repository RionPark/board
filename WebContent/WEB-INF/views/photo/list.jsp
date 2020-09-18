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
	<div class="search">
		<form action="/photo/list">
			제목 : <input type="text" name="pbTitle" value="${param.pbTitle}"><br>
			내용 : <input type="text" name="pbContent" value="${param.pbContent}"><br>
			일자 : <input type="date" name="credat1" value="${param.credat1}"> - <input type="date" name="credat2" value="${param.credat2}"><br>
			<input type="hidden" name="page.pageNum" value="1">
			<button>검색</button>
		</form>
	</div>
	<form method="post" action="/photo/delete">
		<table class="table table-bordered">
			<tr>
				<th><input type="checkbox" id="allChk" onchange="allCheck(this)"></th>
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
						<td><input type="checkbox" name="pbNums" value="${pb.pbNum}"></td>
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
		<button>삭제</button>
	</form>
	<br>	
	<c:forEach begin="${page.startBlock}" end="${page.endBlock}" var="idx">
		<a href="/photo/list?page.pageNum=${idx}&pbTitle=${param.pbTitle}&pbContent=${param.pbContent}&credat1=${param.credat1}&credat2=${param.credat2}">[${idx}]</a>
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
function allCheck(obj){
	var chkObjs = document.querySelectorAll('input[name=pbNums]');
	for(var i=0;i<chkObjs.length;i++){
		chkObjs[i].checked = obj.checked;
	}
}
</script>
</body>
</html>



