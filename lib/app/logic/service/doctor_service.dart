import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/doctor_model.dart';

class FirestoreService {
  final doctorCollection = FirebaseFirestore.instance.collection('doctors');

  Future<List<DoctorModel>> getDoctors() async {
    QuerySnapshot snapshot = await doctorCollection.get();
    return snapshot.docs.map((doc) => DoctorModel.fromFirestore(doc)).toList();
  }

  /// Doctors by category
  Future<List<DoctorModel>> getDoctorsByCategory(String category) async {
    QuerySnapshot snapshot =
        await doctorCollection.where('category', isEqualTo: category).get();
    return snapshot.docs.map((doc) => DoctorModel.fromFirestore(doc)).toList();
  }

  /// Doctors by category
  Future<List<DoctorModel>> searchDoctorsByCategory(String category) async {
    QuerySnapshot snapshot =
        await doctorCollection.where('category', isEqualTo: category).get();
    return snapshot.docs.map((doc) => DoctorModel.fromFirestore(doc)).toList();
  }
}
