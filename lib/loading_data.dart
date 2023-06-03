import 'package:cloud_firestore/cloud_firestore.dart';

getData() {
  //CollectionReference collectionRef =
  //    FirebaseFirestore.instance.collection('PowerBall_num');
  //QuerySnapshot querySnapshot = await collectionRef.get();

  //final allData = querySnapshot.docs.map((doc) => doc.data()).toList();

  final firestore =
      FirebaseFirestore.instance.collection('PowerBall_num').doc('1000');

  firestore.get().then(
    (DocumentSnapshot doc) {
      final data = doc.data() as Map<String, dynamic>;
      print(data['number']);
    },
  );
}
