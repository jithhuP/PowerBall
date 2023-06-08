import requests
from bs4 import BeautifulSoup

url = 'https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=103/'
response = requests.get(url)
html = response.text
soup = BeautifulSoup(html, 'html.parser')

articles = soup.find_all('a', class_='nclicks(cls_eco.clsart)')

for article in articles:
    title = article.get_text()
    link = article['href']

    if '로또' in title:
        print('제목:', title)
        print('링크:', link)
        print()




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
#doc_ref = firebase_database.collection(u'users').document(u'user01')
#doc_ref.set({
#    u'level': 20,
#    u'money': 700,
#    u'job': "knight"
#})

#내림차순 정렬
#firebase 링크
#https://console.firebase.google.com/u/4/project/powerball-2023/settings/general?hl=ko
