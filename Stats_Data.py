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
    num = (soup.select('p > span', {'class': ''})[0].text)
    my_array[int(num)] += 1
    num = (soup.select('p > span', {'class': ''})[1].text)
    my_array[int(num)] += 1
    num = (soup.select('p > span', {'class': ''})[2].text)
    my_array[int(num)] += 1
    num = (soup.select('p > span', {'class': ''})[3].text)
    my_array[int(num)] += 1
    num = (soup.select('p > span', {'class': ''})[4].text)
    my_array[int(num)] += 1
    num = (soup.select('p > span', {'class': ''})[5].text)
    my_array[int(num)] += 1
    num = (soup.select('p > span', {'class': ''})[6].text)
    my_array[int(num)] += 1
Current_number = 1069 #현재 로또 최근 회차 1069
Search_number = 1 #찾고자 하는 번호

#로또 통계 데이터 추출
for i in range(Search_number, Current_number+1):
    getWinningNumber(i)
    print(i)

#추출된 데이터를 DB에 저장

doc_ref = firebase_database.collection(u'PowerBall_Stats_Data').document(u'total')
doc_ref.set({
    u'1': my_array[1],
    u'2': my_array[2],
    u'3': my_array[3],
    u'4': my_array[4],
    u'5': my_array[5],
    u'6': my_array[6],
    u'7': my_array[7],
    u'8': my_array[8],
    u'9': my_array[9],
    u'10': my_array[10],
    u'11': my_array[11],
    u'12': my_array[12],
    u'13': my_array[13],
    u'14': my_array[14],
    u'15': my_array[15],
    u'16': my_array[16],
    u'17': my_array[17],
    u'18': my_array[18],
    u'19': my_array[19],
    u'20': my_array[20],
    u'21': my_array[21],
    u'22': my_array[22],
    u'23': my_array[23],
    u'24': my_array[24],
    u'25': my_array[25],
    u'26': my_array[26],
    u'27': my_array[27],
    u'28': my_array[28],
    u'29': my_array[29],
    u'30': my_array[30],
    u'31': my_array[31],
    u'32': my_array[32],
    u'33': my_array[33],
    u'34': my_array[34],
    u'35': my_array[35],
    u'36': my_array[36],
    u'37': my_array[37],
    u'38': my_array[38],
    u'39': my_array[39],
    u'40': my_array[40],
    u'41': my_array[41],
    u'42': my_array[42],
    u'43': my_array[43],
    u'44': my_array[44],
    u'45': my_array[45]
})

#코드를 길게 쓴 이유는 코드량을 늘리기 위함이 아닌, 자꾸 컴퓨터가 반복 2중첩 반복문을 사용할 때
#더 자주 멈추는 현상이 나타나서 100개 이하의 단순한 반복코드는 그냥 쓰는게 낮지 않을까라는 생각에 제작했다.