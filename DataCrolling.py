import requests
from bs4 import BeautifulSoup

#pip install firebase-admin // firebase download

    # 웹 페이지에서 HTML 코드 가져오기
def getWinningNumber(round_num: int):
    url = f"https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo={round_num}"
    html = requests.get(url).text

# HTML 코드를 파싱하여 필요한 데이터 추출
    soup = BeautifulSoup(html, 'html.parser')
    winning_numbers = []
    winning_data = []

#로또 상세 데이터 추출 
    winning_chat = soup.select('div.win_result > h4 > strong')[0]
    winning_data.append(winning_chat.text)
    winning_chat = soup.find('p', {'class': 'desc'})
    winning_data.append(winning_chat.text)


#로또 번호 데이터 추출
    for i in range(7):
        num = soup.select('p > span', {'class': ''})[i].text
        winning_numbers.append(num)
        winning_data.append(num)

#로또 데이터 출력
    print(winning_data)

#getWinningNumber의 내용 값을 출력하는 반복문
for i in range(1, 5):
    getWinningNumber(i)

import firebase_admin
from firebase_admin import credentials
from firebase_admin import db
from firebase_admin import firestore


#서비스 계정 키 파일 경로
cred = credentials.Certificate("C:/firebase/key.json")
firebase_admin.initialize_app(cred, {
  'projectId': 'powerball-2023',
})
firebase_database = firestore.client()

#파일 데이터 직접 넣기
doc_ref = firebase_database.collection(u'users').document(u'user01')
doc_ref.set({
    u'level': 20,
    u'money': 700,
    u'job': "knight"
})


#링크 데이터 추가하기.
#기사 크롤링 파일 하나 더 만들기
#내용 정리하기.
#firebase에 데이터 값 집어넣기.
#파일로 만든 후 데이터를 추가할 것인지 아니면 그냥 직접적으로 firebase에 넣을 것인지 생각하기.



#참고 링크#
#https://yogyui.tistory.com/entry/PythonBeautifulSoup-%EB%A1%9C%EB%98%90-645-%EB%8B%B9%EC%B2%A8%EB%B2%88%ED%98%B8-%ED%81%AC%EB%A1%A4%EB%A7%81