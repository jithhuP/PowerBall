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
                height: 35.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //시간 영역 테두리
                      Container(
                        height: 59.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        //시간 영역
                        child: SizedBox(
                          width: 285.4,
                          child: TimerBuilder.periodic(
                            const Duration(seconds: 1),
                            builder: (context) {
                              return Text(
                                '${DateTime.now().year}년 ${DateTime.now().month}월 ${DateTime.now().day}일 ${DateTime.now().hour}시 ${DateTime.now().minute}분',
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      //알림 영역 테두리
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        //알림 영역
                        child: const Icon(
                          Icons.add_alert_outlined,
                          size: 55.0,
                          color: Colors.white,
                        ),
                      ),
                      //메뉴 영역 테두리
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                        ),
                        // 메뉴 영역
                        child: const Icon(
                          Icons.menu,
                          size: 55.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 35.0,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3.0),
                child: Row(
                  children: const [
                    icon_button(
                      bdColor: Colors.white,
                    ),
                    icon_button(
                      bdColor: Colors.white,
                    ),
                    icon_button(
                      bdColor: Colors.white,
                    ),
                    icon_button(
                      bdColor: Colors.white,
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
