import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/app_rating.dart';
import '../../../../widgets/heightlight.dart';
import '../../../logic/model/doctor_model.dart';
import '../../appointment/views/appointment_screen.dart';

class DoctorDetailsScreen extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorDetailsScreen({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
             backgroundColor: Colors.transparent,
        title: Text(
          'Doctors Details',
          style: const TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAlias,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Image.network(doctor.image, fit: BoxFit.contain),
              ),

              SizedBox(height: defaultPadding),

              /// Specialization
              Text(
                doctor.category,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              /// Clinic Name
              Text(
                doctor.institute,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              /// Rating
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: AppRating(score: doctor.rating.toDouble()),
              ),
              const SizedBox(height: 15),

              /// About
              Text(
                "About ${doctor.name}, ",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(doctor.about),
              ),

              /// Highlights
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Highlight(
                      name: "Patients",
                      text: doctor.parients,
                    ),
                    Highlight(
                        name: "Experience", text: "${doctor.experience} Years"),
                    Highlight(
                      name: "Reviews",
                      text: doctor.reviews,
                    ),
                  ],
                ),
              ),

              /// Book Appointment Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: ElevatedButton(
                  onPressed: () => Get.to(() =>
                      AppointmentScreen(doctor: doctor)), // Pass doctor data
                  child: const Text("Book an Appointment"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
