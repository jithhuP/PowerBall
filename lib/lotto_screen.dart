import 'package:flutter/material.dart';
import 'package:practice/main.dart';
import 'custom_widget.dart';

class LottoScreen extends StatelessWidget {
  const LottoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 배경 색상
      backgroundColor: ftColor[1 + darkMode],
      appBar: AppBar(
        backgroundColor: ftColor[2 + darkMode],
        // 화살표 색상
        iconTheme: IconThemeData(
          color: ftColor[0 + darkMode],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Bar 텍스트
            Text(
              '로또 추천',
              style: TextStyle(
                color: ftColor[0 + darkMode],
                fontFamily: "KBOGothic",
              ),
            ),
          ],
        ),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 50.0,
          ),
          Text(
            '이번 추천 번호는...',
            style: TextStyle(
              fontSize: 35.0,
              fontFamily: 'KBOGothic',
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          RecommendLotto(),
        ],
      ),
    );
  }
}
