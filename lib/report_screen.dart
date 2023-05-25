import 'package:flutter/material.dart';
import 'package:practice/main.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

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
              '기사',
              style: TextStyle(
                color: ftColor[0 + darkMode],
                fontFamily: "KBOGothic",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
