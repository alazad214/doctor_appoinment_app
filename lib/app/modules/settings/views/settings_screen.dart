import 'package:doctor_appointment/app/logic/controller/auth%20controller/logout_controller.dart';
import 'package:doctor_appointment/app/modules/profile/views/edit_profile.dart';
import 'package:doctor_appointment/app/modules/settings/views/privacy_policy_screen.dart';
import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../components/setting_item_card.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});
  final controller = Get.put(LogoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Settings",
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // SettingItemCard(
              //   text: "LightMode",
              //   icon: Icons.light_mode,
              //   child: CupertinoSwitch(
              //       activeTrackColor: primaryColor,
              //       value: true,
              //       onChanged: (value) {}),
              // ),
              SettingItemCard(
                text: "Profile Update",
                icon: Icons.edit,
                onChanged: () {
                  Get.to(() => const EditProfile());
                },
              ),
              SettingItemCard(
                text: "Password Change",
                icon: Icons.password,
                onChanged: () {
                  Get.to(() => const EditProfile());
                },
              ),
              SettingItemCard(
                text: "privacy Policy",
                icon: Icons.privacy_tip_outlined,
                onChanged: () {
                  Get.to(() => const PolicyScreen());
                },
              ),

              SizedBox(height: 20),
              customButton(
                  name: 'Sign Out',
                  minWidth: Get.width / 2,
                  onCallBack: () {
                    appDialog(
                        context,
                        const Icon(Icons.logout, size: 40, color: Colors.white),
                        'Sign Out Account',
                        "Are you sure you want to sign out?",
                        "Sign Out", () {
                      controller.signOut();
                    });
                  },
                  context: context),

              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
