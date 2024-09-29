import 'package:doctor_appointment/app/modules/appointment/components/time.dart';
import 'package:doctor_appointment/app/modules/profile/components/profile_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants.dart';
import '../../../../widgets/app_dialog.dart';
import '../../../logic/controller/appointment controller/appointment_controller.dart';
import '../components/calendar.dart';

class AppointmentScreen extends StatelessWidget {
  AppointmentScreen({super.key});

  final controller = Get.put(AppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Appointment",
          style: TextStyle(color: textColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: ListView(
          children: [
            ///Doctor Details...
            const Text(
              'D. Al Azad',
              style: TextStyle(
                  color: textColor, fontSize: 24, fontWeight: FontWeight.w600),
            ),

            ///Spesalist....
            Text("Medicine & Heart Spelist",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium),

            ///Days List...
            CalendarWidget(),

            ///Time List...
            TimeWidget(),

            ///Your Opinion...
            const SizedBox(height: 30),

            const ProfileTextField(
              fieldName: 'Tell us your problem*',
              maxLine: 5,
            ),

            ///Confirm Button...
            Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: ElevatedButton(
                    child: const Text("Confirm Appointment"),
                    onPressed: () {
                      appDialog(
                          context,
                          const Icon(Icons.done),
                          'Appointment Now ',
                          "Do you now Appointment?",
                          "Appointment", () {
                        print(controller.selectedDay.value);
                        print(controller.selectedSlot.value);
                      });
                    }))
          ],
        ),
      ),
    );
  }
}
