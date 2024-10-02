import 'package:doctor_appointment/app/modules/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SuccessfullScreen extends StatelessWidget {
  const SuccessfullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Lottie.asset('assets/animations/successfully.json'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width / 4),
            child: ElevatedButton(
                onPressed: () {
                  Get.offAll(() => MainScreen());
                },
                child: const Text('Go To Home')),
          )
        ],
      )),
    );
  }
}
