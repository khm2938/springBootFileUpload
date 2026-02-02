<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>

<style>
body {
	font-family: 'Malgun Gothic', sans-serif;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

.container {
	background: #ffffff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	width: 100%;
	max-width: 550px;
}

h2 {
	color: #2c3e50;
	text-align: center;
	margin-bottom: 30px;
	font-size: 24px;
	border-bottom: 2px solid #eee;
	padding-bottom: 15px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #495057;
}

input[type="text"], input[type="number"], textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ced4da;
	border-radius: 6px;
	box-sizing: border-box;
}

textarea {
	height: 160px;
	resize: none;
}

.btn-area {
	display: flex;
	gap: 10px;
	margin-top: 30px;
}

.btn {
	flex: 1;
	padding: 12px;
	border: none;
	border-radius: 6px;
	font-size: 15px;
	font-weight: bold;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
}

.btn-submit {
	background-color: #007bff;
	color: white;
}

.btn-list {
	background-color: #6c757d;
	color: white;
}
</style>
</head>

<body>

	<div class="container">
		<h2>상품 수정</h2>

		<form action="/item/update" method="post" enctype="multipart/form-data">

			<div class="form-group">
				<label>상품 ID</label>
				<input type="text" name="id" value="${item.id}" readonly>
			</div>

			<div class="form-group">
				<label>상품명</label>
				<input type="text" name="name" value="${item.name}" required>
			</div>

			<div class="form-group">
				<label>가격</label>
				<input type="number" name="price" value="${item.price}" required>
			</div>

			<div class="form-group">
				<label>상품 설명</label>
				<textarea name="description">${item.description}</textarea>
			</div>

			<div class="form-group">
				<label>상품 이미지 변경</label>
				<input type="file" name="picture">
			</div>

			<div class="btn-area">
				<a href="/item/list" class="btn btn-list">목록</a>
				<button type="submit" class="btn btn-submit">수정 완료</button>
			</div>

		</form>
	</div>

</body>
</html>
