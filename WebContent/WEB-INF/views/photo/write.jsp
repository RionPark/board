<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="POST" action="/photo/write" enctype="multipart/form-data">
	제목 : <input type="text" name="pbTitle"><br>
	내용 : <textarea name="pbContent"></textarea><br>
	사진 : <input type="file" name="pbFile"><br>
	<button>글쓰기</button>
</form>
</body>
</html>