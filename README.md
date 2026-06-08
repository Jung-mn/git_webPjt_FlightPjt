# AirplanePjt / FlightPjt

항공권 검색 및 회원 관리 기능을 제공하는 웹 애플리케이션 프로젝트입니다.  
이 저장소에는 **FlightPjt**(Spring MVC, 본격 구현)와 **AirplanePjt**(Spring Boot, 초기 스캐폴드) 두 모듈이 포함되어 있습니다.

## 프로젝트 소개

FlightPjt는 Amadeus Test API를 연동하여 출발지·도착지·날짜 조건으로 항공편을 검색하고, 회원가입·로그인·마이페이지·아이디/비밀번호 찾기 등 회원 기능을 제공합니다.

AirplanePjt는 Spring Boot 기반의 기본 프로젝트 구조만 갖춘 모듈로, 홈 화면 렌더링 수준의 구현입니다.

---

## FlightPjt (메인 애플리케이션)

### 기술 스택

| 구분 | 기술 |
|------|------|
| 언어 | Java 17 |
| 프레임워크 | Spring MVC 5.3.26 |
| 뷰 | JSP, JSTL |
| 서버 | Apache Tomcat (WAR 배포) |
| 데이터베이스 | MySQL 8.x |
| DB 접근 | Spring JDBC (`NamedParameterJdbcTemplate`, DBCP2) |
| 외부 API | Amadeus Flight Offers Search API |
| HTTP 클라이언트 | Spring WebClient (Reactor Netty) |
| JSON 처리 | Jackson |
| 빌드 | Maven |

### 아키텍처

Spring MVC 계층형 구조를 따릅니다.

```
[브라우저]
    ↓
[CharacterEncodingFilter]
    ↓
[DispatcherServlet]
    ↓
[Controller] → [Service] → [DAO] → [MySQL]
                ↓
         [WebClient] → [Amadeus API]
    ↓
[JSP View]
```

### 디렉터리 구조

```
FlightPjt/
├── pom.xml
└── src/main/
    ├── java/com/office/flight/
    │   ├── HomeController.java
    │   ├── config/
    │   │   ├── WebClientConfig.java
    │   │   └── FlightBeanNameGenerator.java
    │   ├── amadeus/
    │   │   └── FlightSearchService.java
    │   └── user/
    │       ├── UserHomeController.java
    │       ├── FlightSearchController.java
    │       └── member/
    │           ├── UserMemberController.java
    │           ├── UserMemberService.java
    │           ├── UserMemberDao.java
    │           └── UserMemberVo.java
    ├── resources/
    │   └── log4j.xml
    └── webapp/
        ├── WEB-INF/
        │   ├── web.xml
        │   ├── spring/
        │   │   ├── root-context.xml
        │   │   └── appServlet/servlet-context.xml
        │   └── views/
        │       ├── includes/ (header.jsp, footer.jsp)
        │       └── user/
        │           ├── home.jsp
        │           ├── flightResults.jsp
        │           └── member/ (*.jsp)
        └── resources/
```

### 주요 기능

#### 항공권 검색

- 출발지·도착지 공항 코드, 출발일(·귀국일) 입력
- Amadeus API(`/v2/shopping/flight-offers`) 호출
- 검색 결과를 `flightResults.jsp`에 표시 (소요 시간 변환 포함)
- 왕복 검색 시 출발·귀국 항공편을 각각 조회

#### 회원 관리 (`/user/member/*`)

| 기능 | URL | 설명 |
|------|-----|------|
| 회원가입 | `GET/POST /user/member/join` | 회원 등록 |
| 로그인 | `GET/POST /user/member/login` | 세션 기반 로그인 |
| 로그아웃 | `GET /user/member/logout` | 세션 무효화 |
| 아이디 찾기 | `GET/POST /user/member/findId` | 이름·전화번호로 조회 |
| 비밀번호 찾기 | `GET/POST /user/member/findPassword` | 아이디·전화번호로 조회 |
| 마이페이지 | `GET /user/member/mypage` | 회원 정보 확인 |
| 프로필 수정 | `GET/POST /user/member/editProfileForm`, `updateProfile` | 회원 정보 수정 |

### 데이터베이스

| 항목 | 값 |
|------|-----|
| DB 이름 | `airplane_db` |
| URL | `jdbc:mysql://localhost:3306/airplane_db` |
| 사용자 | `root` |
| Connection Pool | Apache Commons DBCP2 (`BasicDataSource`) |

설정 위치: `WEB-INF/spring/appServlet/servlet-context.xml`

### 외부 API (Amadeus)

| 항목 | 값 |
|------|-----|
| Base URL | `https://test.api.amadeus.com` |
| 엔드포인트 | `/v2/shopping/flight-offers` |
| 인증 | Bearer Token (OAuth Access Token) |

> API 액세스 토큰은 `FlightSearchController`에 설정되어 있습니다. 운영 환경에서는 환경 변수 또는 별도 설정 파일로 분리하는 것을 권장합니다.

### 실행 방법 (FlightPjt)

#### 사전 요구 사항

- JDK 17
- Apache Tomcat 9.x 이상
- MySQL 8.x
- Maven
- Amadeus Developer 계정 및 API 토큰

#### 설정

1. MySQL에 `airplane_db`를 생성하고 `member` 테이블을 준비합니다.
2. `servlet-context.xml`의 DataSource 접속 정보를 로컬 환경에 맞게 수정합니다.
3. Amadeus API 액세스 토큰을 발급받아 `FlightSearchController`에 반영합니다.
4. Eclipse + m2e-wtp 또는 Maven으로 WAR를 빌드한 뒤 Tomcat에 배포합니다.

```bash
cd FlightPjt
mvn clean package
```

#### 접속 URL

```
http://localhost:8080/
```

루트(`/`) 접속 시 `/user/` 홈 화면으로 리다이렉트됩니다.

---

## AirplanePjt (Spring Boot 스캐폴드)

### 기술 스택

| 구분 | 기술 |
|------|------|
| 언어 | Java 17 |
| 프레임워크 | Spring Boot 3.1.4 |
| 뷰 | JSP |
| 데이터베이스 | MySQL 8.x (설정만 존재) |
| 빌드 | Maven |

### 디렉터리 구조

```
AirplanePjt/
├── pom.xml
└── src/main/
    ├── b0x/
    │   ├── AirplaneApplication.java
    │   └── HomeController.java
    ├── resources/
    │   └── application.properties
    └── webapp/
        └── WEB-INF/views/
            └── home.jsp
```

### 실행 방법 (AirplanePjt)

```bash
cd AirplanePjt
mvn spring-boot:run
```

| 항목 | 값 |
|------|-----|
| 포트 | `8085` |
| 접속 URL | `http://localhost:8085/` |

> 현재 홈 페이지(`GET /`) 렌더링만 구현되어 있으며, FlightPjt에 비해 기능이 제한적입니다.

---

## 두 모듈 비교

| 항목 | FlightPjt | AirplanePjt |
|------|-----------|-------------|
| 프레임워크 | Spring MVC 5.3 | Spring Boot 3.1 |
| 배포 방식 | WAR (외부 Tomcat) | 내장 Tomcat |
| 아키텍처 | Controller → Service → DAO | Controller only |
| 항공 검색 | Amadeus API 연동 | 미구현 |
| 회원 기능 | 전체 구현 | 미구현 |
| DB | `airplane_db` (JDBC) | 설정만 존재 |

## 참고 사항

- 비밀번호 암호화(BCrypt) 코드는 `UserMemberService`에 주석 처리된 상태입니다.
- 정적 리소스 및 업로드 이미지 경로는 `servlet-context.xml`의 `mvc:resources`에 설정되어 있습니다.
- DB 접속 정보와 API 토큰이 소스·설정 파일에 포함되어 있으므로, 공개 저장소에 올릴 때는 반드시 별도 관리가 필요합니다.
