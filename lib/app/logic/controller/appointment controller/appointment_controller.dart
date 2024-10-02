import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../../../../style/toast_style.dart';

class AppointmentController extends GetxController {
  var selectedDay = ''.obs;
  var selectedTime = Timestamp(0, 0).obs;
  final currentUser = FirebaseAuth.instance.currentUser;

  RxString name = ''.obs;
  RxString number = ''.obs;
  RxString problem = ''.obs;

  void selectDay(String day) {
    selectedDay.value = day;
  }

  void selectTime(Timestamp time) {
    selectedTime.value = time;
  }

  saveAppointment(String doctorName) async {
    try {
      await FirebaseFirestore.instance.collection('appointments').add({
        'doctor_name': doctorName,
        'selected_day': selectedDay.value,
        'selected_time': selectedTime.value,
        'problem': problem.value,
        'patientName': name.value,
        'contactNumber': number.value,
        'email': currentUser?.email,
        'timestamp': FieldValue.serverTimestamp(),
      });
      successToast('Appointment confirmed successfully!');
    } catch (e) {
      errorToast('Failed to Apply appointment');
    }
  }
}
