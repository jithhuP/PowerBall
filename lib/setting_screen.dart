import 'package:flutter/material.dart';
import 'package:practice/main.dart';
import 'custom_widget.dart';

class SettingScreen extends StatelessWidget {
  final String version = "0.0.0.0";
  final String date = "23-05-07";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ftColor[1 + darkMode],
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: ftColor[0 + darkMode],
        ),
        backgroundColor: ftColor[2 + darkMode],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '설정',
              style: TextStyle(
                color: ftColor[0 + darkMode],
                fontFamily: 'KBOGothic',
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SettingText(
              text: "App 정보",
              fontcolor: ftColor[0 + darkMode],
              fontsize: 25.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SettingText(
                    text: 'Version : $version',
                    fontcolor: ftColor[0 + darkMode],
                    fontsize: 15.0),
                SettingText(
                  text: 'Update date : $date',
                  fontcolor: ftColor[0 + darkMode],
                  fontsize: 15.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
