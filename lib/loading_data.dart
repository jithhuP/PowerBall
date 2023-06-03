import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<dynamic>> getDataNum() async {
  final firestore =
      FirebaseFirestore.instance.collection('PowerBall_num').doc('1069');

  var dataResult = await firestore.get();
  List<dynamic> dataNum = List.from(dataResult.data()?['number']);

  return dataNum;
}
