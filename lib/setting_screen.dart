import 'package:flutter/material.dart';
import 'custom_widget.dart';

class SettingScreen extends StatelessWidget {
  final String version = "0.0.0.0";
  final String date = "23-05-07";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 162, 255, 212),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: const Color.fromARGB(255, 180, 250, 162),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              '설정',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'KBOGothic',
              ),
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: SettingText(
              text: "App 정보",
              fontcolor: Colors.black,
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
                    fontcolor: const Color.fromARGB(143, 0, 0, 0),
                    fontsize: 15.0),
                SettingText(
                  text: 'Update date : $date',
                  fontcolor: const Color.fromARGB(143, 0, 0, 0),
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
