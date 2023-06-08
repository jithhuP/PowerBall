import 'package:flutter/material.dart';
import 'package:practice/loading_data.dart';
import 'package:practice/main.dart';
import 'package:url_launcher/url_launcher.dart';

// 최하단 메뉴 4개 버튼 Class
class icon_button extends StatelessWidget {
  final String text;
  final Color bdColor;
  final Color txtColor;
  final Color iconColor;
  final IconData icon;
  final double bdwidth;
  final Widget linkedScreen;

  const icon_button({
    super.key,
    required this.bdColor,
    required this.iconColor,
    required this.txtColor,
    required this.text,
    required this.icon,
    required this.bdwidth,
    required this.linkedScreen,
  });

  @override
  Widget build(BuildContext context) {
    // 버튼 색상 및 테두리
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
        child: Container(
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
        ));
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

// 데이터 불러오기 및 LottoBall 에 적용
class LoadingLottoNum extends StatelessWidget {
  const LoadingLottoNum({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> ballColor = [
      Colors.blue,
      Colors.red,
      Colors.yellow,
      Colors.green,
      Colors.white,
      Colors.deepOrange,
      Colors.lime
    ];
    return FutureBuilder(
      future: getDataNum(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<dynamic>? data = snapshot.data;
          return Row(
            children: [
              for (int i = 0; i < 7; i++) ...[
                LottoBall(
                  numColor: ftColor[0 + darkMode],
                  num: data![i],
                  ballColor: ballColor[i],
                ),
                const SizedBox(
                  width: 5,
                ),
              ]
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

// 로또 번호 출력 클래스
class LottoBall extends StatelessWidget {
  final Color numColor;
  final String num;
  final Color ballColor;

  const LottoBall({
    super.key,
    required this.numColor,
    required this.num,
    required this.ballColor,
  });

  @override
  Widget build(BuildContext context) {
    // 공 디자인 영역
    return Container(
      alignment: Alignment.center,
      height: 49,
      width: 49,
      // 색상
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            spreadRadius: 2,
            blurRadius: 1,
            blurStyle: BlurStyle.inner,
          ),
        ],
        color: ballColor,
        borderRadius: BorderRadius.circular(30.0),
        border: Border.all(
          color: ballColor,
          width: 5.0,
        ),
      ),
      // 텍스트
      child: Text(
        num,
        style: TextStyle(
          fontSize: 30.0,
          fontFamily: 'Jersey',
          color: numColor,
        ),
      ),
    );
  }
}

class LinkArticle extends StatelessWidget {
  const LinkArticle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(
        Uri.parse('https://www.lotto.co.kr/article/list/AC01'),
      ),
      child: Container(
        alignment: Alignment.centerLeft,
        width: double.infinity,
        height: 75.0,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(width: 3.0),
          ),
        ),
        child: const Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "기사1 제목",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontFamily: 'KBOGothic',
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
