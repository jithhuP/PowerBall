import 'package:flutter/material.dart';
import 'chart/Pie_chart.dart';
import 'chart/Bar_chart.dart';

void main() {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Chart(),
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
    Pie_chart(),
    Bar_chart(),
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.red,
        title:Text('Chart'),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('/images/account.png')
              ),
              accountName: Text('User'),
              accountEmail: Text('user123@abc.com'),
              decoration: BoxDecoration(
                color: Colors.red[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10.0),
                  bottomRight: Radius.circular(10.0),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              iconColor: Colors.black,
              focusColor: Colors.black,
              title: Text('홈'),
              onTap: () {},
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.self_improvement),
              iconColor: Colors.black,
              focusColor: Colors.black,
              title: Text('오늘의 운세'),
              onTap: () {},
              trailing: Icon(Icons.navigate_next),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              iconColor: Colors.black,
              focusColor: Colors.black,
              title: Text('설정'),
              onTap: () {},
              trailing: Icon(Icons.navigate_next),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: _wigetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.arrow_back),
            label: '원형 그래프',),
          BottomNavigationBarItem(
              icon: Icon(Icons.arrow_forward),
              label: '막대 그래프'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        onTap: _onItemTapped,
      ),
    );
  }
  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose(){
    super.dispose();
  }
}