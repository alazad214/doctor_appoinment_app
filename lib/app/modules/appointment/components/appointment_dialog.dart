import 'package:flutter/material.dart';
import '../../../../utils/constants.dart';
import 'appointment_info.dart';

void appointmentDialog(
  BuildContext context,
  doctor,
  type,
  days,
  time,
  patient,
  contact,
  patientProblem,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        elevation: 20,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: AppointmentInfo(title: "Doctor", text: doctor),
                    ),
                    Expanded(
                      child: AppointmentInfo(
                        title: "Type",
                        text: type,
                      ),
                    ),
                  ],
                ),
                const Divider(height: defaultPadding * 2),
                Row(
                  children: [
                    Expanded(
                      child: AppointmentInfo(title: "Days", text: days),
                    ),
                    Expanded(
                      child: AppointmentInfo(title: "time", text: time),
                    ),
                  ],
                ),
                const Divider(height: defaultPadding * 2),
                Row(
                  children: [
                    Expanded(
                      child: AppointmentInfo(title: "Patient", text: patient),
                    ),
                    Expanded(
                      child: AppointmentInfo(
                          title: "Patient Contact", text: contact),
                    ),
                  ],
                ),
                const Divider(height: defaultPadding * 2),
                const Text(
                  'Patient Problem',
                  style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  patientProblem,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                const Divider(height: defaultPadding * 2),
                Text(
                  'Your appointment has been confirmed. You will be contacted very soon.',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      child: const Text(
                        'back',
                        style: TextStyle(fontSize: 16, color: textColor),
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
