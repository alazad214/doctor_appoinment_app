import 'package:get/get.dart';

class MainController extends GetxController {
  var selectedPage = 0.obs;

  void onTabChange(index) {
    selectedPage.value = index;
  }
}
