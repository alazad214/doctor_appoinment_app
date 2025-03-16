import 'package:doctor_appointment/app/modules/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../../../style/toast_style.dart';

class PasswordChangeController extends GetxController {

  final auth = FirebaseAuth.instance;

  var isLoading = false.obs;

  forgetPassword(email) async {
    try {
      isLoading.value == true;
      await auth.sendPasswordResetEmail(email: email);
      successToast('Send link in your email');
      Get.offAll(MainScreen());
      isLoading.value == false;
    } on FirebaseAuthException {
      errorToast('Something Wrong');
      isLoading.value == false;
    }
  }
}
