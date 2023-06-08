import requests
from bs4 import BeautifulSoup

news_url = 'https://search.naver.com/search.naver?where=news&sm=tab_jum&query={}'
query = input('검색할 키워드 입력 : ')
query = query.replace(' ', '+')

req = requests.get(news_url.format((query)))
print("URL : ", news_url.format((query)))
#print(req.text)

soup = BeautifulSoup(req.text, 'html.parser')
print("검색 결과".format((query)))

a_list = soup.find_all('a', {'class': 'news_tit'})

for a in a_list :
    print("제목 : ", a.get('title'))
    print("링크 : ", a.get('href'))

    


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
