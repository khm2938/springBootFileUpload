<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작업 실패</title>
<style>
    /* 전체 배경 및 폰트 - 성공 페이지와 동일하게 유지 */
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
    
    /* 중앙 컨테이너 */
    .container { background: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); width: 100%; max-width: 500px; text-align: center; }
    
    /* 에러 아이콘 및 강조 텍스트 (Red 계열) */
    .error-icon { font-size: 50px; color: #dc3545; margin-bottom: 20px; }
    h2 { color: #2c3e50; margin-bottom: 10px; font-size: 24px; }
    p { color: #6c757d; margin-bottom: 30px; line-height: 1.5; }

    /* 버튼 영역 스타일 */
    .btn-area { display: flex; flex-direction: column; gap: 10px; }
    
    /* 공통 버튼 스타일 */
    .btn { 
        padding: 12px; border: none; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; text-align: center; text-decoration: none; transition: background-color 0.2s; 
    }

    /* 실패 시 메인 버튼은 경고색으로 설정 */
    .btn-danger { background-color: #dc3545; color: white; } 
    .btn-danger:hover { background-color: #bd2130; }

    .btn-outline { background-color: transparent; border: 1px solid #ced4da; color: #495057; } 
    .btn-outline:hover { background-color: #e9ecef; }
</style>
</head>
<body>

<div class="container">
    <div class="error-icon">❗</div>
    <h2>요청 처리 실패</h2>
    <p>${message != null ? message : "일시적인 오류가 발생했습니다.<br>잠시 후 다시 시도해주세요."}</p>
    
    <div class="btn-area">
        <a href="javascript:history.back();" class="btn btn-danger">다시 시도하기</a>
        
        <a href="/item/itemList" class="btn btn-outline">목록으로 돌아가기</a>
    </div>
    
   
</div>

</body>
</html>