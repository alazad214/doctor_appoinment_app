import 'package:doctor_appointment/app/modules/auth/views/sign_up_screen.dart';
import 'package:doctor_appointment/utils/app_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/app_button.dart';
import '../../main/main_screen.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final _formKey = GlobalKey<FormState>();
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
                          TextFormField(
                              validator: MultiValidator(
                                [
                                  RequiredValidator(errorText: requiredField),
                                  EmailValidator(errorText: emailError)
                                ],
                              ).call,
                              keyboardType: TextInputType.emailAddress,
                              decoration:
                                  const InputDecoration(labelText: "Email*")),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: defaultPadding),
                            child: TextFormField(
                                validator: passwordValidator.call,
                                obscureText: true,
                                decoration: const InputDecoration(
                                    labelText: "Password*")),
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text("Forgot your Password?")),
                          const SizedBox(height: defaultPadding),
                          AppButton(
                              text: 'Sign In',
                              ontap: () {
                                Get.to(() =>  MainScreen());
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
