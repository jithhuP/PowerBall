import requests
from bs4 import BeautifulSoup

    # 웹 페이지에서 HTML 코드 가져오기
def getWinningNumber(round_num: int):
    url = f"https://www.dhlottery.co.kr/happy.do?method=fundPressPrView&txtNo={round_num}"
    html = requests.get(url).text


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

#크롤링 한 데이터 직접 넣기
doc_ref = firebase_database.collection(u'users').document(u'user01')
doc_ref.set({
    u'level': 20,
    u'money': 700,
    u'job': "knight"
})

#내림차순 정렬
#firebase 링크
#https://console.firebase.google.com/u/4/project/powerball-2023/settings/general?hl=ko
