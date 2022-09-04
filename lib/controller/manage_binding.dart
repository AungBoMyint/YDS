import 'package:get/get.dart';

import 'manage_controller.dart';

class ManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManageController());
  }
  
}