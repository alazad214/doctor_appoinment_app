import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DoctorSearchController extends GetxController {
  var selectedCategory = ''.obs;
  var categories = <String>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  Future<void> fetchCategories() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection('category').get();
    categories.value =
        snapshot.docs.map((doc) => doc['name'] as String).toList();
  }

  void setSelectedCategory(String category) {
    selectedCategory.value = category;
  }
}
