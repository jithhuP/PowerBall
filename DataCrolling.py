import requests
from bs4 import BeautifulSoup
raw = requests.get("https://tv.naver.com/r")
html = BeautifulSoup(raw.text,'html.parser')
#파이썬 소스코드가 실제 웹페이지 상으로는 어떤 것을 의미하는지 서로
#서로 연결해서 이해하는 것이 매우 중요하다. 모습이라는 그림과 실제 웹페이지에서의
#모습을 캡쳐하여 서로를 비교하였으니 이를 서로 비교하면서 이해하는 것이 매우 중요하고 그것을 잘 인식해야한다.

#1 컨테이너 Container 데이터 수집
container = html.select("div.inner")
print(container)
print(container[0])
#2 컨테이너 Container 내부 데이터 수집
title = container[0].select_one('dt.title')
like = container[0].select_one('span_like')
print(title.text.strip())
print(like.text.strip())



#BS4
#https://m.blog.naver.com/piry777/221696394407
#requests URL
#https://me2nuk.com/Python-requests-module-example/#:~:text=requests%20%EB%AA%A8%EB%93%88%EC%9D%B4%EB%9E%80%3F%20requests%EB%8A%94%20python%EC%82%AC%EC%9A%A9%EC%9E%90%EB%93%A4%EC%9D%84%20%EC%9C%84%ED%95%B4%20%EB%A7%8C%EB%93%A4%EC%96%B4%EC%A7%84%20%EA%B0%84%EB%8B%A8%ED%95%9C%20Python%EC%9A%A9,python%20%EC%93%B0%EB%A9%B4%EC%84%9C%20requests%20%EB%AA%A8%EB%93%88%EC%9D%84%20%EC%93%B0%EA%B2%8C%20%EB%90%98%EB%8A%94%20%EA%B2%BD%EC%9A%B0%EA%B0%80%20%EB%A7%8E%EC%9D%80%EB%8D%B0
#https://medium.com/@mjhans83/%ED%8C%8C%EC%9D%B4%EC%8D%AC%EC%9C%BC%EB%A1%9C-%ED%81%AC%EB%A1%A4%EB%A7%81-%ED%95%98%EA%B8%B0-908e78ee09e0
