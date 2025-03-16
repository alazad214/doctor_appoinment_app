import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants.dart';
import '../../logic/controller/main controller/main_screen_controller.dart';
import '../appointment/views/my_appointment_screen.dart';
import '../doctors/views/doctors_screen.dart';
import '../home/views/home_screen.dart';
import '../profile/views/profile_screen.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  final controller = Get.put(MainController());

  final List pages = [
    const HomePage(),
    DoctorsScreen(),
    MyAppointmentScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => pages[controller.selectedPage.value]),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.all(defaultPadding),
            color: Colors.white,
            child: SafeArea(
                child: GNav(
                    haptic: true,
                    tabBorderRadius: 10,
                    curve: Curves.ease,
                    duration: const Duration(milliseconds: 1),
                    gap: 8,
                    color: Colors.grey[800],
                    activeColor: Colors.white,
                    iconSize: 24,
                    tabBackgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5, vertical: 15 / 2),
                    tabs: const [
                      GButton(icon: Iconsax.home, text: 'Home'),
                      GButton(icon: Iconsax.people, text: 'Doctors'),
                      GButton(icon: Iconsax.calendar, text: 'Appointment'),
                      GButton(icon: Iconsax.user, text: 'Profile')
                    ],
                    onTabChange: (index) {
                      controller.onTabChange(index);
                    }))));
  }
}
