import 'package:doctor_appointment/widgets/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/constants.dart';
import '../article/health_tips_screen.dart';
import '../doctors/views/doctors_screen.dart';
import '../home/views/home_screen.dart';
import '../profile/views/profile_screen.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedPage = 0;

  void onTabChange(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  void doctorTab() {
    onTabChange(1);
  }

  void healthTab() {
    onTabChange(2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedPage,
        children: [
          HomePage(
            doctorSeeMore: doctorTab,
            healthSeeMore: healthTab,
          ),
          DoctorsScreen(),
          HealthTipsScreen(),
          ProfileScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(defaultPadding),
        color: Colors.white,
        child: SafeArea(
          child: GNav(
            haptic: true,
            tabBorderRadius: 10,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 200),
            gap: 8,
            color: Colors.grey[800],
            activeColor: Colors.white,
            iconSize: 24,
            tabBackgroundColor: AppColors.primaryColor,
            padding:
                const EdgeInsets.symmetric(horizontal: 5, vertical: 15 / 2),
            selectedIndex: selectedPage,
            tabs: const [
              GButton(icon: Iconsax.home, text: 'Home'),
              GButton(icon: Iconsax.people, text: 'Doctors'),
                GButton(icon: Iconsax.health, text: 'Tips'),
              GButton(icon: Iconsax.user, text: 'Profile'),
            ],
            onTabChange: onTabChange,
          ),
        ),
      ),
    );
  }
}
