import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../style/toast_style.dart';

class ForgetController extends GetxController {
  var email = ''.obs;
  final auth = FirebaseAuth.instance;

  forgetPassword() async {
    try {
      await auth.sendPasswordResetEmail(email: email.value);
      successToast('Send link in your email');
    } on FirebaseAuthException catch (e) {
      errorToast('Something Wrong');
    }
  }
}
