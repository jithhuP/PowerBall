import 'package:flutter/material.dart';
import 'package:practice/custom_widget.dart';
import 'package:timer_builder/timer_builder.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        // 좌우 빈 공간을 넣음
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2.0,
          ),
          child: Column(
            children: [
              // 최상단 빈공간 넣음
              const SizedBox(
                height: 55.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 20.0,
                      ),
                      TimerBuilder.periodic(
                        const Duration(seconds: 1),
                        builder: (context) {
                          return Text(
                            '${DateTime.now().hour}:${DateTime.now().minute}',
                            style: const TextStyle(
                              fontFamily: 'JetBrainsMono',
                              fontSize: 45.0,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      //알림 영역 테두리
                      Icon(
                        Icons.add_alert_rounded,
                        size: 40.0,
                        color: Colors.black,
                      ),
                      //메뉴 영역 테두리
                      ActionButton(
                        iconcolor: Colors.black,
                        iCon: Icons.menu,
                        iconsize: 40.0,
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                // 최근 로또 번호
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          '최근 로또 번호',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 208,
                        ),
                        Text(
                          // 더보기 영역
                          '> 더보기',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                // 최근 로또 번호 이미지
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      // 이미지 1
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/flutter_logo.png'),
                        ),
                      ),
                    ),
                    Container(
                      // 이미지 2
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/flutter_logo.png'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Border_text(
                          text: "최근 로또 추천 번호",
                          bdColor: Colors.white,
                          txtColor: Colors.white,
                          fontsize: 22.0,
                          bdheight: 55.0,
                          pdsize: 8.5,
                        ),
                        Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        const Border_text(
                          text: "최근 6개월 내 분석",
                          bdColor: Colors.white,
                          txtColor: Colors.white,
                          fontsize: 22.0,
                          bdheight: 55.0,
                          pdsize: 12.5,
                        ),
                        Container(
                          width: 200.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 35.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    icon_button(
                      icon: Icons.description_outlined,
                      text: '기사',
                      bdColor: Colors.white,
                      bdwidth: 2.5,
                    ),
                    icon_button(
                      icon: Icons.onetwothree,
                      text: '로또',
                      bdColor: Colors.white,
                      bdwidth: 2.5,
                    ),
                    icon_button(
                      icon: Icons.add_chart_sharp,
                      text: '분석',
                      bdColor: Colors.white,
                      bdwidth: 2.5,
                    ),
                    icon_button(
                      icon: Icons.diamond_outlined,
                      text: '행운',
                      bdColor: Colors.white,
                      bdwidth: 2.5,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
