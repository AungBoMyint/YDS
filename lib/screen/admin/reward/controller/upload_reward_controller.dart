import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:hammies_user/controller/home_controller.dart';
import 'package:hammies_user/service/database.dart';
import 'package:hammies_user/widgets/show_loading/show_loading.dart';
import 'package:uuid/uuid.dart';

import '../../../../data/constant.dart';
import '../../../../model/reward_product.dart';

class UploadRewardController extends GetxController {
  final HomeController _homeController = Get.find();
  var isLoading = false.obs;
  final Database _database = Database();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController requirePointController = TextEditingController();

  @override
  void onInit() {
    if(!(_homeController.editRewardItem.value == null)){
      final item = _homeController.editRewardItem.value!;
      nameController.text = item.name;
      descController.text = item.description ?? "";
      imageController.text = item.image;
      requirePointController.text = item.requirePoint.toString();
    }
    super.onInit();
  }

  String? validator(String? value,String name){
    if(value == null || value.isEmpty){
      return "$name is required";
    }else{
      return null;
    }
  }

  Future<void> uploadOrUpdate() async{
    final editItem = _homeController.editRewardItem.value;
    if(formKey.currentState?.validate() == false || isLoading.value){
      return;
    }
    isLoading.value = true;
    final rewardItem = RewardProduct(
      id: editItem?.id ?? Uuid().v1(),
      name: nameController.text,
      description: descController.text,
      image: imageController.text,
      requirePoint: int.tryParse(requirePointController.text) ?? 0,
    );
    try {
      if(editItem == null){
      await _database.write(rewardProductCollection, data: rewardItem.toJson());
    }else{
      await _database.update(rewardProductCollection,
       path: rewardItem.id, data: rewardItem.toJson());
    }
    Get.snackbar('Success', 'Uploaded successfully!');
    isLoading.value = false;
    } catch (e) {
      Get.snackbar('Fail', 'Try Again!');
    isLoading.value = false;
    }
  }
}