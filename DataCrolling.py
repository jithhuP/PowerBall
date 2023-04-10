import requests
from bs4 import BeautifulSoup

# 웹 페이지에서 HTML 코드 가져오기
url = 'https://www.dhlottery.co.kr/gameResult.do?method=byWin'
html = requests.get(url).text

# HTML 코드를 파싱하여 필요한 데이터 추출
soup = BeautifulSoup(html, 'html.parser')
winning_numbers = []

winning_count = soup.select('div.win_result > h4 > strong')
winning_numbers.append(winning_count)


for i in range(7):
    num = soup.select('p > span', {'class': ''})[i].text
    winning_numbers.append(num)

print(winning_numbers)