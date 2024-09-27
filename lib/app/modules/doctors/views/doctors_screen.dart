import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../models/AvailableDoctor.dart';
import '../../../../utils/app_icon.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../details/views/doctor_details_screen.dart';
import '../../search/views/search_screen.dart';
import '../components/docotor_card.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const CustomAppBar(text: "Available", title: "Specialist"),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: demoAvailableDoctors.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.9,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) => DoctorCard(
                    doctor: demoAvailableDoctors[index],
                    press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DoctorDetailsScreen(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
