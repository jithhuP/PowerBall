import 'package:flutter/material.dart';
import 'package:practice/chart/main_Bar_chart.dart';
import 'package:practice/custom_widget.dart';
import 'package:practice/loading_data.dart';
import 'package:practice/report_screen.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:intl/intl.dart';
import 'chart/Pie_chart.dart';
import 'chart/Bar_chart.dart';
import 'lotto_screen.dart';

// 일반 색상 및 다크모드 색상
List<Color> ftColor = [
  Colors.black,
  Colors.white,
  const Color.fromARGB(255, 221, 252, 213),
  Colors.amber,
  Colors.black,
  const Color.fromARGB(255, 34, 34, 34)
];

// 다크모드 계수
int darkMode = 0;
bool isSwitched = false;

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return App();
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
            vertical: 2.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 최상단 빈공간 넣음
              const SizedBox(
                height: 20.0,
              ),
              // 다크모드 스위치 영역
              Row(
                children: [
                  // 다크모드 스위치 아이콘
                  Icon(
                    Icons.dark_mode,
                    size: 35.0,
                    color: ftColor[0 + darkMode],
                  ),
                  // 다크모드 스위치
                  Switch(
                    value: isSwitched,
                    onChanged: (value) {
                      getNews();
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
                      // 빈 공간 넣기
                      const SizedBox(
                        width: 20.0,
                      ),
                      // 시계 영역
                      TimerBuilder.periodic(
                        const Duration(seconds: 1),
                        builder: (context) {
                          return Text(
                            // 시, 분으로 표시
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
                      //메뉴 영역
                      ActionButton(
                        iconcolor: ftColor[0 + darkMode],
                        iCon: Icons.menu,
                        iconsize: 40.0,
                        // 메뉴 화면으로 연결
                        linkedScreen: const UserInfo(),
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
                      ],
                    ),
                  ),
                ],
              ),
              // 빈 공간 넣기
              const SizedBox(
                height: 10.0,
              ),
              // 추천 번호 표시 영역
              Container(
                alignment: AlignmentDirectional.center,
                height: 130,
                // 색상 및 테두리
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ftColor[0 + darkMode],
                    width: 4.0,
                  ),
                  color: ftColor[2 + darkMode],
                  borderRadius: BorderRadius.circular(25.0),
                ),
                // 번호 표시
                child:
                    // 로또 번호 출력 함수
                    const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                  child: LoadingLottoNum(),
                ),
              ),
              // 빈 공간 넣기
              const SizedBox(
                height: 20.0,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 로또 번호 분석 텍스트
                        Border_text(
                          text: "로또 번호 분석 : 최근 50회 : 총 번호 비율",
                          bdColor: ftColor[0 + darkMode],
                          txtColor: ftColor[0 + darkMode],
                          fontsize: 22.0,
                          bdheight: 55.0,
                          pdsize: 12.5,
                        ),
                        // 빈 공간 넣기
                        const SizedBox(
                          height: 15.0,
                        ),
                        // 통계 : 로또 번호 분석
                        Container(
                          height: 200.0,
                          // 영역 색상
                          decoration: BoxDecoration(
                            color: ftColor[2 + darkMode],
                            borderRadius: BorderRadius.circular(25.0),
                            border: Border.all(
                              color: ftColor[0 + darkMode],
                              width: 4.0,
                            ),
                          ),
                          child: const main_Bar_chart(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  // 빈 공간 넣기
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 15.0,
                        height: 15.0,
                        color: Colors.blue,
                      ),
                      Text(
                        ' : 최근 50회',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'KBOGothic',
                          color: ftColor[0 + darkMode],
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        width: 15.0,
                        height: 15.0,
                        color: Colors.red,
                      ),
                      Text(
                        ' : 총 횟수',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontFamily: 'KBOGothic',
                          color: ftColor[0 + darkMode],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15.0,
              ),
              // 최하단 버튼 영역
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
                      linkedScreen: const ReportScreen(),
                    ),
                    // 버튼 : 로또
                    icon_button(
                      icon: Icons.onetwothree,
                      txtColor: ftColor[0 + darkMode],
                      iconColor: ftColor[0 + darkMode],
                      text: '로또',
                      bdColor: ftColor[0 + darkMode],
                      bdwidth: 2.5,
                      linkedScreen: const LottoScreen(),
                    ),
                    // 버튼 : 분석
                    icon_button(
                      icon: Icons.add_chart_sharp,
                      txtColor: ftColor[0 + darkMode],
                      iconColor: ftColor[0 + darkMode],
                      text: '분석',
                      bdColor: ftColor[0 + darkMode],
                      bdwidth: 2.5,
                      linkedScreen: const Chart(),
                    ),
                    // 버튼 : 행운
                    icon_button(
                      icon: Icons.diamond_outlined,
                      txtColor: ftColor[0 + darkMode],
                      iconColor: ftColor[0 + darkMode],
                      text: '행운',
                      bdColor: ftColor[0 + darkMode],
                      bdwidth: 2.5,
                      linkedScreen: const GoGame(),
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

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartPageState();
}

class _ChartPageState extends State<Chart> {
  int _selectedIndex = 0;

  final List<Widget> _wigetOptions = <Widget>[
    const Pie_chart(),
    const Bar_chart(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Chart'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: const UserInfo(),
      body: SafeArea(
        child: _wigetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: '원형 그래프',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward), label: '막대 그래프'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
