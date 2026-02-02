<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트</title>
<!-- Pretendard 폰트 -->
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/pretendard@1.3.9/dist/web/static/pretendard.css">

<style>
/* ===== 기본 폰트 & 배경 ===== */
body {
    font-family: "Pretendard", -apple-system, BlinkMacSystemFont,
                 "Segoe UI", Roboto, "Apple SD Gothic Neo",
                 "Noto Sans KR", Arial, sans-serif;
    font-weight: 400;
    background-color: #f4f7fb;
    display: flex;
    justify-content: center;
    padding: 50px 20px;
    margin: 0;
}

/* ===== 컨테이너 ===== */
.container {
    background: #ffffff;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
    width: 100%;
    max-width: 900px;
}

/* ===== 제목 ===== */
h2 {
    color: #1f3a5f;
    text-align: center;
    margin-bottom: 30px;
    font-size: 26px;
    font-weight: 600;
}

/* ===== 테이블 ===== */
table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}

th, td {
    padding: 14px 16px;
    text-align: center;
    border-bottom: 1px solid #edf1f7;
    font-size: 14px;
}

th {
    background-color: #f8fbff;
    color: #3a4b63;
    font-weight: 600;
}

td {
    color: #495057;
}

/* 행 hover */
tr:hover {
    background-color: #f1f6ff;
    cursor: pointer;
}

/* 왼쪽 정렬 */
.text-left {
    text-align: left;
}

/* 데이터 없음 */
.no-data {
    padding: 50px;
    color: #adb5bd;
    font-size: 15px;
}

/* ===== 버튼 영역 ===== */
.btn-area {
    display: flex;
    justify-content: flex-end;
    gap: 12px;
    margin-top: 25px;
}

.btn-write {
    background-color: #4dabf7;
    color: white;
    padding: 10px 22px;
    border-radius: 8px;
    text-decoration: none;
    font-size: 14px;
    font-weight: 500;
    transition: background-color 0.2s, transform 0.15s;
}

.btn-write:hover {
    background-color: #339af0;
    transform: translateY(-1px);
}
</style>
</head>

<body>

<div class="container">
    <h2>상품리스트</h2>

    <table>
        <thead>
            <tr>
                <th style="width: 10%;">ID</th>
                <th style="width: 20%;">NAME</th>
                <th style="width: 15%;">PRICE</th>
                <th style="width: 55%;">URL</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty itemList}">
                    <c:forEach var="item" items="${itemList}">
                        <tr onclick="location.href='/item/detail?id=${item.id}'">
                            <td>${item.id}</td>
                            <td class="text-left">${item.name}</td>
                            <td>
                                <fmt:formatNumber value="${item.price}" pattern="#,###" />
                            </td>
                            <td class="text-left">${item.url}</td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="no-data">
                            등록된 상품이 없습니다.
                        </td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

    <div class="btn-area">
        <a href="/item/list" class="btn-write">상품리스트</a>
        <a href="/item/createForm" class="btn-write">상품등록</a>
    </div>
</div>

</body>
</html>