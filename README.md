## 📘[중간프로젝트 DDOIT : DHRD 학습경험공유 커뮤니티 시스템]

> 팀 프로젝트로 개발된 학습 경험 공유 플랫폼입니다.
> 서로의 학습 경험을 나누며, 커뮤니티 속에서 지속적인 지식 공유와 성장을 도모합니다

---

## 📂 목차

* [📅 프로젝트 개요](#-프로젝트-개요)
* [👥 팀원 소개 및 역할](#-팀원-소개-및-역할)
* [💻 개발 환경 및 기술 스택](#-개발-환경-및-기술-스택)
* [🔧 주요 기능](#-주요-기능)
* [📁 프로젝트 구조](#-프로젝트-구조)
* [📷 주요 화면](#-주요-화면)
* [📌 ERD 및 다이어그램](#-erd-및-다이어그램)
* [📝 문의](#-문의)

---

## 📅 프로젝트 개요

* **프로젝트명** : DDOIT (DHRD 학습경험공유 커뮤니티 시스템)
* **기간** : 2023.10.06 \~ 2023.11.19
* **목표** : 사용자 간 학습 경험을 공유하고, 커뮤니티를 형성하여 지식의 순환과 지속적인 동기 부여를 도모하는 것
* **선정배경** : 서로 다른 교육과정의 학생들 사이의 소통 부족과
지속적인 학습 동기 부여의 필요성에서 출발한 커뮤니티 시스템입니다.
개발원에서 긴 시간을 보내는 학생들이
공부 외에도 자격증 정보, 학원 일정, 일상 콘텐츠를 자유롭게 공유함으로써
정보 교류와 학습 의욕 고취를 동시에 실현할 수 있도록 기획되었습니다.

본 프로젝트는 단순한 커뮤니티를 넘어,
학습의 즐거움과 지속 가능성을 제공하는 플랫폼 구축을 목표로 합니다.
---

## 👥 팀원 소개 및 역할

| 이름  | 역할 | 담당 역할                      |
| --- | -- | -------------------------- |
| 홍두표 | PL | 24시간 제한 게시글 , 무한스크롤                 |
| 길준희 | UA | 자격증일정 게시판, 시간표게시판, 학습플래너      |
| 유대현 | DA | 디버깅게시판, 댓글,답글,좋아요,채택              |
| 오세인 | AA | 프로필관리, 카카오맵, 상점/포인트카카오페이결제  |
| 박현준 | TA | 문의게시판, 공지사항게시판                      |

---

## 💻 개발 환경 및 기술 스택

* **개발언어**: Java, JSP, HTML5, XML, CSS3, JavaScript(Ajax, JSON)
* **프레임워크**: mybatis, jQuery, Bootstrap, 
* **라이브러리**: FullCalendar
* **협업툴**: GitHub, SVN, Discord
* **개발툴**: Eclipse, Maven, ERDCloud, Vs code
* **클라우드서비스 or 기타 툴**: AWS, Docker
* **데이터베이스**: Oracle DB, SQL Developer
* **기능**: JSP, Servlet, JDBC ??? 이건 어디에???

---

## 🔧 주요 기능

* 회원 관리: 회원 가입, 로그인, 프로필 수정
* 게시판: 학습 경험 공유 게시판(무한스크롤), 댓글 기능
* 검색: 키워드 기반 검색
* 알림: 새 댓글 및 게시글 알림
* 관리자 기능: 회원 관리, 게시글 관리
* 자격증시험일정관리, 시간표관리 (FullCalendar)

---

## 📁 프로젝트 구조

```
DDOIT/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── ddoit/
│   │   │           ├── controller/
│   │   │           ├── dao/
│   │   │           ├── dto/
│   │   │           ├── service/
│   │   │           └── util/
│   │   └── resources/
│   │       └── static/
│   │       └── templates/
├── build/
├── .classpath
├── .project
└── README.md
```

---

## 📷 주요 화면
> 로그인
![image](https://github.com/user-attachments/assets/5af5bbdf-a008-4119-8258-b853b4cc6eed)
> 회원가입
![image](https://github.com/user-attachments/assets/4b517aab-4c68-4cab-8372-5a57032aaad0)
> 아이템상점
![image](https://github.com/user-attachments/assets/97f77944-bdc8-452c-96ea-a42bdf27985a)
> 위시리스트
![image](https://github.com/user-attachments/assets/cc758b63-b8e8-464d-9e14-5462d9860a61)
> 내 아이템
![image](https://github.com/user-attachments/assets/48c8128a-d86b-4554-bae6-10f3ebad7c9a)
> 카카오페이결제하기
![image](https://github.com/user-attachments/assets/5619819a-57b9-4f32-bec7-d965482b00f5)
> 자격증일정관리
![image](https://github.com/user-attachments/assets/e78fe413-069d-4b62-80e2-055c293d5641)
> 시간표

> 게시판, 기억복잡, 관리자 화면 등

---

## 📌 ERD 및 다이어그램

> DB 구조와 시스템 전체 구조를 ERD가 포함하세요.
> (보유중이라면 이미지가 포함된 경로를 설정해주세요)

---

