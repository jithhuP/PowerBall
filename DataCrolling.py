import requests
from bs4 import BeautifulSoup

# 웹 페이지에서 HTML 코드 가져오기
url = 'https://www.dhlottery.co.kr/gameResult.do?method=byWin'
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
    winning_data.append(num)
    
print(winning_data)