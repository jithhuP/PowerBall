import 'package:flutter/material.dart';
import 'package:practice/main.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ftColor[1 + darkMode],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('알림'),
          ],
        ),
      ),
    );
  }
}
