import 'package:flutter/material.dart';
import 'package:practice/main.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ftColor[1 + darkMode],
      appBar: AppBar(
        backgroundColor: ftColor[2 + darkMode],
        iconTheme: IconThemeData(
          color: ftColor[0 + darkMode],
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '알림',
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
