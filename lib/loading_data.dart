import 'package:cloud_firestore/cloud_firestore.dart';

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
    int min = 9223372036854775807;
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
