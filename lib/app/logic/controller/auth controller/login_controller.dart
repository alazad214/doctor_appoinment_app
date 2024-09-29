import 'package:doctor_appointment/app/modules/main/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../../style/toast_style.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  ///Instance...
  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;

  logIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(MainScreen());
          successToast('Successfully Login');
        }
      });
    } on FirebaseAuthException catch (error) {
      errorToast(error);
    }
  }
}
