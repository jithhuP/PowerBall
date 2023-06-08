import requests
from bs4 import BeautifulSoup

# 보안뉴스 사이트내 기사 제목 추출 구간이다.
url = 'https://www.boannews.com/media/o_list.asp'
response = requests.get(url)
html = response.text
soup = BeautifulSoup(html, 'html.parser')
value = soup.find_all('span', class_='news_txt')

count = 1
titlelist = []

for item in value:  # 기사 제목만 추출하는 구간이다.
    title = item.get_text()
    print(count, end=". ")
    print(title)
    titlelist.append(title)  # 기사 제목을 추출해 따로 저장해두는 구간이다.
    count += 1

# 관심 기사를 선택하는 구간이다.
number = int(input("관심 기사의 번호를 입력하세요: "))
searchvalue = titlelist[number - 1]  # 관심 기사를, 제목을 저장해둔 곳에서 가져오는 구간이다.

# 선택한 기사를 크롤링하는 구간이다.
searchvalue_encoded = requests.utils.quote(searchvalue)  # 검색어 인코딩
search_url = f'https://www.boannews.com/search/news_total.asp?search=title&find={searchvalue_encoded}'
response2 = requests.get(search_url)
html2 = response2.text
soup2 = BeautifulSoup(html2, 'html.parser')
value3 = soup2.find('div', class_='news_content')

if value3:
    article_content = value3.get_text()
    print('\n기사 내용:\n', article_content)
else:
    print('\n해당 기사를 찾을 수 없습니다.')




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
