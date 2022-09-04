import 'package:get/get.dart';
import 'package:hammies_user/screen/admin/reward/controller/upload_reward_controller.dart';

class UploadRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UploadRewardController());
  }
  
}