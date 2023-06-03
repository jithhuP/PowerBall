import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getData() async {
  CollectionReference collectionRef =
      FirebaseFirestore.instance.collection('PowerBall_num');
  QuerySnapshot querySnapshot = await collectionRef.get();

  final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  print(allData);
}
