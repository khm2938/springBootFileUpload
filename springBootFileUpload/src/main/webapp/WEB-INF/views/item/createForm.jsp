<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자료실 업로드</title>
<style>
    /* 전체 배경 및 폰트 */
    body { font-family: 'Malgun Gothic', sans-serif; background-color: #f8f9fa; display: flex; justify-content: center; align-items: center; min-height: 100vh; margin: 0; }
    
    /* 중앙 컨테이너 */
    .container { background: #ffffff; padding: 40px; border-radius: 12px; box-shadow: 0 4px 20px rgba(0,0,0,0.08); width: 100%; max-width: 550px; }
    
    h2 { color: #2c3e50; text-align: center; margin-bottom: 30px; font-size: 24px; border-bottom: 2px solid #eee; padding-bottom: 15px; }
    
    /* 입력 필드 레이아웃 */
    .form-group { margin-bottom: 20px; }
    label { display: block; margin-bottom: 8px; font-weight: 600; color: #495057; }
    
    input[type="text"], textarea { 
        width: 100%; padding: 12px; border: 1px solid #ced4da; border-radius: 6px; box-sizing: border-box; transition: border-color 0.3s;
    }
    input[type="text"]:focus, textarea:focus { 
        outline: none; border-color: #4dabf7; box-shadow: 0 0 0 3px rgba(77,171,247,0.2); 
    }
    textarea { height: 180px; resize: none; }

    /* 버튼 영역 스타일 통일 */
    .btn-area { display: flex; justify-content: space-between; gap: 10px; margin-top: 30px; }
    
    /* 공통 버튼 스타일 */
    .btn { 
        flex: 1; padding: 12px; border: none; border-radius: 6px; font-size: 15px; font-weight: bold; cursor: pointer; text-align: center; text-decoration: none; transition: opacity 0.2s; 
    }
    .btn:hover { opacity: 0.8; }

    .btn-back { background-color: #adb5bd; color: white; } /* 뒤로가기 - 회색 */
    .btn-submit { background-color: #007bff; color: white; } /* 전송 - 파란색 */
    .btn-cancel { background-color: #ffc107; color: #212529; } /* 취소 - 노란색 */
    .btn-list { background-color: #343a40; color: white; } /* 목록 - 검은색 */
    
    /* 회원목록 버튼 - 초록색 계열로 포인트 */
    .btn-member { background-color: #28a745; color: white; }
</style>
</head>
<body>

<div class="container">
	<div class="header">
		<h1>이미지 업로드</h1>
	</div>
    
    <form action="/item/create" method="post" enctype="multipart/form-data">
        <div class="form-group">
            <label for="name">상품이름</label>
            <input type="text" id="name" name="name" placeholder="상품이름을 입력하세요" required>
        </div>
        
        <div class="form-group">
            <label for=""price"">상품가격</label>
            <input type="text" id="price" name="price" placeholder="상품가격을 입력하세요" required>
        </div>

        <div class="form-group">
            <label for="picture">상품파일</label>
            <input type="file" id="picture" name="picture" required>
        </div>
        
        <div class="form-group">
            <label for="description">상품이미지설명</label>
            <textarea id="description" name="description" rows="5" cols="20"></textarea>
        </div>
        
        <div class="btn-area">
            <button type="button" class="btn btn-back" onclick="history.back();">뒤로가기</button>
            <button type="reset" class="btn btn-cancel">취소</button>
            <button type="submit" class="btn btn-submit">등록하기</button>
            <a href="/item/list" class="btn btn-list">목록</a>
        </div>
        
    </form>
</div>

</body>
</html>