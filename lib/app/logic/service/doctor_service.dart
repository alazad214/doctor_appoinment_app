import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/doctor_model.dart';

class FirestoreService {
  final doctorCollection = FirebaseFirestore.instance.collection('doctors');

  Future<List<DoctorModel>> getDoctors() async {
    QuerySnapshot snapshot = await doctorCollection.get();
    return snapshot.docs.map((doc) => DoctorModel.fromFirestore(doc)).toList();
  }
}
