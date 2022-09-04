import 'package:get/get.dart';
import 'package:hammies_user/screen/admin/reward/controller/manage_reward_controller.dart';

class ManageRewardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ManageRewardController());
  }
}