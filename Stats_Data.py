import requests
from bs4 import BeautifulSoup
#pip install firebase-admin // firebase download

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

array_size = 46
my_array = [0] * array_size

    # 웹 페이지에서 HTML 코드 가져오기
def getWinningNumber(round_num: int):
    url = f"https://dhlottery.co.kr/gameResult.do?method=byWin&drwNo={round_num}"
    html = requests.get(url).text

# HTML 코드를 파싱하여 필요한 데이터 추출
    soup = BeautifulSoup(html, 'html.parser')

#로또 번호 데이터 추출
    for i in range(7):
        num = (soup.select('p > span', {'class': ''})[i].text)
        my_array[int(num)] += 1

Current_number = 1069 #현재 로또 최근 회차
Search_number = 1 #찾고자 하는 번호

#로또 통계 데이터 추출
for i in range(Search_number, Current_number+1):
    getWinningNumber(i)
    print(i)

#추출된 데이터를 DB에 저장
for i in range(1, 46):
     doc_ref = firebase_database.collection(u'PowerBall_Stats_Data').document(u'Sum')
     doc_ref.set({
     u'%d' % i: {my_array[i]}
})