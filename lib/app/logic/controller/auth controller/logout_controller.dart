import 'package:doctor_appointment/app/modules/splash/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../style/toast_style.dart';

class LogoutController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  signOut() async {
    try {
      await auth.signOut().then((value) {
        Get.offAll(const SplashScreen());
        successToast('Successfully Logout');
      });
    } on FirebaseAuthException catch (e) {
      errorToast(e);
    }
  }
}
