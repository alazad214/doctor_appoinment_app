import 'package:doctor_appointment/app/logic/controller/auth%20controller/signup_controller.dart';
import 'package:doctor_appointment/style/toast_style.dart';
import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:doctor_appointment/widgets/custom_textfield.dart';
import 'package:doctor_appointment/widgets/custom_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../utils/app_image.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignupController());

  ///Code....
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
                  Image.asset(AppImage.appLogo, width: screenSize.width / 2.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: AppColors.c002D62,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () => Get.to(() => SignInScreen()),
                        child: const Text(
                          "Sign In!",
                          style: TextStyle(
                              color: AppColors.boxShadow,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //Email field-->
                        CustomTextfield(
                          hintText: 'Email',
                          inputType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          validator: InputValidator.validateEmail,
                        ),
                        const SizedBox(height: 10),

                        //Number field-->
                        CustomTextfield(
                          hintText: 'Phone Number',
                          inputType: TextInputType.phone,
                          onChanged: (value) {
                            controller.phone.value = value;
                          },
                          validator: InputValidator.validatenumber,
                        ),

                        const SizedBox(height: 10),

                        //password field-->

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

                        //confirm password field-->

                        Obx(() {
                          return CustomTextfield(
                            hintText: 'Confirm password',
                            inputType: TextInputType.visiblePassword,
                            onChanged: (value) {
                              controller.confirmPassword.value = value;
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

                        const SizedBox(height: 15),

                        //Signup button-->

                        Obx(() {
                          return controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: AppColors.primaryColor,
                                )
                              : customButton(
                                  name: 'Sign Up',
                                  onCallBack: () {
                                    if (_formKey.currentState!.validate()) {
                                      if (controller.password.value ==
                                          controller.confirmPassword.value) {
                                        controller.register();
                                      } else {
                                        errorToast('Password do not match');
                                      }
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
      )),
    );
  }
}
