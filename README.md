# 공지
충북대학교 오픈소스기초프로젝트에서 진행하는 팀플레이 과제입니다.

팀이름: POWERBALL / 팀장: 윤정섭 / 팀원: 박상현, 팀원: 조민기

해당 오픈소스는 6월 10일 이후로 업데이트 및 수정을 할 수 없습니다.

# APP 설치 방법 

(추가)+APK 파일로 만들고 파일을 설치할 수 있게 해야함.


앱을 직접적으로 돌리고 싶을 경우 아래 방법을 통해 해결이 가능합니다.



## 설치 링크
[Flutter SDK](https://docs.flutter.dev/get-started/install/windows)(링크) SDK 파일을 다운 받는습니다. (해당 파일은 프로그램을 실행시키기 위한 zip 파일 입니다.) 

[Visual Studio](https://code.visualstudio.com/Download)(링크)혹은 [Android Studio](https://developer.android.com/studio)(링크)를 다운 받아 Flutter SDK 파일을 실행시킬 수 있습니다.

그 외에도 데이터 크롤링을 위한 추가적인 설치 파일이 존재합니다. 아래 (데이터 크롤링을 위한 추가적인 설치)에서 내용을 포함하고 있습니다.

## 설치 방법
* [블로그: 플러터 VS Code에서 개발환경 구축](https://fre2-dom.tistory.com/175)(링크)
* [블로그: Android Studio 에서 Flutter 시작하기](https://blog.yena.io/studynote/2020/02/04/Android-Flutter-Install.html)(링크)
위는 VS Code와 Android Studio에서 Flutter 개발환경을 구축하는 방법을 자세히 알려줍니다.  

# 의존성 (dependency)

## POWERBALL 프로젝트 정보

로또 APP 개발 프로젝트 입니다. 로또 번호를 추첨할 수 있으며, 최근 내가 추첨한 번호, 로또 번호 통계 그래프, 로또 관련 기사, 게임 등 다양한 재미를 즐길 수 있습니다. 


### 프로그램 구현 환경(OS)
- window (version - 10,11)

### 현재 프로그램 및 언어의 버전 정보
- Python (version - 3.11.0)
- bs4 (version - 4.12.2)
- requests (version - 2.31.0)
- firebase (version - 4.0.1)
- flutter (version - 3.10.1)
- VS Code (version - 1.75.1)
- Android Studio (version - 2022.2.1)

## 데이터 크롤링을 위한 추가적인 설치

추가적인 환경을 설정하기 위해서는 먼저 
* VS Code(visual studio code)
* Android Studio

설치 후, 해당 프로그램에서 (PowerShell) or (터미널) 을 찾습니다.
(PowerShell) or (터미널)에서 아래와 같이 원하는 패키지를 설치할 수 있습니다.

* bs4 
    ```c
    pip install beautifulsoup4
    /*(설명):
    beautifulsoup4는 파이썬에서 HTML 및 XML 문서를 파싱하고 검색, 조작하기 위한 라이브러리입니다. HTML 또는 XML 형식의 문서에서 데이터를 추출하거나 원하는 요소를 탐색하는 등 다양한 웹 스크래핑 작업에 사용됩니다. 웹 페이지 크롤링이나 데이터 마이닝과 같은 작업에서 유용하게 활용될 수 있습니다.
    */
    ```

* requests
    ```c
    pip install requests
    /*(설명):
    requests는 파이썬에서 HTTP 요청을 보내고 받는 데 사용되는 간편하고 인기 있는 라이브러리입니다. requests를 사용하면 웹 페이지에 GET, POST, PUT, DELETE 등의 HTTP 요청을 보내고, 응답을 받아오며, 쿠키, 세션 관리 등을 처리할 수 있습니다. HTTP 클라이언트를 구현하는 데 편리한 기능을 제공합니다.
    */
    ```

* firebase
    ```c
    pip install firebase-admin
    /*(설명):
    firebase-admin은 파이썬에서 Firebase 백엔드 서비스와 상호 작용하기 위한 공식 Firebase Admin SDK입니다. Firebase의 다양한 기능에 접근하고 관리할 수 있는 API를 제공하여 사용자 관리, 데이터베이스 연동, 푸시 알림 등을 처리할 수 있습니다.
    */
    ```

 데이터 크롤링에서 bs4, requests 를 설치 후 원하는 데이터를 얻을 수 있으며, 데이터 관리를 위해 firebase를 사용할 수 잇습니다.


# 연락처(Contact information)
프로젝트 총괄, 데이터 수집 담당: 
 * 윤정섭 (email - cbnuyjs2022@gmail.com)

프로젝트 디자인 담당:
 * 박상현 (email - )
 * 조민기 (email - jominki4637@gmail.com)

# 라이선스 및 약관
 * [Github 이용 약관](https://docs.github.com/en/site-policy/github-terms/github-terms-of-service)
 * [Flutter Engine License](https://github.com/flutter/flutter/blob/master/LICENSE)
 * [Flutter Framework License](https://github.com/flutter/flutter/blob/master/LICENSE)
