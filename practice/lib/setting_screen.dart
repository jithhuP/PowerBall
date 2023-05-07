import 'package:flutter/material.dart';
import 'custom_widget.dart';

class SettingScreen extends StatelessWidget {
  final String version = "0.0.0.0";
  final String date = "23-05-07";
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('설정'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SettingText(
            text: "App 정보",
            fontcolor: Colors.black,
            fontsize: 25.0,
          ),
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
    );
  }
}
