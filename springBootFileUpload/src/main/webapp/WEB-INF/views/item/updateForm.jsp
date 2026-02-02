<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<style>
/* 전체 배경 및 폰트 */
body {
	font-family: 'Malgun Gothic', sans-serif;
	background-color: #f8f9fa;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin: 0;
}

/* 중앙 컨테이너 */
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

/* 입력 필드 레이아웃 */
.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #495057;
}

input[type="text"], textarea {
	width: 100%;
	padding: 12px;
	border: 1px solid #ced4da;
	border-radius: 6px;
	box-sizing: border-box;
	transition: border-color 0.3s;
}

input[type="text"]:focus, textarea:focus {
	outline: none;
	border-color: #4dabf7;
	box-shadow: 0 0 0 3px rgba(77, 171, 247, 0.2);
}

textarea {
	height: 180px;
	resize: none;
}

/* 버튼 영역 스타일 통일 */
.btn-area {
	display: flex;
	justify-content: space-between;
	gap: 10px;
	margin-top: 30px;
}

/* 공통 버튼 스타일 */
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
	transition: opacity 0.2s;
}

.btn:hover {
	opacity: 0.8;
}

.btn-back {
	background-color: #adb5bd;
	color: white;
} /* 뒤로가기 - 회색 */
.btn-submit {
	background-color: #007bff;
	color: white;
} /* 전송 - 파란색 */
.btn-cancel {
	background-color: #ffc107;
	color: #212529;
} /* 취소 - 노란색 */
.btn-list {
	background-color: #343a40;
	color: white;
} /* 목록 - 검은색 */
</style>
</head>
<body>

	<div class="container">
		<h2>${board.no}게시글 수정</h2>
		<form action="/board/insert" method="post">
			<div class="form-group">
				<label for="no">게시글번호</label> <input type="text" id="title"
					name="no" value="${board.no}" readonly>
			</div>

			<div class="form-group">
				<label for="writer">작성자</label> <input type="text" id="writer"
					name="writer" value="${board.writer}" required>
			</div>
			
			<div class="form-group">
				<label for="content">제목</label>
				<input type="text" id="title" name="title" value="${board.title}" required>
			</div>

			<div class="form-group">
				<label for="content">내용</label>
				<textarea id="content" name="content"> ${board.content}</textarea>
			</div>

			<div class="btn-area">
            <a href="/board/boardList" class="btn btn-cancel">게시판리스트</a>
            <button type="submit" class="btn btn-cancel">수정전송</button>
            <button type="reset" class="btn btn-cancel">게시판취소</button>
        </div>
		</form>
	</div>

</body>
</html>