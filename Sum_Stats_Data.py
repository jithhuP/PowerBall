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

# 'users' 컬렉션의 참조를 가져옵니다
users_ref = db.collection('PowerBall_Stats_Data')

# 'users' 컬렉션의 모든 문서를 가져옵니다
docs = users_ref.get()

# 숫자를 저장할 배열을 초기화합니다
numbers = []

# 배열에 저장된 숫자들을 출력합니다
print(docs[0])