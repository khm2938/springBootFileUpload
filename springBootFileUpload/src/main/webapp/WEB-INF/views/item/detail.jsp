<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 디테일</title>
<style>
body {
	font-family: 'Malgun Gothic', sans-serif;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	padding: 50px 20px;
	margin: 0;
}

.container {
	background: #ffffff;
	padding: 40px;
	border-radius: 12px;
	box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
	width: 100%;
	max-width: 700px;
}

h2 {
	color: #2c3e50;
	text-align: center;
	margin-bottom: 30px;
	font-size: 24px;
	border-bottom: 2px solid #f1f3f5;
	padding-bottom: 20px;
}

.info-row {
	display: flex;
	border-bottom: 1px solid #eee;
	padding: 15px 0;
}

.info-label {
	width: 100px;
	font-weight: bold;
	color: #495057;
}

.info-content {
	flex: 1;
	color: #333;
}

.content-area {
	min-height: 250px;
	padding: 20px 0;
	line-height: 1.6;
	white-space: pre-wrap;
	color: #333;
	border-bottom: 1px solid #f1f3f5;
}

.btn-area {
	display: flex;
	justify-content: flex-end;
	gap: 10px;
	margin-top: 30px;
}

.btn {
	padding: 10px 20px;
	border: none;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	transition: 0.2s;
}

.btn-modify {
	background-color: #007bff;
	color: white;
}

.btn-delete {
	background-color: #dc3545;
	color: white;
}

.btn-list {
	background-color: #6c757d;
	color: white;
}

.btn:hover {
	opacity: 0.8;
}
</style>
</head>
<body>

	<div class="container">
		<h2>상품 상세</h2>

		<div class="info-row">
			<div class="info-label">상품아이디</div>
			<div class="info-content">${item.id}</div>
		</div>

		<div class="info-row">
			<div class="info-label">상품가격</div>
			<div class="info-content">
				<fmt:formatNumber value="${item.price}" type="number" />
			</div>
		</div>

		<div class="info-row">
			<div class="info-label">상품이미지</div>
			<div class="info-content">
				<img alt="상품이미지 ${item.name}"
					 src="/item/display?id=${item.id}"
					 style="max-width:100%; border-radius:8px;">
			</div>
		</div>

		<div class="btn-area">
			<a href="/item/list" class="btn btn-list">상품목록</a>

			<a href="/item/updateForm?id=${item.id}" class="btn btn-modify">
				상품수정
			</a>

			<a href="/item/delete?id=${item.id}" class="btn btn-delete"
			   onclick="return confirm('정말 삭제하시겠습니까?')">
				상품삭제
			</a>
		</div>
	</div>

</body>

</html>