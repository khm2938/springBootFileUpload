📦 springBootFileUpload

Spring Boot + JSP + MyBatis 기반의 파일 업로드를 포함한 상품(Item) CRUD 예제 프로젝트입니다.
이미지 업로드 / 조회 / 수정 / 삭제 흐름을 MVC 구조로 연습하기 위한 목적의 프로젝트입니다.

✨ 주요 기능 (Features)

상품(Item) 등록

이미지 파일 업로드 포함

상품 목록 조회

상품 상세 조회 (이미지 표시)

상품 수정 (이미지 교체 가능)

상품 삭제

DB 데이터 + 서버 파일 동시 삭제

업로드 이미지 직접 표시 API 제공

🔐 보안 참고
파일 삭제 시 .. 문자열을 차단하여 간단한 Path Traversal 방어 로직를 적용했습니다.

🛠 기술 스택 (Tech Stack)

Java

Spring Boot (WAR 배포)

Spring MVC

JSP / JSTL

MyBatis

Apache Commons IO

Oracle DB (또는 H2 테스트 가능)

Maven

📁 프로젝트 구조
springBootFileUpload
 ├─ src
 │  ├─ main
 │  │  ├─ java
 │  │  │  └─ com.zeus
 │  │  │     ├─ controller
 │  │  │     │  └─ ItemController.java
 │  │  │     ├─ mapper
 │  │  │     │  └─ ItemMapper.java
 │  │  │     ├─ service
 │  │  │     │  └─ ItemService.java
 │  │  │     └─ domain
 │  │  │        └─ Item.java
 │  │  ├─ resources
 │  │  │  └─ com/zeus/mapper
 │  │  │     └─ ItemMapper.xml
 │  │  └─ webapp
 │  │     └─ WEB-INF/views/item
 │  │        ├─ createForm.jsp
 │  │        ├─ list.jsp
 │  │        ├─ detail.jsp
 │  │        ├─ updateForm.jsp
 │  │        ├─ deleteForm.jsp
 │  │        ├─ success.jsp
 │  │        └─ failed.jsp
 │  └─ test
 │     └─ java
 └─ pom.xml

🖥 화면 구성 (Screenshots)

상품 등록 화면
createForm.jsp

상품 목록 화면
list.jsp

상품 상세 + 이미지 표시
detail.jsp

상품 수정 화면
updateForm.jsp

![create](docs/create.png)
![list](docs/list.png)
![detail](docs/detail.png)

🔗 주요 URL 매핑

기본 경로: /item

Method	URL	설명
GET	/item/createForm	상품 등록 폼
POST	/item/create	상품 등록 처리
GET	/item/list	상품 목록
GET	/item/detail	상품 상세
GET	/item/display?url=...	이미지 표시
GET	/item/updateForm	수정 폼
POST	/item/update	수정 처리
GET	/item/deleteForm	삭제 폼
POST	/item/delete	삭제 처리
⚙ 실행 전 필수 설정
1️⃣ 파일 업로드 경로 설정

application.properties

upload.path=C:/upload


⚠️ 반드시 실제 폴더를 미리 생성해야 합니다.

2️⃣ DB 설정
▶ Oracle 예시
spring.datasource.driver-class-name=oracle.jdbc.OracleDriver
spring.datasource.url=jdbc:oracle:thin:@localhost:1521/XEPDB1
spring.datasource.username=계정명
spring.datasource.password=비밀번호

3️⃣ MyBatis 설정
mybatis.mapper-locations=classpath:com/zeus/mapper/**/*.xml

🗄 DB 스키마 (Oracle 기준)
CREATE TABLE item (
  id NUMBER PRIMARY KEY,
  name VARCHAR2(200),
  price NUMBER,
  description VARCHAR2(2000),
  url VARCHAR2(500)
);

CREATE SEQUENCE item_seq
START WITH 1
INCREMENT BY 1;

▶ 실행 방법
개발 모드 실행
mvn spring-boot:run

WAR 파일 빌드
mvn clean package


결과물: target/springBootFileUpload.war

외부 Tomcat에 배포 가능

❗ Trouble Shooting
❌ 404 오류 (No static resource)

URL 오타 확인

@RequestMapping, @GetMapping 경로 확인

JSP는 반드시 WEB-INF 하위에 위치해야 함

❌ 405 Method Not Allowed

GET/POST 방식 불일치

<form method="post"> 여부 확인

컨트롤러 매핑 어노테이션 확인

❌ 파일 업로드 실패

upload.path 경로 존재 여부

폴더 쓰기 권한 확인

Windows 경로 구분자(C:/upload) 확인

📌 정리

이 프로젝트는
✔ Spring Boot MVC 구조 이해
✔ JSP 기반 CRUD 흐름
✔ 파일 업로드/다운로드 처리
✔ MyBatis 실전 연습을 목표로 한 학습용 예제 프로젝트입니다.
