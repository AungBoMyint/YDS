import 'package:get/get.dart';
import 'package:hammies_user/controller/upload_controller.dart';

class UploadBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(UploadController());
  }
}