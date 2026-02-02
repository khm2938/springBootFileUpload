<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록 성공</title>
<style>
    /* 전체 배경 및 폰트 - 이전 insertForm과 동일하게 설정 */
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
    
    /* 중앙 컨테이너 */
    .container { background: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); width: 100%; max-width: 500px; text-align: center; }
    
    /* 성공 아이콘이나 강조 텍스트 */
    .success-icon { font-size: 50px; color: #28a745; margin-bottom: 20px; }
    h2 { color: #2c3e50; margin-bottom: 10px; font-size: 24px; }
    p { color: #6c757d; margin-bottom: 30px; }

    /* 버튼 영역 스타일 통일 */
    .btn-area { display: flex; flex-direction: column; gap: 10px; }
    
    /* 공통 버튼 스타일 */
    .btn { 
        padding: 12px; border: none; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; text-align: center; text-decoration: none; transition: background-color 0.2s; 
    }

    .btn-main { background-color: #007bff; color: white; } /* 강조 버튼 */
    .btn-main:hover { background-color: #0056b3; }

    .btn-outline { background-color: transparent; border: 1px solid #ced4da; color: #495057; } /* 보조 버튼 */
    .btn-outline:hover { background-color: #e9ecef; }
</style>
</head>
<body>

<div class="container">
    <div class="success-icon">✔</div>
    <h2>${message}</h2>
    
    
    <div class="btn-area">
        <a href="/item/createForm" class="btn btn-main">상품등록</a>
        <a href="/item/list" class="btn btn-outline">상품리스트</a>
    </div>
</div>

</body>
</html>