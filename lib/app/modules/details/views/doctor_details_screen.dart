import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/heightlight.dart';
import '../../../../widgets/rating.dart';
import '../../appointment/views/appointment_screen.dart';
import '../components/contact_button.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Al Azad",
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
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
                  child: Image.asset('assets/images/profile.jpg',
                      fit: BoxFit.contain)),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                  child: ContactButton(callOntap: () {
                    appDialog(context, const Icon(Icons.phone), 'Call ',
                        "Do you now call Azad", "Call Now", () {});
                  }, messageOntap: () {
                    appDialog(context, const Icon(Icons.phone), 'Message ',
                        "Do you now send message Azad", "Message Now", () {});
                  })),

              ///Spesalist....
              Text("Medicine & Heart Spelist",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.titleMedium),

              ///Clinic Name...
              const Text("Good Health Clinic, MBBS, FCPS",
                  maxLines: 1, overflow: TextOverflow.ellipsis),

              ///Rating...
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding / 4),
                child: Rating(score: 5),
              ),
              const SizedBox(height: 15),

              ///About Azad...
              Text(
                "About Azad",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding / 2),
                child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s."),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Highlight(name: "Patients", text: "1.08K"),
                    Highlight(name: "Experience", text: "8 Years"),
                    Highlight(name: "Reviews", text: "2.05K")
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => AppointmentScreen()),
                      child: const Text("Book an Appoinment")))
            ],
          ),
        ),
      ),
    );
  }
}
