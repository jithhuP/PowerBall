import requests
from bs4 import BeautifulSoup

url = "https://www.dhlottery.co.kr/gameResult.do?method=byWin"
html = requests.get(url).text
soup = BeautifulSoup(html, 'html.parser')

winning_numbers = []

# 로또 당첨번호 추출
for i in range(1, 7):
    num = soup.select(f"div.win_result > div > ul > li:nth-child({i}) > span")[0].text
    winning_numbers.append(num)

# 보너스 번호 추출
bonus_num = soup.select("div.win_result > div > div > span")[0].text

print("로또 당첨번호:", winning_numbers)
print("보너스 번호:", bonus_num)