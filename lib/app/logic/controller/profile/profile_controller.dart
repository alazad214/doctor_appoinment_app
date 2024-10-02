import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileController extends GetxController {
  RxString name = ''.obs;
  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString userId = ''.obs;
  RxString userImage = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString address = ''.obs;

  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    if (currentUser != null) {
      fetchUserData();
    }
  }

  fetchUserData() async {
    if (currentUser != null) {
      String userEmail = currentUser!.email!;
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: userEmail)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        var userData = querySnapshot.docs[0].data() as Map<String, dynamic>;
        username.value = userData['userName'] ?? '';
        email.value = userData['email'] ?? '';
        userImage.value = userData['photos'] ?? '';
        phoneNumber.value = userData['phone'] ?? '';
        address.value = userData['address'] ?? '';
      }
    }
  }
}
