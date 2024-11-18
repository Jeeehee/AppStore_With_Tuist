# 앱 스토어

- **아키텍처** - RIBs
- **의존성 관리 툴** - Tuist
- **개발환경** - Xcode 15.4 / Deployment target - iOS15
- **기간** - 2024년 9월 7일 (토) ~ 2024년 9월 11일 (수)

<br>

## [구현 사항]

- [x] 검색화면
- [x] 최근 검색어 목록
- [x] 최근 검색어와 일치 항목 리스트 표시
- [x] 검색 결과
- [x] 앱 상세화면
  - [x] 앱스토어로 이동하기 
  - [x] 앱스토어 링크 공유하기
- [x] 테스트코드

<br>

## [Unit Test Case]

- **UI 모듈**
  - [x] Image Asset 잘 가져와지는지
    
- **Service 모듈**
  - [x] API 잘 생성 되는지
  - [x] Query Parameter 와 URL 잘 생성 되는지
  - [x] API 요청 잘 되는지
    
- **Storage 모듈**
  - [x] Core Data 저장 잘 되는지
  - [x] Core Data 읽기 잘 되는지
  - [x] Core Data 삭제 잘 되는지
    
- **UsecaseImpl 모듈**
  - [x] 키워드 검색 잘 되는지
  - [x] 최근 검색어 히스토리 잘 가져와지는지
