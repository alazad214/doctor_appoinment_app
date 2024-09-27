import 'package:doctor_appointment/app/modules/auth/views/sign_in_screen.dart';
import 'package:doctor_appointment/utils/app_image.dart';
import 'package:doctor_appointment/widgets/app_button.dart';
import 'package:doctor_appointment/widgets/app_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../../utils/constants.dart';
import '../auth/views/sign_up_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          SvgPicture.asset(
            AppImage.appBg,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const Spacer(),
                  Image.asset(AppImage.appLogo, width: screenSize.width / 2),
                  const Spacer(),
                  AppButton(
                      text: 'Sign up',
                      ontap: () => Get.to(() =>  SignUpScreen())),
                  AppButton2(
                      text: 'Sign in',
                      ontap: () => Get.to(() =>  SignInScreen()))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
