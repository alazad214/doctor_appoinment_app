import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void bannerDialog(
  BuildContext context,
  Widget child,
  String description,
) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 20,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 100,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                      color: Colors.lightBlue.shade300,
                      borderRadius: BorderRadius.circular(6)),
                  child: child,
                ),
                const SizedBox(height: 15),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                customButton(
                    name: 'Back',
                    onCallBack: () {
                      Get.back();
                    },
                    context: context)
              ],
            ),
          ),
        ),
      );
    },
  );
}
