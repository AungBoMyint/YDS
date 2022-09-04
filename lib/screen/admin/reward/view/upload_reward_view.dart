import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/home_controller.dart';
import '../../../../data/constant.dart';
import '../controller/upload_reward_controller.dart';


class UploadReward extends StatefulWidget {
  const UploadReward({Key? key}) : super(key: key);

  @override
  State<UploadReward> createState() => _UploadRewardState();
}

class _UploadRewardState extends State<UploadReward> {
  final UploadRewardController controller = Get.find();
  final HomeController homecontroller = Get.find();

  @override
  void dispose() {
    homecontroller.setEditRewardItem(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBackground,
      appBar: AppBar(
        title: Text(
          homecontroller.editRewardItem.value == null ?
          "Upload Reward Item" : "Update Reward Item",
          style: TextStyle(color: Colors.black, fontSize: 14),
        ),
        elevation: 5,
        backgroundColor: detailBackgroundColor,
        leading: IconButton(
          onPressed: Get.back,
          icon: Icon(
            Icons.arrow_back,
            color: appBarTitleColor,
          ),
        ),
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.imageController,
                validator:(value) => controller.validator(
                  value,
                  "Image Link"
                ),
                decoration: InputDecoration(
                  hintText: 'Image Link',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.nameController,
                validator:(value) => controller.validator(
                  value,
                  "Name"
                ),
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.descController,
                validator: (value) => controller.validator(
                  value,
                  "Description"
                ),
                decoration: InputDecoration(
                  hintText: 'Description',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: TextFormField(
                controller: controller.requirePointController,
                keyboardType: TextInputType.number,
                validator:(value) => controller.validator(
                  value,
                  "Require Point"
                ),
                decoration: InputDecoration(
                  hintText: 'Require point',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Container(
              height: 50,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
              child: ElevatedButton(
                style: buttonStyle,
                onPressed: controller.uploadOrUpdate,
                child: Obx(
                  () => controller.isLoading.value
                      ? CircularProgressIndicator(
                          color: scaffoldBackground,
                        )
                      : Text((homecontroller.editRewardItem.value == null)
                      == false
                          ? "Edit"
                          : "upload"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
