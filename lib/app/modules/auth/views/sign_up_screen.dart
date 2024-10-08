import 'package:doctor_appointment/app/logic/controller/auth%20controller/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../../../utils/app_image.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/app_button.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final controller = Get.put(SignupController());

  ///Code....
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    String password = "";
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
                  Image.asset(AppImage.appLogo, width: screenSize.width / 2.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                        onPressed: () => Get.to(() => SignInScreen()),
                        child: const Text("Sign In!"),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///emial field...
                        TextFormField(
                          validator: MultiValidator(
                            [
                              RequiredValidator(errorText: requiredField),
                              EmailValidator(errorText: emailError),
                            ],
                          ).call,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: (value) {
                            controller.email.value = value;
                          },
                          decoration:
                              const InputDecoration(labelText: "Email*"),
                        ),
                        const SizedBox(height: 10),

                        ///phone number field...
                        TextFormField(
                          onSaved: (newValue) {},
                          decoration:
                              const InputDecoration(labelText: "Phone Number"),
                          keyboardType: TextInputType.phone,
                          validator:
                              RequiredValidator(errorText: requiredField).call,
                          onChanged: (value) {
                            controller.phone.value = value;
                          },
                        ),
                        const SizedBox(height: 10),

                        ///password field...
                        TextFormField(
                          validator: passwordValidator.call,
                          obscureText: true,
                          onChanged: (value) {
                            controller.password.value = value;
                          },
                          decoration:
                              const InputDecoration(labelText: "Password*"),
                        ),
                        const SizedBox(height: 10),

                        ///confirm password field...
                        TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            controller.confirmPassword.value = value;
                          },
                          decoration: const InputDecoration(
                              labelText: "Confirm password*"),
                        ),
                        const SizedBox(height: 15),

                        ///Signup button...
                        AppButton(
                            text: 'Sign Up',
                            ontap: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                controller.register();
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
      )),
    );
  }
}
