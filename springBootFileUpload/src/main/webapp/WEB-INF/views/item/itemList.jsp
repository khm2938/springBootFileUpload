<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록</title>
<style>
    /* 공통 스타일 유지 */
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; padding: 50px 20px; margin: 0; }
    
    .container { background: #ffffff; padding: 30px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); width: 100%; max-width: 900px; }
    
    h2 { color: #2c3e50; text-align: center; margin-bottom: 30px; font-size: 24px; }

    /* 테이블 스타일 */
    table { width: 100%; border-collapse: collapse; margin-bottom: 20px; }
    th, td { padding: 15px; text-align: center; border-bottom: 1px solid #eee; }
    th { background-color: #fcfcfc; color: #495057; font-weight: bold; }
    tr:hover { background-color: #f1f3f5; cursor: pointer; }

    /* 제목 왼쪽 정렬 */
    .text-left { text-align: left; padding-left: 20px; }
    
    /* 버튼 스타일 */
    .btn-area { display: flex; justify-content: flex-end; margin-top: 20px; }
    .btn-write { 
        background-color: #007bff; color: white; padding: 10px 20px; border-radius: 6px; 
        text-decoration: none; font-weight: bold; transition: background-color 0.2s; 
    }
    .btn-write:hover { background-color: #0056b3; }
	
	/* Search Bar Styles - 기존 게시판 스타일과 통일 */
    .search-container {
        display: flex;
        justify-content: flex-end;
        margin-bottom: 20px;
    }

    .search-form {
        display: flex;
        background: #ffffff;
        border: 1px solid #ced4da; /* 테이블 경계선과 비슷한 색상 */
        border-radius: 6px;
        overflow: hidden;
        transition: border-color 0.2s, box-shadow 0.2s;
    }

    /* 포커스 되었을 때 글쓰기 버튼 색상과 통일 */
    .search-form:focus-within {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
    }

    .search-select {
        background: #f8f9fa;
        color: #495057;
        border: none;
        border-right: 1px solid #ced4da;
        outline: none;
        padding: 8px 15px;
        font-size: 14px;
        cursor: pointer;
    }

    .search-input {
        background: transparent;
        border: none;
        color: #495057;
        padding: 8px 15px;
        width: 200px;
        outline: none;
        font-size: 14px;
    }

    .btn-search {
        background-color: #f8f9fa;
        border: none;
        border-left: 1px solid #ced4da;
        color: #007bff;
        font-weight: bold;
        cursor: pointer;
        padding: 0 20px;
        transition: background-color 0.2s;
    }

    .btn-search:hover {
        background-color: #e9ecef;
        color: #0056b3;
    }
	
	
    /* 게시글 번호 등 강조 */
    .no-data { padding: 50px; color: #adb5bd; }
</style>
</head>
<body>

<div class="container">
    <h2>게시판 목록</h2>
    <div class="search-container">
        <form action="/board/search" method="get" class="search-form">
            <select name="searchType" class="search-select">
                <option value="title">TITLE</option>
                <option value="writer">WRITER</option>
                <option value="content">CONTENT</option>
            </select>
            <input type="text" name="keyword" class="search-input" placeholder="Search mission...">
            <button type="submit" class="btn-search">SEARCH</button>
        </form>
    </div>
    <table>
        <thead>
            <tr>
                <th style="width: 10%;">번호</th>
                <th style="width: 50%;">제목</th>
                <th style="width: 20%;">작성자</th>
                <th style="width: 20%;">작성일</th>
            </tr>
        </thead>
        <tbody>
            <c:choose>
                <c:when test="${not empty boardList}">
                    <c:forEach var="board" items="${boardList}">
                        <tr onclick="location.href='/board/detail?no=${board.no}'">
                            <td>${board.no}</td>
                            <td class="text-left">${board.title}</td>
                            <td>${board.writer}</td>
                            <td><fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <tr>
                        <td colspan="4" class="no-data">등록된 게시글이 없습니다.</td>
                    </tr>
                </c:otherwise>
            </c:choose>
        </tbody>
    </table>

    <div class="btn-area">
        <a href="/board/boardList" class="btn-write">새로고침</a>
        <a href="/board/insertForm" class="btn-write">글쓰기</a>
    </div>
</div>

</body>
</html>