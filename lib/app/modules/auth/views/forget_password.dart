import 'package:doctor_appointment/app/logic/controller/auth%20controller/forget_controller.dart';
import 'package:doctor_appointment/utils/app_image.dart';
import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/app_button.dart';

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
                padding: const EdgeInsets.all(15),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImage.appLogo,
                          width: screenSize.width / 2.5),
                      const SizedBox(height: 40),

                      ///email field...
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
                      const SizedBox(height: 30),
                      AppButton(
                          text: 'Send Link',
                          ontap: () {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();

                              appDialog(
                                  context,
                                  const Icon(Icons.password),
                                  "Forget Password",
                                  'A link has been sent to your email. Click there to change your password',
                                  "Confirm", () {
                                controller.forgetPassword();
                                Navigator.pop(context);
                              });
                            }
                          })
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
