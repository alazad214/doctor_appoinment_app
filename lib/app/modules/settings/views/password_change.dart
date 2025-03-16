import 'package:doctor_appointment/utils/app_image.dart';
import 'package:doctor_appointment/utils/constants.dart' as AppColors;
import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:doctor_appointment/widgets/custom_textfield.dart';
import 'package:doctor_appointment/widgets/custom_validation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../controller/password_change_controller.dart';

class PasswordChange extends StatelessWidget {
  PasswordChange({super.key});
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(PasswordChangeController());
  final currentUser = FirebaseAuth.instance.currentUser;
  final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    emailController.text = currentUser!.email!;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              AppImage.appBg,
              fit: BoxFit.cover,
            ),
            SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //Email field-->

                    CustomTextfield(
                      hintText: 'Enter your email',
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: InputValidator.validateEmail,
                      isRead: true,
                    ),
                    const SizedBox(height: 30),

                    Obx(() {
                      return controller.isLoading.value
                          ? CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            )
                          : customButton(
                              name: 'Send',
                              onCallBack: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  appDialog(
                                      context,
                                      const Icon(Icons.password),
                                      "Forget Password",
                                      'A link has been sent to your email. Click there to change your password',
                                      "Send", () {
                                    controller
                                        .forgetPassword(emailController.text);
                                    Navigator.pop(context);
                                  });
                                }
                              },
                              context: context);
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
