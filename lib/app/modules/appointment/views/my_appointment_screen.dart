import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_appointment/app/modules/appointment/components/appointment_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';
import '../components/appointment_info.dart';

class MyAppointmentScreen extends StatelessWidget {
  MyAppointmentScreen({super.key});

  final currentUser = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar...
      appBar: AppBar(
        title: const Text(
          "My Appointment",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ),

      /// Body...
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('email', isEqualTo: currentUser)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('You have no appointment'));
          }

          var apointments = snapshot.data!.docs;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(children: [
                ListView.builder(
                    itemCount: apointments.length,
                    shrinkWrap: true,
                    primary: false,
                    itemBuilder: (_, index) {
                      final data = apointments[index];
                      return InkWell(
                        onTap: () {
                          appointmentDialog(
                            context,
                            data['doctor_name'],
                            'Dentist',
                            data['selected_day'],
                            '02:30 PM',
                            data['patientName'],
                            data['contactNumber'],
                            data['problem'],
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          margin: const EdgeInsets.only(bottom: defaultPadding),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(defaultPadding / 2),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: AppointmentInfo(
                                      title: "Doctor",
                                      text: data['doctor_name'],
                                    ),
                                  ),
                                  const Expanded(
                                    child: AppointmentInfo(
                                      title: "Type",
                                      text: "Dentiest",
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(height: defaultPadding * 2),
                              Row(
                                children: [
                                  Expanded(
                                    child: AppointmentInfo(
                                      title: "Days",
                                      text: data['selected_day'],
                                    ),
                                  ),
                                  const Expanded(
                                    child: AppointmentInfo(
                                      title: "Time",
                                      text: '02:30 PM',
                                    ),
                                  ),
                                  Expanded(
                                    child: AppointmentInfo(
                                      title: "Patient",
                                      text: data['patientName'],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ]),
            ),
          );
        },
      ),
    );
  }
}
