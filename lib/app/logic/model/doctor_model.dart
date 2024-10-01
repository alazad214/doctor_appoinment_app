import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorModel {
  final String name;
  final String category;
  final num experience;
  final String image;
  final String email;
  final String about;
  final String institute;
  final String parients;
  final String reviews;
  final num fee;
  final num mobile;
  final num rating;
  final List<String> days;
  final List<Timestamp> time;

  DoctorModel({
    required this.name,
    required this.parients,
    required this.reviews,
    required this.category,
    required this.experience,
    required this.image,
    required this.email,
    required this.about,
    required this.institute,
    required this.fee,
    required this.mobile,
    required this.rating,
    required this.days,
    required this.time,
  });

  factory DoctorModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return DoctorModel(
      parients: data['parients'] ?? '',
      reviews: data['reviews'] ?? '',
      category: data['category'] ?? '',
      image: data['image'] ?? '',
      email: data['email'] ?? '',
      name: data['name'] ?? '',
      about: data['about'] ?? '',
      experience: data['experience'] ?? 0,
      institute: data['institute'] ?? '',
      fee: data['fee'] ?? 0,
      mobile: data['mobile'] ?? 0,
      rating: data['rating'] ?? 0,
      days: List<String>.from(data['days']),
      time: List<Timestamp>.from(data['time']),
    );
  }
}
