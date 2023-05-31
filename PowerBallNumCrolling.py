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

count = 1
# Adding_document

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

    #크롤링 한 데이터 직접 넣기

    doc_ref = firebase_database.collection(u'PowerBall_num').document(u'%d' % count)
    doc_ref.set({
     u'Day': {winning_data[0],winning_data[1]},
     u'number': {winning_numbers[0],winning_numbers[0],winning_numbers[1],winning_numbers[2],winning_numbers[3],winning_numbers[4],winning_numbers[5],winning_numbers[6]}
})

#=====def 내용값 여기서 종료=====#

Current_number = 1069 #현재 로또 최근 회차
Search_number = 1 #찾고자 하는 번호
Add_number = 0

#getWinningNumber의 내용 값을 출력하는 반복문
for i in range(Search_number, Current_number+1):
    count = Search_number + Add_number
    getWinningNumber(i)
    Add_number+=1
    
#<찾고자 하는 값 = Search_num의 값을 변경하기>


#링크 데이터 추가하기.
#기사 크롤링 파일 하나 더 만들기
#내용 정리하기.
#firebase에 데이터 값 집어넣기.
#파일로 만든 후 데이터를 추가할 것인지 아니면 그냥 직접적으로 firebase에 넣을 것인지 생각하기.



#참고 링크#
#https://yogyui.tistory.com/entry/PythonBeautifulSoup-%EB%A1%9C%EB%98%90-645-%EB%8B%B9%EC%B2%A8%EB%B2%88%ED%98%B8-%ED%81%AC%EB%A1%A4%EB%A7%81