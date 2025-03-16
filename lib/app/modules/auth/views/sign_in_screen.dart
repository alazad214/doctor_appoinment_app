import 'package:doctor_appointment/app/logic/controller/auth%20controller/login_controller.dart';
import 'package:doctor_appointment/app/modules/auth/views/forget_password.dart';
import 'package:doctor_appointment/app/modules/auth/views/sign_up_screen.dart';
import 'package:doctor_appointment/utils/app_image.dart';
import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:doctor_appointment/widgets/custom_textfield.dart';
import 'package:doctor_appointment/widgets/custom_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(LoginController());
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.appLogo,
                        width: screenSize.width / 2.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don’t have an account?",
                          style: TextStyle(
                              color: AppColors.c002D62,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () => Get.to(() => SignUpScreen()),
                            child: const Text(
                              "Sign up!",
                              style: TextStyle(
                                  color: AppColors.boxShadow,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          //Email Field-->

                          CustomTextfield(
                            hintText: 'Email',
                            inputType: TextInputType.emailAddress,
                            onChanged: (value) {
                              controller.email.value = value;
                            },
                            validator: InputValidator.validateEmail,
                          ),
                          const SizedBox(height: 15),

                          //Password Field-->

                          Obx(() {
                            return CustomTextfield(
                              hintText: 'Password',
                              inputType: TextInputType.visiblePassword,
                              onChanged: (value) {
                                controller.password.value = value;
                              },
                              validator: InputValidator.validatePassword,
                              suffixIcon: IconButton(
                                  onPressed: controller.isPassSecureFunc,
                                  icon: Icon(controller.isSecure == true
                                      ? Icons.visibility_off
                                      : Icons.visibility)),
                              isObsecure: controller.isSecure.value,
                            );
                          }),
                          const SizedBox(height: 10),

                          //Forget Button-->
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                                onPressed: () {
                                  Get.to(() => ForgetPassword());
                                },
                                child: const Text(
                                  "Forgot Now?",
                                  style: TextStyle(
                                      color: AppColors.boxShadow,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                )),
                          ),
                          const SizedBox(height: 20),

                          //SignIn Button -->

                          Obx(() {
                            return controller.isLoading.value
                                ? CircularProgressIndicator(
                                    color: AppColors.primaryColor,
                                  )
                                : customButton(
                                    name: 'Sign In',
                                    onCallBack: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        controller.logIn();
                                      }
                                    },
                                    context: context);
                          }),
                        ],
                      ),
                    )
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
