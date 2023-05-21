import 'package:flutter/material.dart';
import 'package:practice/custom_widget.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/intl.dart';

List<Color> ftColor = [
  Colors.black,
  const Color.fromARGB(255, 162, 255, 212),
  const Color.fromARGB(255, 180, 250, 162),
  Colors.amber,
  Colors.black,
  const Color.fromARGB(255, 34, 34, 34)
];

int darkMode = 0;
bool isSwitched = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return App();
  }
}

void main() {
  runApp(const MyApp());
}

class App extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: ftColor[1 + darkMode],
        // 좌우 빈 공간을 넣음
        body: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 2.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 최상단 빈공간 넣음
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.dark_mode,
                    size: 35.0,
                    color: ftColor[0 + darkMode],
                  ),
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      setState(() {
                        value ? darkMode = 3 : darkMode = 0;
                        isSwitched = value;
                      });
                    },
                  ),
                ],
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
                            style: TextStyle(
                              color: ftColor[0 + darkMode],
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
                    children: [
                      //알림 영역 테두리
                      Icon(
                        Icons.add_alert_rounded,
                        size: 40.0,
                        color: ftColor[0 + darkMode],
                      ),
                      //메뉴 영역 테두리
                      ActionButton(
                        iconcolor: ftColor[0 + darkMode],
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
                      children: [
                        Text(
                          '최근 로또 번호',
                          style: TextStyle(
                            color: ftColor[0 + darkMode],
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'KBOGothic',
                          ),
                        ),
                        const SizedBox(
                          width: 205,
                        ),
                        // 더보기 영역
                        Text(
                          '> 더보기',
                          style: TextStyle(
                            fontFamily: 'KBOGothic',
                            color: ftColor[0 + darkMode],
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
                    color: ftColor[0 + darkMode],
                    width: 4.0,
                  ),
                  color: ftColor[2 + darkMode],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: LottoBall(
                    numColor: ftColor[0 + darkMode],
                  ), /*Text(
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
                        Border_text(
                          text: "최근 추천 번호",
                          bdColor: ftColor[0 + darkMode],
                          txtColor: ftColor[0 + darkMode],
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
                            color: ftColor[2 + darkMode],
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: ftColor[0 + darkMode],
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
                        Border_text(
                          text: "로또 번호 분석",
                          bdColor: ftColor[0 + darkMode],
                          txtColor: ftColor[0 + darkMode],
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
                            color: ftColor[2 + darkMode],
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: ftColor[0 + darkMode],
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
                  children: [
                    // 버튼 : 기사
                    icon_button(
                      icon: Icons.description_outlined,
                      txtColor: ftColor[0 + darkMode],
                      iconColor: ftColor[0 + darkMode],
                      text: '기사',
                      bdColor: ftColor[0 + darkMode],
                      bdwidth: 2.5,
                    ),
                    // 버튼 : 로또
                    icon_button(
                      icon: Icons.onetwothree,
                      txtColor: ftColor[0 + darkMode],
                      iconColor: ftColor[0 + darkMode],
                      text: '로또',
                      bdColor: ftColor[0 + darkMode],
                      bdwidth: 2.5,
                    ),
                    // 버튼 : 분석
                    icon_button(
                      icon: Icons.add_chart_sharp,
                      txtColor: ftColor[0 + darkMode],
                      iconColor: ftColor[0 + darkMode],
                      text: '분석',
                      bdColor: ftColor[0 + darkMode],
                      bdwidth: 2.5,
                    ),
                    // 버튼 : 행운
                    icon_button(
                      icon: Icons.diamond_outlined,
                      txtColor: ftColor[0 + darkMode],
                      iconColor: ftColor[0 + darkMode],
                      text: '행운',
                      bdColor: ftColor[0 + darkMode],
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
