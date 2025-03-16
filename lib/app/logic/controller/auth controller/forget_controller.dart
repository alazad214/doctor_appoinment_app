import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../style/toast_style.dart';

class ForgetController extends GetxController {
  var email = ''.obs;
  final auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  forgetPassword() async {
    try {
      isLoading.value == true;
      await auth.sendPasswordResetEmail(email: email.value);
      successToast('Send link in your email');
      Get.back();
      isLoading.value == false;
    } on FirebaseAuthException {
      errorToast('Something Wrong');
      isLoading.value == false;
    }
  }
}
