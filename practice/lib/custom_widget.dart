import 'package:flutter/material.dart';
import 'setting_screen.dart';

class icon_button extends StatelessWidget {
  final Color bdColor;

  const icon_button({
    super.key,
    required this.bdColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: bdColor,
          width: 2.0,
        ),
      ),
    );
  }
}

class Border_text extends StatelessWidget {
  final String text;
  final Color bdColor;
  final Color txtColor;
  final double fontsize;
  final double bdheight;
  final double pdsize;

  const Border_text({
    super.key,
    required this.text,
    required this.bdColor,
    required this.txtColor,
    required this.fontsize,
    required this.bdheight,
    required this.pdsize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: bdheight,
      decoration: BoxDecoration(
        border: Border.all(
          color: bdColor,
          width: 2.2,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: pdsize),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: txtColor,
            fontSize: fontsize,
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Color bdcolor;
  final Color iconcolor;
  final IconData iCon;
  final double iconsize;

  const ActionButton(
      {super.key,
      required this.bdcolor,
      required this.iconcolor,
      required this.iCon,
      required this.iconsize});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const SettingScreen(),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: bdcolor,
          ),
        ),
        // 메뉴 영역
        child: Icon(
          iCon,
          size: iconsize,
          color: iconcolor,
        ),
      ),
    );
  }
}

class SettingText extends StatelessWidget {
  const SettingText({
    super.key,
    required this.text,
    required this.fontcolor,
    required this.fontsize,
  });

  final String text;
  final Color fontcolor;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: fontcolor,
      ),
    );
  }
}
