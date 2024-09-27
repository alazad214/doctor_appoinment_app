import 'package:doctor_appointment/app/modules/profile/views/edit_profile.dart';
import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../components/setting_item_card.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
              const SizedBox(height: defaultPadding),
              SettingItemCard(
                text: "Notifications",
                icon: Icons.notifications,
                child: CupertinoSwitch(
                    activeColor: primaryColor,
                    value: true,
                    onChanged: (value) {}),
              ),
              SettingItemCard(
                text: "LightMode",
                icon: Icons.light_mode,
                child: CupertinoSwitch(
                    activeColor: primaryColor,
                    value: true,
                    onChanged: (value) {}),
              ),
              SettingItemCard(
                  text: "Edit Profile",
                  icon: Icons.edit,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const EditProfile());
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined))),
              SettingItemCard(
                  text: "Password Change",
                  icon: Icons.password,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const EditProfile());
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined))),
              SettingItemCard(
                  text: "privacy Policy",
                  icon: Icons.privacy_tip_outlined,
                  child: IconButton(
                      onPressed: () {
                        Get.to(() => const EditProfile());
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined))),
              SettingItemCard(
                  text: "Logout",
                  icon: Icons.logout,
                  child: IconButton(
                      onPressed: () {
                        AppDialog(
                          context,
                          const Icon(Icons.logout,
                              size: 40, color: Colors.white),
                          'Logout',
                          "Are you sure you want to logout?",
                          () {
                            // Define what happens on logout here
                            Navigator.of(context)
                                .pop(); // Close the dialog after performing the action
                            // Perform logout action (if needed)
                          },
                        );
                      },
                      icon: const Icon(Icons.arrow_circle_right_outlined))),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }
}
