import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/app/logic/controller/appointment%20controller/appointment_controller.dart';
import 'package:doctor_appointment/app/modules/main/main_screen.dart';
import 'package:doctor_appointment/widgets/app_dialog.dart';
import 'package:doctor_appointment/widgets/custom_validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../style/toast_style.dart';
import '../../../../utils/constants.dart';
import '../../../logic/model/doctor_model.dart';
import '../../profile/components/profile_text_field.dart';
import '../components/calendar.dart';
import '../components/time.dart';

class AppointmentScreen extends StatelessWidget {
  final DoctorModel doctor;
  AppointmentScreen({super.key, required this.doctor});
  final controller = Get.put(AppointmentController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Book Appointment",
          style: TextStyle(
              color: textColor, fontWeight: FontWeight.w500, fontSize: 18),
        ),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ListView(
            children: [
              /// Doctor info
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 24, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          doctor.category,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Image.network(doctor.image, fit: BoxFit.cover),
                  )
                ],
              ),

              /// Days-->
              CalendarWidget(
                availableDays: doctor.days,
                doctorName: doctor.name,
              ),

              /// Times-->
              TimeWidget(availableTimes: doctor.time),

              const SizedBox(height: 20),

              /// Input fields
              ProfileTextField(
                fieldName: 'Patient Name*',
                validator: (value) =>
                    InputValidator.validatefiled(value, 'Please enter a name'),
                onChanged: (value) {
                  controller.name.value = value;
                },
              ),

              ProfileTextField(
                fieldName: 'Patient Age*',
                keyboardType: TextInputType.number,
                validator: (value) =>
                    InputValidator.validatefiled(value, 'Please enter an age'),
                onChanged: (value) {
                  controller.age.value = value;
                },
              ),
              ProfileTextField(
                fieldName: 'Contact Number*',
                keyboardType: TextInputType.number,
                validator: (value) => InputValidator.validatefiled(
                    value, 'Please enter a contact number'),
                onChanged: (value) {
                  controller.number.value = value;
                },
              ),
              ProfileTextField(
                fieldName: 'Tell us patient problem*',
                maxLine: 5,
                validator: (value) => InputValidator.validatefiled(
                    value, 'Please enter a problem'),
                onChanged: (value) {
                  controller.problem.value = value;
                },
              ),

              /// Confirm Button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  child: const Text("Confirm Appointment"),
                  onPressed: () {
                    if (formKey.currentState!.validate() &&
                        controller.selectedDay.value.isNotEmpty &&
                        controller.selectedTime.value != Timestamp(0, 0)) {
                      appDialog(
                          context,
                          Image.asset('assets/icons/success.png', height: 40),
                          "Appointment Confirm",
                          "Your appointment has been confirmed. You will be contacted very soon.",
                          "Confirm", () async {
                        Get.offAll(() => MainScreen());

                        controller.saveAppointment(doctor.name);
                      });
                    } else {
                      errorToast(
                          'Please fill all the fields before confirming.');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
