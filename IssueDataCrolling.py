import requests # HTTP 요청처리를 위해 사용하는 모듈이다. 
from bs4 import BeautifulSoup # HTML 및 XML 파일에서 원하는 데이터를 손쉽게 Parsing 할 수 있는 Python 라이브러리다.  

# # 보안뉴스 사이트내 기사 제목 추출 구간이다. # 
url = 'https://www.boannews.com/media/o_list.asp' # 크롤링할 주소를 입력하는 구간이다. 
response = requests.get(url) # HTTP 요청처리를 GET방식으로 response라는 변수한테 주는 구간이다. 
html = response.text # 응답을 읽고 텍스트를 반환하는 구간이다. 
soup = BeautifulSoup(html, 'html.parser') # 해당 값을 parser하는 구간이다. 
value = soup.find_all('span',class_="news_txt") # 특정 값을 추출하는 구간이다. 
count = 1 
titlelist = [] 
for _ in value: # 기사 제목만 추출 하는 구간이다. 
    vlaue2 = _.get_text() 
    print(count,end=". ") 
    print(vlaue2,end="\n") 
    titlelist.append(vlaue2) # 기사 제목을 추출해 따로 저장해두는 구간이다. 
    count += 1 
    
# 관심 기사를 선택 하는 구간이다 # 
number = int(input("관심 기사의 번호를 입력하세요 : ")) 
searchvalue = titlelist[number-1] # 관심 기사를, 제목을 저장해둔 곳에서 가져오는 구간이다.



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
