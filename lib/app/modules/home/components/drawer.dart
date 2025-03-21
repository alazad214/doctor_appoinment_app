import 'package:doctor_appointment/app/modules/appointment/views/my_appointment_screen.dart';
import 'package:doctor_appointment/app/modules/settings/views/password_change.dart';
import 'package:doctor_appointment/app/modules/settings/views/privacy_policy_screen.dart'
    show PolicyScreen;
import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:doctor_appointment/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../logic/controller/auth controller/logout_controller.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final controller = Get.put(LogoutController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.white,
      width: 270,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 100,
                child: Image.asset('assets/logo/appLogo.png'),
              ),
            ),
            SizedBox(height: 25),
            Divider(),
            drawerItem(context, icon: Iconsax.calendar, text: 'My Appointment',
                onTap: () {
              Get.to(() => MyAppointmentScreen());
            }),
        
            drawerItem(context, icon: Iconsax.edit, text: 'Password Change',
                onTap: () {
              Get.to(() => PasswordChange());
            }),
            drawerItem(context,
                icon: Iconsax.security_safe, text: 'Privacy Policy', onTap: () {
              Get.to(() => const PolicyScreen());
            }),
            drawerItem(context,
                icon: Iconsax.document_text,
                text: 'Terms & Conditions ', onTap: () {
              Get.to(() => const PolicyScreen());
            }),
            drawerItem(context, icon: Iconsax.trash, text: 'Account Delete',
                onTap: () {
              Get.to(() => const PolicyScreen());
            }),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: customButton(
                  name: 'Sign Out',
                  minWidth: 160,
                  height: 40,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(BuildContext context,
      {required IconData icon,
      required String text,
      required GestureTapCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(
          text,
          style: TextStyle(
              color: AppColors.activeColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
