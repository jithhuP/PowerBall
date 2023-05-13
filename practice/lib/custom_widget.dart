import 'package:flutter/material.dart';
import 'setting_screen.dart';

class icon_button extends StatelessWidget {
  final String text;
  final Color bdColor;
  final IconData icon;
  final double bdwidth;

  const icon_button({
    super.key,
    required this.bdColor,
    required this.text,
    required this.icon,
    required this.bdwidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 55.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        border: Border.all(
          color: bdColor,
          width: bdwidth,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              icon,
              size: 40.0,
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontFamily: 'KBOGothic',
              ),
            ),
          ],
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
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: txtColor,
        fontSize: fontsize,
        fontFamily: 'KBOGothic',
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final Color iconcolor;
  final IconData iCon;
  final double iconsize;

  const ActionButton(
      {super.key,
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
      // 메뉴 영역
      child: Icon(
        iCon,
        size: iconsize,
        color: iconcolor,
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
