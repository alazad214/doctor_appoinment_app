import 'package:doctor_appointment/app/logic/controller/auth%20controller/forget_controller.dart';
import 'package:doctor_appointment/utils/app_image.dart';
import 'package:doctor_appointment/utils/constants.dart' as AppColors;
import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:doctor_appointment/widgets/custom_textfield.dart';
import 'package:doctor_appointment/widgets/custom_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(ForgetController());
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            SvgPicture.asset(
              AppImage.appBg,
              fit: BoxFit.cover,
            ),
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImage.appLogo,
                          width: screenSize.width / 2.5),
                      const SizedBox(height: 40),

                      //Email field-->

                      CustomTextfield(
                        hintText: 'Enter your email',
                        inputType: TextInputType.emailAddress,
                        onChanged: (value) {
                          controller.email.value = value;
                        },
                        validator: InputValidator.validateEmail,
                      ),
                      const SizedBox(height: 30),

                      Obx(() {
                        return controller.isLoading.value
                            ? CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              )
                            : customButton(
                                name: 'Send Forget Link',
                                onCallBack: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();

                                    appDialog(
                                        context,
                                        const Icon(Icons.password),
                                        "Forget Password",
                                        'A link has been sent to your email. Click there to change your password',
                                        "Send", () {
                                      controller.forgetPassword();
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
            ),
          ],
        ),
      ),
    );
  }
}
