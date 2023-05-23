import 'package:flutter/material.dart';

// 최하단 메뉴 4개 버튼 Class
class icon_button extends StatelessWidget {
  final String text;
  final Color bdColor;
  final Color txtColor;
  final Color iconColor;
  final IconData icon;
  final double bdwidth;

  const icon_button({
    super.key,
    required this.bdColor,
    required this.iconColor,
    required this.txtColor,
    required this.text,
    required this.icon,
    required this.bdwidth,
  });

  @override
  Widget build(BuildContext context) {
    // 버튼 색상 및 테두리
    return Container(
      width: 90.0,
      height: 55.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        // 테두리
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
            // 아이콘
            Icon(
              icon,
              size: 40.0,
              color: iconColor,
            ),
            // 텍스트
            Text(
              text,
              style: TextStyle(
                color: txtColor,
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

// 굵은 텍스트 클래스(최근 추천 번호, 로또 번호 분석)
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
    // 텍스트
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

// 상호작용 버튼 클래스(알림, 메뉴)
class ActionButton extends StatelessWidget {
  final Color iconcolor;
  final IconData iCon;
  final double iconsize;
  final Widget linkedScreen;

  const ActionButton({
    super.key,
    required this.iconcolor,
    required this.iCon,
    required this.iconsize,
    required this.linkedScreen,
  });

  @override
  Widget build(BuildContext context) {
    // 상호작용 반응 클래스
    return GestureDetector(
      // 클릭에 반응
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // 해당 화면으로 이동
            builder: (context) => linkedScreen,
          ),
        );
      },
      // 아이콘
      child: Icon(
        iCon,
        size: iconsize,
        color: iconcolor,
      ),
    );
  }
}

// 메뉴 화면 텍스트 클래스
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
    // 텍스트
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        color: fontcolor,
        fontFamily: 'KBOGothic',
      ),
    );
  }
}

// 로또 번호 출력 클래스
class LottoBall extends StatelessWidget {
  final Color numColor;

  const LottoBall({
    super.key,
    required this.numColor,
  });

  @override
  Widget build(BuildContext context) {
    // 공 디자인 영역
    return Container(
      alignment: Alignment.center,
      height: 60,
      width: 60,
      // 색상
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: Colors.blue,
          width: 5.0,
        ),
      ),
      // 텍스트
      child: Text(
        '10',
        style: TextStyle(
          fontSize: 35.0,
          fontFamily: 'Jersey',
          color: numColor,
        ),
      ),
    );
  }
}
