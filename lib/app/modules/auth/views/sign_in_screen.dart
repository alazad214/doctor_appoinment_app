import 'package:doctor_appointment/app/logic/controller/auth%20controller/login_controller.dart';
import 'package:doctor_appointment/app/modules/auth/views/forget_password.dart';
import 'package:doctor_appointment/app/modules/auth/views/sign_up_screen.dart';
import 'package:doctor_appointment/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/app_button.dart';

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
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.appLogo,
                        width: screenSize.width / 2.5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account?"),
                        TextButton(
                            onPressed: () => Get.to(() => SignUpScreen()),
                            child: const Text("Sign up!")),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///email...
                          TextFormField(
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: requiredField),
                                  EmailValidator(errorText: emailError)
                                ],
                              ).call,
                              keyboardType: TextInputType.emailAddress,
                              onChanged: (value) {
                                controller.email.value = value;
                              },
                              decoration:
                                  const InputDecoration(labelText: "Email*")),
                          const SizedBox(height: 15),

                          ///Password textfield...
                          TextFormField(
                              validator:
                                  RequiredValidator(errorText: requiredField)
                                      .call,
                              obscureText: true,
                              onChanged: (value) {
                                controller.password.value = value;
                              },
                              decoration: const InputDecoration(
                                  labelText: "Password*")),

                          ///forget button...
                          TextButton(
                              onPressed: () {
                                Get.to(() => ForgetPassword());
                              },
                              child: const Text("Forgot your Password?")),
                          const SizedBox(height: 20),

                          ///signin button....
                          AppButton(
                              text: 'Sign In',
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  controller.logIn();
                                }
                              })
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
