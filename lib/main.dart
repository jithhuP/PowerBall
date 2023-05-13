import 'package:flutter/material.dart';
import 'package:practice/custom_widget.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 162, 255, 212),
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
                            DateFormat('HH:mm').format(DateTime.now()),
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
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'KBOGothic',
                          ),
                        ),
                        SizedBox(
                          width: 205,
                        ),
                        // 더보기 영역
                        Text(
                          '> 더보기',
                          style: TextStyle(
                            fontFamily: 'KBOGothic',
                            color: Colors.black,
                            fontSize: 18.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: AlignmentDirectional.center,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 4.0,
                  ),
                  color: const Color.fromARGB(255, 180, 250, 162),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child:
                      LottoBall(), /*Text(
                    '1 - 2 - 3 - 4 - 5 - 6',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 45.0,
                    ),
                  ),*/
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Border_text(
                          text: "최근 추천 번호",
                          bdColor: Colors.black,
                          txtColor: Colors.black,
                          fontsize: 22.0,
                          bdheight: 55.0,
                          pdsize: 8.5,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        // 통계 : 최근 추천 번호
                        Container(
                          width: 195.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 4.0,
                            ),
                          ),
                          // child: ,
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Border_text(
                          text: "로또 번호 분석",
                          bdColor: Colors.black,
                          txtColor: Colors.black,
                          fontsize: 22.0,
                          bdheight: 55.0,
                          pdsize: 12.5,
                        ),
                        const SizedBox(
                          height: 15.0,
                        ),
                        // 통계 : 로또 번호 분석
                        Container(
                          width: 195.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: Colors.black,
                              width: 4.0,
                            ),
                          ),
                          // child: ,
                        ),
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
                    // 버튼 : 기사
                    icon_button(
                      icon: Icons.description_outlined,
                      text: '기사',
                      bdColor: Colors.black,
                      bdwidth: 2.5,
                    ),
                    // 버튼 : 로또
                    icon_button(
                      icon: Icons.onetwothree,
                      text: '로또',
                      bdColor: Colors.black,
                      bdwidth: 2.5,
                    ),
                    // 버튼 : 분석
                    icon_button(
                      icon: Icons.add_chart_sharp,
                      text: '분석',
                      bdColor: Colors.black,
                      bdwidth: 2.5,
                    ),
                    // 버튼 : 행운
                    icon_button(
                      icon: Icons.diamond_outlined,
                      text: '행운',
                      bdColor: Colors.black,
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
