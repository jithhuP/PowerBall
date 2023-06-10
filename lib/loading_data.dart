import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:math';

Future<List<dynamic>> getDataNum() async {
  final firestore =
      FirebaseFirestore.instance.collection('PowerBall_num').doc('1069');

  var dataResult = await firestore.get();
  List<dynamic> dataNum = List.from(dataResult.data()?['number']);

  return dataNum;
}

Future<List<MapEntry<String, dynamic>>> getLottoData() async {
  final firestore = FirebaseFirestore.instance
      .collection('PowerBall_Stats_Data')
      .doc('total');

  var dataResult = await firestore.get();
  var dataNum = dataResult.data()?.entries.toList();

  return dataNum!;
}

List<String> extractNum(List<MapEntry<String, dynamic>>? data) {
  List<String> num = List.filled(15, '0');
  var count = 0;
  while (count != 15) {
    var minnum = 0;
    int min = 2147483647;
    for (int i = 0; i < data!.length; i++) {
      if (min > data[i].value && judgeNum(num, data[i].key)) {
        min = data[i].value;
        minnum = i;
      }
    }
    num[count++] = data[minnum].key;
  }

  return num;
}

bool judgeNum(List<String> num, String key) {
  var flag = false;
  for (var element in num) {
    if (element == key) {
      flag = true;
      break;
    }
  }
  return !flag;
}

Set<int> combNum(List<String> data) {
  Set<int> num = {};
  while (num.length != 7) {
    num.add(Random().nextInt(data.length));
  }
  return num;
}

Future<List<Map<String, dynamic>>> getNews() async {
  final firestore = FirebaseFirestore.instance.collection('PowerBall_news');

  var dataResult = await firestore.get();
  var dataNews = dataResult.docs.map((doc) => doc.data()).toList();

  return dataNews;
}
