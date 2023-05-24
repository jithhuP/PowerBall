import requests
from bs4 import BeautifulSoup

    # 웹 페이지에서 HTML 코드 가져오기
def getWinningNumber(round_num: int):
    url = f"https://www.dhlottery.co.kr/happy.do?method=fundPressPrView&txtNo={round_num}"
    html = requests.get(url).text

#내림차순 정렬
#firebase 링크
#https://console.firebase.google.com/u/4/project/powerball-2023/settings/general?hl=ko
